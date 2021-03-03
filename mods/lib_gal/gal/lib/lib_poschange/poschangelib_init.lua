--poschangelib = {
--	player_pos_listeners = {},
--	walk_listeners = {},
--}

gal.lib.poschange.player_pos_listeners = {}
gal.lib.poschange.walk_listeners = {}



--dofile(minetest.get_modpath(minetest.get_current_modname()) .. '/register.lua')
dofile(gal.lib.poschange.path .. '/register.lua')

--[[
-- File table of contents
-- 1. Settings and utilities
-- 2. Player position listener functions
-- 3. On walk listener functions
-- 4. Tools for main loop
-- 5. Main loop
--]]

function gal.lib.poschange.setting_check_interval()
	return tonumber(minetest.settings:get('poschangelib_check_interval')) or 0.3
end
function gal.lib.poschange.setting_teleport_range()
	return tonumber(minetest.settings:get('poschangelib_teleport_range')) or 10
end

--- Table of already called listeners in main loop to prevent triggering them
-- more than once per loop (player) if they are registered for more than one event
-- (for example triggered on walk on multiple groups)
local triggered_listeners = {}
local function set_listener_triggered(listener_name, pos)
	if not triggered_listeners[listener_name] then
		triggered_listeners[listener_name] = {}
	end
	table.insert(triggered_listeners[listener_name], pos)
end

--- Internal utility to create an empty table on first registration.
-- @param mothertable The main table that will hold other tables.
-- @param item Key in the main table that should hold a table.
-- @return The table in mothertable.item, created if nil.
local function get_subtable_or_create(mothertable, item)
	if mothertable.item == nil then
		mothertable.item = {}
	end
	return mothertable.item
end

--- Check if a listener can be triggered
local function is_callable(listener_name, pos)
	-- Check if not aleady called
	if triggered_listeners[listener_name] then
		for _, trigg_pos in ipairs(triggered_listeners[listener_name]) do
			if vector.equals(trigg_pos, pos) then
				return false
			end
		end
	end
	-- Other checks will come here when required
	return true
end

local function copy_trigger_meta(meta)
	local new_meta = {}
	for i, key in pairs({'interpolated', 'teleported', 'source',
	'source_level',	'redo', 'covered'}) do
		new_meta[key] = meta[key]
	end
	if meta.player_pos then
		new_meta.player_pos = vector.new(meta.player_pos.x, meta.player_pos.y, meta.player_pos.z)
	end
	return new_meta
end



--- Trigger registered callbacks if not already triggered.
-- Reset triggered_listeners to be able to recall the callback.
local function trigger_player_position_listeners(player, old_pos, pos, trigger_meta)
	for name, callback in pairs(gal.lib.poschange.player_pos_listeners) do
		if is_callable(name, pos) then
			callback(player, old_pos, pos, trigger_meta)
			set_listener_triggered(name, pos)
		end
	end
end


--- Trigger a walk listener by it's name.
-- Never called directly, use trigger_player_walk_listener_by_* functions
local function trigger_player_walk_listeners(trigger_name, player, pos, node, node_def, trigger_meta)
	for listener_name, callback in pairs(gal.lib.poschange.walk_listeners[trigger_name]) do
		if is_callable(listener_name, pos) then
			callback(player, pos, node, node_def, trigger_meta)
			set_listener_triggered(listener_name, pos)
		end
	end
end

--- Check if a walk listener can be triggered by node name and trigger it.
-- Trigger meta is copied and extended before being passed to the listeners.
local function trigger_player_walk_listeners_by_node_name(player, pos, node, node_def, trigger_meta)
	if gal.lib.poschange.walk_listeners[node.name] then
		local new_meta = copy_trigger_meta(trigger_meta)
		new_meta.source = node.name
		trigger_player_walk_listeners(node.name, player, pos, node, node_def, new_meta)
	end
end

--- Check if a walk listener can be triggered by node groups and trigger it.
-- Trigger meta is copied and extended before being passed to the listeners.
local function trigger_player_walk_listeners_by_node_group(player, pos, node, node_def, trigger_meta)
	local groups_below = node_def.groups
	if groups_below then
		for group, level in pairs(groups_below) do
			local group_name = 'group:' .. group
			if level > 0 and gal.lib.poschange.walk_listeners[group_name] then
				local new_meta = copy_trigger_meta(trigger_meta)
				new_meta.source = group
				new_meta.source_level = level
				trigger_player_walk_listeners(group_name, player, pos, node, node_def, new_meta)
			end
		end
	end
end

local function trigger_on_walk(player, pos, node, node_def, trigger_meta)
	if node_def._on_walk then
		node_def._on_walk(pos, node, player, copy_trigger_meta(trigger_meta))
	elseif node_def.on_walk then
		node_def.on_walk(pos, node, player, copy_trigger_meta(trigger_meta))
	end
end


--[[
-- Tools for main loop
--]]

--- Table of last rounded registered position of each players.
local player_last_pos = {}
local function remove_last_pos_on_leave(player)
	player_last_pos[player:get_player_name()] = nil
end
minetest.register_on_leaveplayer(remove_last_pos_on_leave)

--- Erratically get a path from start_pos and end_pos. This won't be 100%
-- accurate for many reasons.
--  - We don't know if a node is passable or not.
--  - There may be multiple options to get from one point to an other with the
--    same length
--  - The player may not even walk straight
-- This function is recursive, start will move toward end.
-- @param start_pos Full coortinate of starting point (recursive)
-- @param end_pos The goal
-- @param path Empty at start, will contains all points between start and end
-- at the last call, then return up all the way to the first call.
function gal.lib.poschange.get_path(start_pos, end_pos, path)
	-- Try to get closer to end_pos by moving one block in the axis that
	-- is the further from end. If at the same distance for more than one
	-- axis, pick randomly between them.
	if path == nil then path = {} end
	table.insert(path, start_pos)
	local distance = vector.subtract(end_pos, start_pos)
	-- Check for teleportation
	local teleport_range = gal.lib.poschange.setting_teleport_range()
	local dX = math.abs(distance.x)
	local dY = math.abs(distance.y)
	local dZ = math.abs(distance.z)
	if (dX + dY + dZ <= 1) or
		(teleport_range > 0 and dX + dY + dZ > teleport_range) then
		-- Next step will reach end_pos
		-- or teleported
		table.insert(path, end_pos)
		return path
	end
	local d = {} -- List of candidates axis for next move
	if dX >= dY and dX >= dZ then table.insert(d, 'x') end
	if dY >= dX and dY >= dZ then table.insert(d, 'y') end
	if dZ >= dX and dZ >= dY then table.insert(d, 'z') end
	local axis = d[math.random(1, table.getn(d))]
	local next_pos = nil
	if axis == 'x' then
		if distance.x > 0 then
			next_pos = vector.add(start_pos, vector.new(1,0,0))
		else
			next_pos = vector.add(start_pos, vector.new(-1,0,0))
		end
	elseif axis == 'y' then
		if distance.y > 0 then
			next_pos = vector.add(start_pos, vector.new(0,1,0))
		else
			next_pos = vector.add(start_pos, vector.new(0,-1,0))
		end
	elseif axis == 'z' then
		if distance.z > 0 then
			next_pos = vector.add(start_pos, vector.new(0,0,1))
		else
			next_pos = vector.add(start_pos, vector.new(0,0,-1))
		end
	end
	if axis == nil then
		minetest.log('error', 'poschangelib interpolator is lost')
		return path
	end
	return gal.lib.poschange.get_path(next_pos, end_pos, path)
end

--- Check if position has changed for the player.
-- @param player The player object.
-- @returns List of positions from last known to current
-- (with guessed interpolation) if the position has changed, nil otherwise.
local function get_updated_positions(player)
	local pos = vector.round(player:get_pos())
	local old_pos = player_last_pos[player:get_player_name()]
	local ret = nil
	if old_pos == nil then
		-- Position of the player was set
		ret = {pos}
	elseif pos then
		-- Check for position change
		if not vector.equals(old_pos, pos) then
			ret = gal.lib.poschange.get_path(old_pos, pos)
		end
	end
	player_last_pos[player:get_player_name()] = pos
	return ret
end

--- Check and call on_walk triggers if required.
local function check_on_walk_triggers(player, old_pos, pos, trigger_meta)
	if trigger_meta == nil then trigger_meta = {} end
	-- Get the node at current player position to check if in mid-air
	-- or on a half-filled node.
	local pos_below = pos
	local node_below = minetest.get_node(pos)
	local node_def = minetest.registered_nodes[node_below.name]
	if not node_def then return end -- Unknown node, don't crash
	-- When the feet are not directly on the node below, the player may be
	-- in-air or standing on a non-filled walkable block.
	-- Pass this information to the listener in case they want a fine
	-- collision checking.
	if not trigger_meta.interpolated then
		trigger_meta.player_pos = pos
	end
	if not node_def.walkable then
		-- Player not standing in a non-filled node
		-- Check node below, if walkable consider the player is walking
		-- on it (not 100% accurate)
		local node_above = node_below
		local node_above_def = node_def
		pos_below = vector.new(pos.x, pos.y - 1, pos.z)
		node_below = minetest.get_node(pos_below)
		node_def = minetest.registered_nodes[node_below.name]
		if not node_def then return end
		if not node_def.walkable then return end -- truely not walking
		-- We have checked the node above, see if it covers the one below
		-- and trigger walk for that node.
		if node_above.name ~= 'air' then
			trigger_player_walk_listeners_by_node_name(player, pos, node_above, node_above_def, trigger_meta)
			trigger_player_walk_listeners_by_node_group(player, pos, node_above, node_above_def, trigger_meta)
			trigger_on_walk(player, pos, node_above, node_above_def, trigger_meta)
			-- Set covered for the node below
			trigger_meta.covered = true
		end
	else
		-- Player standing inside a walkable node (like a slab or snow).
		-- But when coming from above (hooked to a nearby filled node)
		-- it may have already been triggered (but maybe ignored because
		-- it had a fine collision check).
		if old_pos.y - 1 == pos.y then
			-- Already triggered from above, pass this information
			trigger_meta.redo = true
		end
	end
	-- Triggers
	trigger_player_walk_listeners_by_node_name(player, pos_below, node_below, node_def, trigger_meta)
	trigger_player_walk_listeners_by_node_group(player, pos_below, node_below, node_def, trigger_meta)
	trigger_on_walk(player, pos_below, node_below, node_def, trigger_meta)
end


--dofile(minetest.get_modpath(minetest.get_current_modname()) .. '/stomping.lua')
dofile(gal.lib.poschange.path .. '/stomping.lua')
--[[
-- Main loop
--]]

local function loop()
	local teleport_range = gal.lib.poschange.setting_teleport_range()
	-- Player checks
	for _, player in ipairs(minetest.get_connected_players()) do
		local poss = get_updated_positions(player)
		if poss then
			local pos_count = table.getn(poss)
			if pos_count == 1 then
				-- Moved from nil to a given position
				trigger_player_position_listeners(player, nil, poss[0])
			elseif pos_count == 2 then
				-- Non-interpolated movement
				local teleported = false
				local trigger_meta = {}
				if teleport_range > 0 and vector.distance(poss[1], poss[2]) >= teleport_range then
					trigger_meta.teleported = true
				end
				trigger_player_position_listeners(player, poss[1], poss[2], trigger_meta)
				check_on_walk_triggers(player, poss[1], poss[2], trigger_meta)
			else
				-- Interpolated movement
				local poss_end_couple = table.getn(poss) - 1
				for i = 1, poss_end_couple do
					local trigger_meta = {}
					if i > 1 and i <= poss_end_couple then
						trigger_meta.interpolated = true
					end
					trigger_player_position_listeners(player, poss[i], poss[i+1], trigger_meta)
					check_on_walk_triggers(player, poss[i], poss[i+1], trigger_meta)
				end
			end
			-- Reset the triggered listener to allow the next player to trigger them
			triggered_listeners = {}
		end
	end
	minetest.after(gal.lib.poschange.setting_check_interval(), loop)
end
minetest.after(gal.lib.poschange.setting_check_interval(), loop)

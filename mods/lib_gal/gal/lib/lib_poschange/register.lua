--[[ 
-- Player position listeners
--]]

--- Register a callback that will be called everytime a player moves.
-- @param name Unique name of the callback. Used to remove.
-- @param callback Callback function. Take <player>, <old_pos>, <new_pos> arguments.
-- The first call will have <old_pos> set to nil.
function gal.lib.poschange.add_player_pos_listener(name, callback)
	if gal.lib.poschange.player_pos_listeners[name] then
		minetest.log('error', 'Player pos listener ' .. name .. ' is already registered')
		return
	end
	gal.lib.poschange.player_pos_listeners[name] = callback
end

--- Remove a registered callback. It won't be called anymore.
function gal.lib.poschange.remove_player_pos_listener(name)
	if gal.lib.poschange.player_pos_listeners[name] then
		gal.lib.poschange.player_pos_listeners[name] = nil
	end
end

--[[
-- Walk listeners
--]]

--- Register a callback that will be called everytime a player moves on a block.
-- @param callback Callback function. Takes <player>, <pos>, <node>,
-- <node definition> as arguments.
-- Node is the node below the player's position.
-- @param nodenames List of node names or group (with 'group:X') to observe.
-- The callback will be triggered only if the block has the same name or
-- has one of these groups.
function gal.lib.poschange.add_player_walk_listener(name, callback, nodenames)
	for _, nodename in ipairs(nodenames) do
		if not gal.lib.poschange.walk_listeners[nodename] then
			gal.lib.poschange.walk_listeners[nodename] = {}
		end
		if gal.lib.poschange.walk_listeners[nodename][name] then
			minetest.log('error', 'Walk listener ' .. name .. ' is already registered')
		end
		gal.lib.poschange.walk_listeners[nodename][name] = callback
	end
end

function gal.lib.poschange.remove_player_walk_listener(name, nodenames)
	local counts = {}
	for _, nodename in ipairs(nodenames) do
		if not counts[nodename] then counts[nodename] = 0 end
		counts[nodename] = counts[nodename] + 1
		if gal.lib.poschange.walk_listeners[nodename] and gal.lib.poschange.walk_listeners[nodename][name] then
			gal.lib.poschange.walk_listeners[nodename][name] = nil
			counts[nodename] = counts[nodename] - 1
		end
	end
	-- If no listener left for the group, remove the group
	-- to be able to skip node check if there are none left
	for _, nodename in pairs(counts) do
		if counts[nodename] == 0 then
			gal.lib.poschange.walk_listeners[nodename] = nil
		end
	end
end

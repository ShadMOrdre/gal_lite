--[[
Add natural slopes to Minetest Game
--]]
--local path = minetest.get_modpath(minetest.get_current_modname())
--dofile(path .."/functions.lua")
--dofile(path .."/nodes.lua")

local S = gal.intllib

	local exclude_list = {
		"brick",
		"block",
		"cobble",
		"ore",
		"door",
		"gate",
		"fence",
		"beam",
		"ceiling",
		"pane",
		"step",
		"pillar",
		"wall",
		"stairs",
		"slab",
		"rail",
		"roof",
		"deco",
		"naturalslopeslib",
		"shape",
		"slope",
		"pike",
		"inner",
		"outer",
		"tile",
		"ladder",
		"egypt",
	}
	local exclude_groups = {
		"lib_shaped_node",
		"lib_sloped_node",
	}

	for node_name, node_def in pairs(minetest.registered_nodes) do

		local exclude = false

		for ex, ex_l in pairs(exclude_list) do
			if string.find(node_name, ex_l) then
				exclude = true
			end
		end
	
		if exclude == false then
			--if not (string.find(node_name, exclude) or string.find(node_name, "block") or string.find(node_name, "cobble") or string.find(node_name, "pillar") 
			--	or string.find(node_name, "ore")) or (not string.find(node_name, "shape")) or (not string.find(node_name, "deco")) or (not string.find(node_name, "slope_")) 
			--	or string.find(node_name, "door")) or (not string.find(node_name, "gate")) or (not string.find(node_name, "fence")) or (not string.find(node_name, "rail")) 
			--	or string.find(node_name, "stairs")) or (not string.find(node_name, "slab")) or (not string.find(node_name, "wall")) or (not string.find(node_name, "roof")) 
			--	or string.find(node_name, "tile")) or (not string.find(node_name, "naturalslopeslib")) 
			--then

			local ex_grp = false

			for g_ex, grp_ex in pairs(exclude_groups) do
				if node_def.groups and node_def.groups[grp_ex] and node_def.groups[grp_ex] > 0 then
					ex_grp = true
				end
			end

			if ex_grp == false then

				if node_name == "gal:stone" then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						},
						1
					)
				end

				if string.find(node_name, "gal:stone_") then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						},
						1
					)
				end

				if string.find(node_name, "gal:ice") then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						},
						1
					)
				end

				--if string.find(node_name, "clay") then
				--	naturalslopeslib.register_slope(""..node_name.."", {
				--		description = S(""..node_def.description.." Slope"),
				--		},
				--		1
				--	)
				--end

				if node_name == "gal:dirt" then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						tiles = {
							node_def.tiles[1],
							node_def.tiles[2],
							node_def.tiles[3],
						},
						},
						1
					)
				end

				if string.find(node_name, "gal:dirt_") then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						tiles = {
							node_def.tiles[1],
							node_def.tiles[2],
							node_def.tiles[3],
						},
						},
						1
					)
				end

				if node_name == "gal:sand" then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						},
						1
					)
				end

				if string.find(node_name, "gal:sand_") then
					naturalslopeslib.register_slope(""..node_name.."", {
						description = S(""..node_def.description.." Slope"),
						},
						1
					)
				end

			end
		end
	end
		

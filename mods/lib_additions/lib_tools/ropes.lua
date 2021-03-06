minetest.register_node("lib_tools:ropes",{
	description = "Rope",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=1},
	paramtype = "light",
	climbable = true,
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
})

minetest.register_craft({
	output = "lib_tools:ropes",
	recipe = {
		{"farming:string"},
		{"farming:string"},
		{"farming:string"},
	}
})

minetest.register_node("lib_tools:box_rope", {
	description = "Rope from Ropebox",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {not_in_creative_inventory=1},
	climbable = true,
	walkable = false,
	diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "lib_tools:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_node("lib_tools:ropebox", {
	description = "Ropebox",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropebox_top.png",
		"castle_ropebox_top.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_2.png",
		"castle_ropebox_side_2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16},
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16},
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16},
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "lib_tools:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_abm({
	nodenames = {"lib_tools:ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="lib_tools:box_rope"})
	end
})

minetest.register_abm({
	nodenames = {"lib_tools:box_rope"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="lib_tools:box_rope"})
	end
})

minetest.register_craft({
	output = "lib_tools:ropebox",
	recipe = {
		{"default:wood"},
		{"lib_tools:ropes"},
	}
})


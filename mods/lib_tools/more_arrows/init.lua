
rcbows.register_arrow("more_arrows:boom_arrow", {
	projectile_texture = "more_arrows_proyectile_arrow",
	damage = 7,
	inventory_arrow = {
		name = "more_arrows:inv_boom_arrow",
		description = "Boom Arrow",
		inventory_image = "more_arrows_arrow_boom.png",
	},
	drop = "more_arrows:inv_boom_arrow",
	effects = {
		explosion = { mod = "tnt", radius= 2, damage = 7, }, 
	}
})


rcbows.register_arrow("more_arrows:big_boom_arrow", {
	projectile_texture = "more_arrows_proyectile_arrow",
	damage = 14,
	inventory_arrow = {
		name = "more_arrows:inv_big_boom_arrow",
		description = "Big Boom Arrow",
		inventory_image = "more_arrows_arrow_big_boom.png",
	},
	drop = "more_arrows:inv_big_boom_arrow",
	effects = {
		explosion = { mod = "tnt", radius= 5, damage = 14, }, 
	}
})


minetest.register_craft({
	output = "more_arrows:inv_boom_arrow 2",
	type = "shaped",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "default:torch", "tnt:tnt_stick"},
		{"farming:cotton", "", ""},
	}
})

minetest.register_craft({
	output = "more_arrows:inv_big_boom_arrow 2",
	type = "shaped",
	recipe = {
		{"", "", "default:steel_ingot"},
		{"", "default:torch", "tnt:tnt"},
		{"farming:cotton", "", ""},
	}
})


rcbows.register_bow("more_arrows:crossbow", {
	description = "Heavy Crossbow",
	image = "more_arrows_crossbow.png",
	strength = 120,
	uses = 1000,
	charge_time = 1.0,
	recipe = {
		{"", "default:steel_ingot", "farming:string"},
		{"farbows:tripwire", "", "farming:string"},
		{"", "default:steel_ingot", "farming:string"},
	},
	base_texture = "more_arrows_base_crossbow.png",
	overlay_empty = "more_arrows_crossbow_overlay_empty.png",
	overlay_charged = "more_arrows_crossbow_overlay_charged.png",
	arrows = {"farbows:e_arrow","more_arrows:boom_arrow","more_arrows:big_boom_arrow"},
	sounds = {
		max_hear_distance = 10,
		gain = 0.4,
	}
})

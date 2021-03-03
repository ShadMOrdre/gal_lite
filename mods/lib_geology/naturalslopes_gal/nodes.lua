local S = minetest.get_translator("naturalslopes_minetest_game")

---
--- Stone slopes
---

naturalslopeslib.register_slope("default:stone", {
	description = S("Stone Slope"),
	},
	100
)

naturalslopeslib.register_slope("default:desert_stone", {
	description = S("Desert Stone Slope"),
	},
	100
)

naturalslopeslib.register_slope("default:sandstone", {
	description = S("Sandstone Slope"),
	drop = "default:sandstone",
	},
	80
)

naturalslopeslib.register_slope("default:desert_sandstone", {
	description = S("Desert Sandstone Slope"),
	drop = "default:desert_sandstone",
	},
	80
)

naturalslopeslib.register_slope("default:silver_sandstone", {
	description = S("Desert Sandstone Slope"),
	drop = "default:silver_sandstone",
	},
	80
)

---
--- Soft / Non-Stone slopes
---

naturalslopeslib.register_slope("default:dirt", {
	description = S("Dirt Slope"),
	drop = "default:dirt",
	},
	10
)

naturalslopeslib.register_slope("default:dirt_with_grass", {
	description = S("Dirt with Grass Slope"),
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png"}}
	},
	25
)

naturalslopeslib.register_slope("default:dirt_with_dry_grass", {
	description = S("Dirt with Dry Grass Slope"),
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png"}}
	},
	20
)

naturalslopeslib.register_slope("default:dirt_with_snow", {
	description = S("Dirt with Snow Slope"),
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png"}}
	},
	25
)

naturalslopeslib.register_slope("default:dirt_with_rainforest_litter", {
	description = S("Dirt with Rainforest Litter Slope"),
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png"}}
	},
	15
)

naturalslopeslib.register_slope("default:dirt_with_coniferous_litter", {
	description = S("Dirt with Coniferous Litter Slope"),
	tiles = {
		"default_coniferous_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_coniferous_litter_side.png"}}
	},
	15
)

naturalslopeslib.register_slope("default:dry_dirt", {
	description = S("Savanna Dirt Slope"),
	drop = "default:dry_dirt",
	},
	6
)

naturalslopeslib.register_slope("default:dry_dirt_with_dry_grass", {
	description = S("Savanna Dirt with Savanna Grass Slope"),
	tiles = {"default_dry_grass.png", "default_dry_dirt.png",
		{name = "default_dry_dirt.png^default_dry_grass_side.png"}}
	},
	20
)

naturalslopeslib.register_slope("default:permafrost", {
	description = S("Permafrost Slope"),
	drop = "default:permafrost",
	},
	30
)

naturalslopeslib.register_slope("default:permafrost_with_stones", {
	description = S("Permafrost with Stones Slope"),
	drop = "default:permafrost_with_stones",
	},
	30
)

naturalslopeslib.register_slope("default:permafrost_with_moss", {
	description = S("Permafrost with Moss Slope"),
	drop = "default:permafrost_with_moss",
	tiles = {"default_moss.png", "default_permafrost.png",
		{name = "default_permafrost.png^default_moss_side.png"}},
	},
	30
)

naturalslopeslib.register_slope("default:sand", {
	description = S("Sand Slope"),
	drop = "default:sand",
	},
	5
)
naturalslopeslib.register_slope("default:desert_sand", {
	description = S("Desert Sand Slope"),
	drop = "default:desert_sand",
	},
	5
)
naturalslopeslib.register_slope("default:silver_sand", {
	description = S("Silver Sand Slope"),
	drop = "default:silver_sand",
	},
	5
)

naturalslopeslib.register_slope("default:gravel", {
	description = S("Gravel Slope"),
	drop = "default:gravel",
	},
	7
)

naturalslopeslib.register_slope("default:clay", {
	description = S("Clay Slope"),
	},
	15
)

naturalslopeslib.register_slope("default:snowblock", {
	description = S("Snow Block Slope"),
	drop = "default:snowblock",
	},
	4
)

---
--- Trees
---

naturalslopeslib.register_slope("default:leaves", {
	description = S("Apple Tree Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:jungleleaves", {
	description = S("Jungle Tree Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:pine_needles", {
	description = S("Pine Needles Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:acacia_leaves", {
	description = S("Acacia Tree Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:aspen_leaves", {
	description = S("Aspen Tree Leaves Slope"),
	},
	2
)


---
--- Plantlife
---

naturalslopeslib.register_slope("default:bush_leaves", {
	description = S("Bush Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:blueberry_bush_leaves_with_berries", {
	description = S("Blueberry Bush Leaves with Berries Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:blueberry_bush_leaves", {
	description = S("Blueberry Bush Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:acacia_bush_leaves", {
	description = S("Acacia Bush Leaves Slope"),
	},
	2
)

naturalslopeslib.register_slope("default:pine_bush_needles", {
	description = S("Pine Bush Needles Slope"),
	},
	2
)

--[[
Add natural slopes to Minetest Game
--]]

local p_select = gal_geology.palette_select
local p_sat = gal_geology.palette_sat

local TEST_GRASS_PALETTE_1 = "#69e942:80"
local TEST_GRASS_PALETTE_2 = "#b1e436:80"
local TEST_GRASS_PALETTE_3 = "#dacf61:80"
local TEST_GRASS_PALETTE_4 = "#fcd953:80"
local TEST_GRASS_DRY_PALETTE_1 = "#ace943:80"
local TEST_GRASS_DRY_PALETTE_2 = "#e4d136:80"
local TEST_GRASS_DRY_PALETTE_3 = "#daa062:80"
local TEST_GRASS_DRY_PALETTE_4 = "#fc9754:80"
local TEST_GRASS_BROWN_PALETTE_1 = "#e9df43:80"
local TEST_GRASS_BROWN_PALETTE_2 = "#e48836:80"
local TEST_GRASS_BROWN_PALETTE_3 = "#da6e62:80"
local TEST_GRASS_BROWN_PALETTE_4 = "#fc5458:80"
local TEST_GRASS_BLUE_PALETTE_1 = "#43e9a5:80"
local TEST_GRASS_BLUE_PALETTE_2 = "#36e44b:80"
local TEST_GRASS_BLUE_PALETTE_3 = "#81da62:80"
local TEST_GRASS_BLUE_PALETTE_4 = "#93fc54:80"


local TEST_GRASS_TEXTURE_TOP = "lib_materials_grass_default_top.png"
local TEST_GRASS_TEXTURE_SIDE = "lib_materials_grass_default_side.png"
local TEST_GRASS_BROWN_TEXTURE_TOP = "lib_materials_grass_brown_top.png"
local TEST_GRASS_BROWN_TEXTURE_SIDE = "lib_materials_grass_brown_side.png"
local TEST_GRASS_DRY_TEXTURE_TOP = "lib_materials_grass_dry_default_top.png"
local TEST_GRASS_DRY_TEXTURE_SIDE = "lib_materials_grass_dry_default_side.png"
local TEST_GRASS_JUNGLE_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
local TEST_GRASS_JUNGLE_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
local TEST_GRASS_GREY_TEXTURE_TOP = "lib_materials_grass_dry_bw_top.png"
local TEST_GRASS_GREY_TEXTURE_SIDE = "lib_materials_grass_dry_bw_side.png"
local TEST_GRASS_DK_GREY_TEXTURE_TOP = "lib_materials_grass_bw_top.png"
local TEST_GRASS_DK_GREY_TEXTURE_SIDE = "lib_materials_grass_bw_side.png"
local TEST_GRASS_JUNGLE_GREY_TEXTURE_TOP = "lib_materials_grass_jungle_01_bw_top.png"
local TEST_GRASS_JUNGLE_GREY_TEXTURE_SIDE = "lib_materials_grass_jungle_01_bw_side.png"
local TEST_GRASS_BROWN_GREY_TEXTURE_TOP = "lib_materials_grass_brown_bw_top.png"
local TEST_GRASS_BROWN_GREY_TEXTURE_SIDE = "lib_materials_grass_brown_bw_side.png"

local GRASS_HUMID_TEXTURE_TOP = ""
local GRASS_HUMID_TEXTURE_SIDE = ""
local GRASS_SEMIHUMID_TEXTURE_TOP = ""
local GRASS_SEMIHUMID_TEXTURE_SIDE = ""
local GRASS_TEMPERATE_TEXTURE_TOP = ""
local GRASS_TEMPERATE_TEXTURE_SIDE = ""
local GRASS_SEMIARID_TEXTURE_TOP = ""
local GRASS_SEMIARID_TEXTURE_SIDE = ""
if gal_geology.color_grass_use then
	GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	--GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	--GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	--GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_default_top.png"
	--GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_default_side.png"
	--GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_dry_default_top.png"
	--GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_dry_default_side.png"
	--GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_brown_top.png"
	--GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_brown_side.png"
	----GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_jungle_01_top.png"
	----GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_jungle_01_side.png"
	----GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_default_top.png"
	----GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_default_side.png"
	----GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_dry_default_top.png"
	----GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_dry_default_side.png"
	----GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_brown_top.png"
	----GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_brown_side.png"
else
	GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_heat_hot_top.png"
	GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_heat_hot_side.png"
	GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_heat_warm_top.png"
	GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_heat_warm_side.png"
	GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_heat_temperate_top.png"
	GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_heat_temperate_side.png"
	GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_heat_cool_top.png"
	GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_heat_cool_side.png"
	--GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_humid_top.png"
	--GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_humid_side.png"
	--GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_humid_top.png"
	--GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_humid_side.png"
	--GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_humid_top.png"
	--GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_humid_side.png"
	--GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_humid_top.png"
	--GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_humid_side.png"
	----GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_humid_top.png"
	----GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_humid_side.png"
	----GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_semihumid_top.png"
	----GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_semihumid_side.png"
	----GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_temperate_top.png"
	----GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_temperate_side.png"
	----GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_semiarid_top.png"
	----GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_semiarid_side.png"
	------GRASS_HUMID_TEXTURE_TOP = "lib_materials_grass_coastal_top.png"
	------GRASS_HUMID_TEXTURE_SIDE = "lib_materials_grass_coastal_side.png"
	------GRASS_SEMIHUMID_TEXTURE_TOP = "lib_materials_grass_lowland_top.png"
	------GRASS_SEMIHUMID_TEXTURE_SIDE = "lib_materials_grass_lowland_side.png"
	------GRASS_TEMPERATE_TEXTURE_TOP = "lib_materials_grass_shelf_top.png"
	------GRASS_TEMPERATE_TEXTURE_SIDE = "lib_materials_grass_shelf_side.png"
	------GRASS_SEMIARID_TEXTURE_TOP = "lib_materials_grass_highland_top.png"
	------GRASS_SEMIARID_TEXTURE_SIDE = "lib_materials_grass_highland_side.png"
end

local GRASS_HUMID_PALETTE_1
local GRASS_HUMID_PALETTE_2
local GRASS_HUMID_PALETTE_3
local GRASS_HUMID_PALETTE_4
local GRASS_SEMIHUMID_PALETTE_1
local GRASS_SEMIHUMID_PALETTE_2
local GRASS_SEMIHUMID_PALETTE_3
local GRASS_SEMIHUMID_PALETTE_4
local GRASS_TEMPERATE_PALETTE_1
local GRASS_TEMPERATE_PALETTE_2
local GRASS_TEMPERATE_PALETTE_3
local GRASS_TEMPERATE_PALETTE_4
local GRASS_SEMIARID_PALETTE_1
local GRASS_SEMIARID_PALETTE_2
local GRASS_SEMIARID_PALETTE_3
local GRASS_SEMIARID_PALETTE_4

if p_select == "alt" then
	GRASS_HUMID_PALETTE_1 = "#45ae63:" .. p_sat ..""
	GRASS_HUMID_PALETTE_2 = "#46ae39:" .. p_sat ..""
	GRASS_HUMID_PALETTE_3 = "#74ab48:" .. p_sat ..""
	GRASS_HUMID_PALETTE_4 = "#87bf44:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_1 = "#60b036:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_2 = "#8cb032:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_3 = "#a9a84b:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_4 = "#c3b046:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_1 = "#9cb43c:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_2 = "#b6ab38:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_3 = "#b99551:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_4 = "#d4934e:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_1 = "#b9b23f:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_2 = "#bf8a3c:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_3 = "#c27e55:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_4 = "#c57460:" .. p_sat ..""
elseif p_select == "duane" then
	GRASS_HUMID_PALETTE_4 = "#487221:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_4 = "#647b2c:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_4 = "#748032:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_4 = "#9d8b42:" .. p_sat ..""
	GRASS_HUMID_PALETTE_3 = "#487221:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_3 = "#647b2c:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_3 = "#748032:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_3 = "#9d8b42:" .. p_sat ..""
	GRASS_HUMID_PALETTE_2 = "#487221:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_2 = "#647b2c:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_2 = "#748032:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_2 = "#9d8b42:" .. p_sat ..""
	GRASS_HUMID_PALETTE_1 = "#487221:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_1 = "#647b2c:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_1 = "#748032:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_1 = "#9d8b42:" .. p_sat ..""
--elseif p_select == "duane" then
--	GRASS_HUMID_PALETTE_4 = "#7a8134:" .. p_sat ..""
--	GRASS_SEMIHUMID_PALETTE_4 = "#8b863a:" .. p_sat ..""
--	GRASS_TEMPERATE_PALETTE_4 = "#ac8f48:" .. p_sat ..""
--	GRASS_SEMIARID_PALETTE_4 = "#bd944e:" .. p_sat ..""
--	GRASS_HUMID_PALETTE_3 = "#677c2d:" .. p_sat ..""
--	GRASS_SEMIHUMID_PALETTE_3 = "#788034:" .. p_sat ..""
--	GRASS_TEMPERATE_PALETTE_3 = "#988a40:" .. p_sat ..""
--	GRASS_SEMIARID_PALETTE_3 = "#a98e47:" .. p_sat ..""
--	GRASS_HUMID_PALETTE_2 = "#577827:" .. p_sat ..""
--	GRASS_SEMIHUMID_PALETTE_2 = "#687d2e:" .. p_sat ..""
--	GRASS_TEMPERATE_PALETTE_2 = "#88863a:" .. p_sat ..""
--	GRASS_SEMIARID_PALETTE_2 = "#998b41:" .. p_sat ..""
--	GRASS_HUMID_PALETTE_1 = "#487221:" .. p_sat ..""
--	GRASS_SEMIHUMID_PALETTE_1 = "#587727:" .. p_sat ..""
--	GRASS_TEMPERATE_PALETTE_1 = "#798034:" .. p_sat ..""
--	GRASS_SEMIARID_PALETTE_1 = "#89853a:" .. p_sat ..""
else
	GRASS_HUMID_PALETTE_1 = "#43e9a5:" .. p_sat ..""
	GRASS_HUMID_PALETTE_2 = "#36e44b:" .. p_sat ..""
	GRASS_HUMID_PALETTE_3 = "#81da62:" .. p_sat ..""
	GRASS_HUMID_PALETTE_4 = "#93fc54:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_1 = "#69e942:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_2 = "#b1e436:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_3 = "#dacf61:" .. p_sat ..""
	GRASS_SEMIHUMID_PALETTE_4 = "#fcd953:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_1 = "#ace943:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_2 = "#e4d136:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_3 = "#daa062:" .. p_sat ..""
	GRASS_TEMPERATE_PALETTE_4 = "#fc9754:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_1 = "#e9df43:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_2 = "#e48836:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_3 = "#da6e62:" .. p_sat ..""
	GRASS_SEMIARID_PALETTE_4 = "#fc5458:" .. p_sat ..""
end



--Sand Slopes
	natural_slopes.register_slope("gal:sand", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_default.png"},
		description = "Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_beach", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_beach.png"},
		description = "Beach Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_beach_wet", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_beach_wet.png"},
		description = "Beach Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_black", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_black.png"},
		description = "Black Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_desert", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_desert_default.png"},
		description = "Desert Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_iron", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"aotearoa_iron_sand.png"},
		description = "Iron Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_red", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_red.png"},
		description = "Red Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_silver", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_silver_default.png"},
		description = "Silver Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		5
	)
	natural_slopes.register_slope("gal:sand_volcanic", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_volcanic.png"},
		description = "Volcanic Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("gal:sand_volcanic2", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"aotearoa_volcanic_sand.png"},
		description = "Volcanic2 Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("gal:sand_white", {
		groups = {crumbly = 3, falling_node = 1, sand = 1},
		tiles = {"lib_materials_sand_white.png"},
		description = "White Sand slope",
		sounds = gal.node_sound_sand_defaults()},
		1
	)

--Stone Slopes
	natural_slopes.register_slope("gal:stone_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_gravel_default.png"},
		description = "Stone - Gravel slope",
		sounds = gal.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("gal:stone_desert_gravel", {
		groups = {crumbly = 3, falling_node = 1, gravel = 1},
		tiles = {"lib_materials_stone_desert_gravel.png"},
		description = "Stone - Desert Stone Gravel slope",
		sounds = gal.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("gal:stone_sandstone_desert_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_sandstone_desert_gravel.png"},
		description = "Stone - Desert Sandstone Gravel slope",
		sounds = gal.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("gal:stone_sandstone_white_gravel", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"lib_materials_stone_sandstone_white_gravel.png"},
		description = "Stone -  - White Sandstone Gravel slope",
		sounds = gal.node_sound_gravel_defaults()},
		5
	)
	natural_slopes.register_slope("gal:seashells", {
		groups = {crumbly = 3, falling_node = 1, sand = 1, gravel = 1},
		tiles = {"aotearoa_seashells.png"},
		description = "Seashells slope",
		sounds = gal.node_sound_gravel_defaults()},
		5
	)

--Dirt Slopes
	natural_slopes.register_slope("gal:dirt_with_stone_cobble", {
		groups = {crumbly = 3, falling_node = 1},
		tiles = {"lib_materials_stone_cobble_default.png^(lib_materials_dirt.png^[mask:lib_materials_mask_cobble.png)"},
		description = "Dirt with Stone Cobble slope",
		sounds = gal.node_sound_sand_defaults()},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_bamboo", {
		groups = {crumbly = 3},
		description = "Dirt with Bamboo Grass slope",
		tiles = {top = "lib_materials_grass_bamboo_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_bamboo_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_bamboo_side.png",tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_crystal", {
		groups = {crumbly = 3},
		description = "Dirt with Crystal Grass slope",
		tiles = {top = "lib_materials_grass_crystal_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_crystal_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_crystal_side.png",tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_cold", {
		groups = {crumbly = 3},
		description = "Dirt with Cold Grass slope",
		tiles = {top = "lib_materials_grass_cold_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_cold_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_cold_side.png",tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_fungi", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Fungi Covered slope",
		tiles = {top = "lib_materials_grass_fungi_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_fungi_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_fungi_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_gray", {
		groups = {crumbly = 3},
		description = "Dirt with Gray Grass slope",
		tiles = {top = "lib_materials_grass_gray_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_gray_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_gray_side.png",	tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_green", {
		description = "Dirt with Green Grass slope",
		tiles = {top = "lib_materials_grass_green_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_green_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_green_side.png", tileable_vertical = false}},
		groups = {crumbly = 3},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_grove", {
		groups = {crumbly = 3},
		description = "Dirt with Grove Grass slope",
		tiles = {top = "lib_materials_grass_grove_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_grove_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_grove_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_jungle_01", {
		groups = {crumbly = 3},
		description = "Dirt with Jungle 01 Grass slope",
		tiles = {top = "lib_materials_grass_jungle_01_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_jungle_01_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_jungle_01_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_jungle_02", {
		groups = {crumbly = 3},
		description = "Dirt with Jungle 02 Grass slope",
		tiles = {top = "lib_materials_grass_jungle_02_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_jungle_02_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_jungle_02_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_leafy", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Leaf Covered slope",
		tiles = {top = "lib_materials_grass_leafy_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_leafy_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_leafy_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_mushroom", {
		groups = {crumbly = 3},
		description = "Dirt with Mushroom Grass slope",
		tiles = {top = "lib_materials_grass_mushroom_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_mushroom_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_mushroom_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_prairie", {
		groups = {crumbly = 3},
		description = "Dirt with Prairie Grass slope",
		tiles = {top = "lib_materials_grass_prairie_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_prairie_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_prairie_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)
	natural_slopes.register_slope("gal:dirt_with_grass_swamp", {
		groups = {crumbly = 3},
		description = "Dirt With Grass - Swamp slope",
		tiles = {top = "lib_materials_grass_swamp_top.png",
			bottom = "lib_materials_dirt.png",
			front = "lib_materials_grass_swamp_top.png",
			side = {name = "lib_materials_dirt.png^lib_materials_grass_swamp_side.png", tileable_vertical = false}},
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)

--Grass slopes
local function register_dirt_slopes(readname)

	local name = readname:lower()
	local itemstr_dirt = "gal:" .. name
	local tilestr = "lib_materials_" .. name .. ".png"


	natural_slopes.register_slope(itemstr_dirt, {
		groups = {crumbly = 3},
		tiles = {tilestr},
		description = "Dirt slope",
		sounds = gal.node_sound_dirt_defaults({footstep = {['name'] = "default_grass_footstep", ['gain'] = 0.25},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_litter_coniferous", {
		description = readname .. " with Coniferous Litter slope",
		tiles = {top = "lib_materials_litter_coniferous.png",
			bottom = tilestr,
			front = "lib_materials_litter_coniferous.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_litter_rainforest", {
		description = readname .. " with Rainforest Litter slope",
		tiles = {top = "lib_materials_litter_rainforest.png",
			bottom = tilestr,
			front = "lib_materials_litter_rainforest.png",
			side = {name = tilestr .. "^lib_materials_litter_rainforest_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_soil", {
		description = readname .. " with Soil slope",
		tiles = {top = tilestr .. "^lib_materials_dirt_soil_mask.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_dirt_soil_mask.png",
			side = {name = tilestr,
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_dirt_footstep", gain = 0.15},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_soil_wet", {
		description = readname .. " with Wet Soil slope",
		tiles = {top = tilestr .. "^lib_materials_dirt_soil_wet_mask.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_dirt_soil_wet_mask.png",
			side = {name = tilestr .. "^lib_materials_ground_soil_wet_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_dirt_footstep", gain = 0.15},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_snow", {
		description = readname .. " with Snow slope",
		tiles = {top = "lib_materials_snow.png",
			bottom = tilestr,
			front = "lib_materials_snow.png",
			side = {name = tilestr .. "^lib_materials_snow.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, snowy = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_snow_footstep", gain = 0.15},})
		},
		1
	)

	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_fungi", {
		description = readname .. " with Fungal Litter",
		tiles = {top = "lib_materials_grass_fungi_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_fungi_top.png",
			side = {name = tilestr .. "^lib_materials_grass_fungi_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_leaf_01", {
		description = readname .. " with Leaf Litter 01",
		tiles = {top = tilestr .. "^lib_materials_litter_leaf_01.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_leaf_01.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_leaf_02", {
		description = readname .. " with Leaf Litter 02",
		tiles = {top = tilestr .. "^lib_materials_litter_leaf_02.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_leaf_02.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_stones", {
		description = readname .. " with Stone Litter",
		tiles = {top = tilestr .. "^lib_materials_litter_stones.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_stones.png",
			side = {name = tilestr .. "^lib_materials_litter_stones_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)
	natural_slopes.register_slope(itemstr_dirt .. "_with_litter_vine", {
		description = readname .. " with Vine Litter",
		tiles = {top = tilestr .. "^lib_materials_litter_vine.png",
			bottom = tilestr,
			front = tilestr .. "^lib_materials_litter_vine.png",
			side = {name = tilestr .. "^lib_materials_litter_coniferous_side.png",
				tileable_vertical = false}},
		groups = {crumbly=3,soil=1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name="default_grass_footstep", gain=0.25},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_grass", {
		description = readname .. " with Grass slope",
		tiles = {top = "lib_materials_grass_default_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_default_top.png",
			side = {name = tilestr .. "^lib_materials_grass_default_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_dry", {
		description = readname .. " with Dry Grass slope",
		tiles = {top = "lib_materials_grass_dry_default_top.png",
			bottom = tilestr,
			front = "lib_materials_grass_dry_default_top.png",
			side = {name = tilestr .. "^lib_materials_grass_dry_default_side.png",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
--[[	
	 natural_slopes.register_slope("gal:dirt_with_grass_brown", {
		 description = "Dirt with Brown Grass slope",
		 tiles = {top = "lib_materials_grass_brown_top.png",
			 bottom = "lib_materials_dirt.png",
			 front = "lib_materials_grass_brown_top.png",
			 side = {name = "lib_materials_dirt.png^(lib_materials_grass_brown_side.png)",
				 tileable_vertical = false}},
		 groups = {crumbly = 3, soil = 1},
		 sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		 },
		 1
	 )
--]]
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_hot_humid", {
		description = readname .. " with Grass (hot_humid) Slope",
		tiles = {top = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_4.."",
			bottom = tilestr,
			front = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_4.."",
			side = {name = tilestr .. "^("..GRASS_HUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_HUMID_PALETTE_4..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_hot_semihumid", {
		description = readname .. " with Grass (hot_semihumid) Slope",
		tiles = {top = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_4.."",
			bottom = tilestr,
			front = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_4.."",
			side = {name = tilestr .. "^("..GRASS_HUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_4..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_hot_temperate", {
		description = readname .. " with Grass (hot_temperate) Slope",
		tiles = {top = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_4.."",
			bottom = tilestr,
			front = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_4.."",
			side = {name = tilestr .. "^("..GRASS_HUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_TEMPERATE_PALETTE_4..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_hot_semiarid", {
		description = readname .. " with Grass (hot_semiarid) Slope",
		tiles = {top = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_4.."",
			bottom = tilestr,
			front = ""..GRASS_HUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_4.."",
			side = {name = tilestr .. "^("..GRASS_HUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIARID_PALETTE_4..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_grass_warm_humid", {
		description = readname .. " with Grass (warm_humid) Slope",
		tiles = {top = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_3.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_3.."",
			side = {name = tilestr .. "^("..GRASS_SEMIHUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_HUMID_PALETTE_3..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_warm_semihumid", {
		description = readname .. " with Grass (warm_semihumid) Slope",
		tiles = {top = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_3.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_3.."",
			side = {name = tilestr .. "^("..GRASS_SEMIHUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_3..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_warm_temperate", {
		description = readname .. " with Grass (warm_temperate) Slope",
		tiles = {top = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_3.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_3.."",
			side = {name = tilestr .. "^("..GRASS_SEMIHUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_TEMPERATE_PALETTE_3..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_warm_semiarid", {
		description = readname .. " with Grass (warm_semiarid) Slope",
		tiles = {top = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_3.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIHUMID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_3.."",
			side = {name = tilestr .. "^("..GRASS_SEMIHUMID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIARID_PALETTE_3..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_grass_temperate_humid", {
		description = readname .. " with Grass (temperate_humid) Slope",
		tiles = {top = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_2.."",
			bottom = tilestr,
			front = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_2.."",
			side = {name = tilestr .. "^("..GRASS_TEMPERATE_TEXTURE_SIDE.."^[colorize:"..GRASS_HUMID_PALETTE_2..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_temperate_semihumid", {
		description = readname .. " with Grass (temperate_semihumid) Slope",
		tiles = {top = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_2.."",
			bottom = tilestr,
			front = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_2.."",
			side = {name = tilestr .. "^("..GRASS_TEMPERATE_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_2..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_temperate_temperate", {
		description = readname .. " with Grass (temperate_temperate) Slope",
		tiles = {top = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_2.."",
			bottom = tilestr,
			front = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_2.."",
			side = {name = tilestr .. "^("..GRASS_TEMPERATE_TEXTURE_SIDE.."^[colorize:"..GRASS_TEMPERATE_PALETTE_2..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_temperate_semiarid", {
		description = readname .. " with Grass (temperate_semiarid) Slope",
		tiles = {top = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_2.."",
			bottom = tilestr,
			front = ""..GRASS_TEMPERATE_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_2.."",
			side = {name = tilestr .. "^("..GRASS_TEMPERATE_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIARID_PALETTE_2..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

	natural_slopes.register_slope("gal:" .. name .. "_with_grass_cool_humid", {
		description = readname .. " with Grass (cool_humid) Slope",
		tiles = {top = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_1.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_HUMID_PALETTE_1.."",
			side = {name = tilestr .. "^("..GRASS_SEMIARID_TEXTURE_SIDE.."^[colorize:"..GRASS_HUMID_PALETTE_1..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_cool_semihumid", {
		description = readname .. " with Grass (cool_semihumid) Slope",
		tiles = {top = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_1.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_1.."",
			side = {name = tilestr .. "^("..GRASS_SEMIARID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIHUMID_PALETTE_1..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_cool_temperate", {
		description = readname .. " with Grass (cool_temperate) Slope",
		tiles = {top = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_1.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_TEMPERATE_PALETTE_1.."",
			side = {name = tilestr .. "^("..GRASS_SEMIARID_TEXTURE_SIDE.."^[colorize:"..GRASS_TEMPERATE_PALETTE_1..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)
	natural_slopes.register_slope("gal:" .. name .. "_with_grass_cool_semiarid", {
		description = readname .. " with Grass (cool_semiarid) Slope",
		tiles = {top = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_1.."",
			bottom = tilestr,
			front = ""..GRASS_SEMIARID_TEXTURE_TOP.."^[colorize:"..GRASS_SEMIARID_PALETTE_1.."",
			side = {name = tilestr .. "^("..GRASS_SEMIARID_TEXTURE_SIDE.."^[colorize:"..GRASS_SEMIARID_PALETTE_1..")",
				tileable_vertical = false}},
		groups = {crumbly = 3, soil = 1},
		sounds = gal.node_sound_dirt_defaults({footstep = {name = "default_grass_footstep", gain = 0.4},})
		},
		1
	)

end


	register_dirt_slopes("Dirt")
	register_dirt_slopes("Dirt_Black")
	register_dirt_slopes("Dirt_Brown")
	register_dirt_slopes("Dirt_Clay")
	register_dirt_slopes("Dirt_Clay_Red")
	register_dirt_slopes("Dirt_Clay_White")
	register_dirt_slopes("Dirt_Clayey")
	register_dirt_slopes("Dirt_Coarse")
	register_dirt_slopes("Dirt_Compacted")
	register_dirt_slopes("Dirt_Dark")
	register_dirt_slopes("Dirt_Dried")
	register_dirt_slopes("Dirt_Dry")
	register_dirt_slopes("Dirt_Loam")
	register_dirt_slopes("Dirt_Mud_01")
	register_dirt_slopes("Dirt_Mud_02")
	register_dirt_slopes("Dirt_Mud_Dried")
	register_dirt_slopes("Dirt_Peat")
	register_dirt_slopes("Dirt_Permafrost")
	register_dirt_slopes("Dirt_Red")
	register_dirt_slopes("Dirt_Sandy")
	register_dirt_slopes("Dirt_Silt_01")
	register_dirt_slopes("Dirt_Silt_02")
	register_dirt_slopes("Dirt_Silt_03")
	register_dirt_slopes("Dirt_Silty")
	register_dirt_slopes("Dirt_Sod")








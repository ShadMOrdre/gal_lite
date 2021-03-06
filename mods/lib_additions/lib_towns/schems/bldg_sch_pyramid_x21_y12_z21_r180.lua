



local T = lib_towns.schems.T



--Air, Lava, and Water constants used throughout schematics
	local __ = T["_____"] or {name = "air", param2 = 0, prob = 0}

	local M0 = {param2 = 0, name = "gal:stone_sandstone", prob = 254}
	local M1 = {param2 = 0, name = "gal:stone_sandstone_brick", prob = 254}
	local M2 = {param2 = 0, name = "gal:stone_sandstone_block", prob = 254}

	local L0 = {param2 = 0, name = "gal:stone_sandstone_block_slab", prob = 254}
	local L1 = {param2 = 1, name = "gal:stone_sandstone_block_slab", prob = 254}
	local L3 = {param2 = 3, name = "gal:stone_sandstone_block_slab", prob = 254}
	local LN = {param2 = 4, name = "gal:stone_sandstone_block_slab", prob = 254}
	local LS = {param2 = 8, name = "gal:stone_sandstone_block_slab", prob = 254}
	local LE = {param2 = 12, name = "gal:stone_sandstone_block_slab", prob = 254}
	local LW = {param2 = 16, name = "gal:stone_sandstone_block_slab", prob = 254}
	
	local V0 = {param2 = 0, name = "decoblocks:Ancient_vase_sand", prob = 254}

	local C0 = {param2 = 0, name = "decoblocks:chest", prob = 254}
	
	local D0 = {param2 = 0, name = "decoblocks:dartblock", prob = 254}
	local D1 = {param2 = 1, name = "decoblocks:dartblock", prob = 254}
	local D2 = {param2 = 2, name = "decoblocks:dartblock", prob = 254}
	local D3 = {param2 = 3, name = "decoblocks:dartblock", prob = 254}
	
	local P0 = {param2 = 0, name = "decoblocks:sandstone_pillar", prob = 254}
	local P1 = {param2 = 1, name = "decoblocks:sandstone_pillar", prob = 254}
	local P2 = {param2 = 2, name = "decoblocks:sandstone_pillar", prob = 254}
	local P3 = {param2 = 3, name = "decoblocks:sandstone_pillar", prob = 254}
	local P5 = {param2 = 20, name = "decoblocks:sandstone_pillar", prob = 254}
	local P6 = {param2 = 21, name = "decoblocks:sandstone_pillar", prob = 254}
	local P7 = {param2 = 22, name = "decoblocks:sandstone_pillar", prob = 254}
	local P8 = {param2 = 23, name = "decoblocks:sandstone_pillar", prob = 254}

	local W0 = {param2 = 0, name = "decoblocks:sandstone_wall", prob = 254}
	local W1 = {param2 = 1, name = "decoblocks:sandstone_wall", prob = 254}
	local W2 = {param2 = 2, name = "decoblocks:sandstone_wall", prob = 254}
	local W3 = {param2 = 3, name = "decoblocks:sandstone_wall", prob = 254}

	
return {
	size = {x = 21,y = 12,z = 21},
	data = {
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M2, M1, M1, M1, M1, M1, M1, M1, M1, M2, M1, M1, M1, M1, M1, M1, M1, M1, M2, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, __,
		__, __, M2, M1, M1, M1, M1, M1, M1, M1, M2, M1, M1, M1, M1, M1, M1, M1, M2, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M1, M1, M1, M1, M1, W2, __, W1, M1, M1, M1, M1, M1, M1, M1, M1, __,
		__, __, M1, M1, M1, M1, M1, M1, M1, W1, __, W0, M1, M1, M1, M1, M1, M1, M1, __, __,
		__, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, M0, M0, M0, M0, M0, __, M0, M0, M0, M0, M0, M0, M1, M1, M1, __,
		__, __, M1, M1, M0, D2, D2, D2, M0, M0, __, M0, M0, D2, D2, D2, M0, M1, M1, __, __,
		__, __, __, M1, M1, M1, M1, M1, M1, M1, D2, M1, M1, M1, M1, M1, M1, M1, __, __, __,
		__, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, L3, V0, V0, W3, LN, __, LN, W3, V0, V0, L1, M0, M1, M1, M1, __,
		__, __, M1, M1, M0, LN, LN, LN, W2, LN, __, LN, W1, LN, LN, LN, M0, M1, M1, __, __,
		__, __, __, M1, M1, __, __, __, W1, LN, LN, LN, W2, __, __, __, M1, M1, __, __, __,
		__, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __,
		__, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, M1, __,
		__, __, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, __, __,
		__, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __,
		__, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __,
		__, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __,
		__, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, M1, __,
		__, __, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, __, __,
		__, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __,
		__, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __,
		__, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __,
		__, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __,
		__, __, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, LE, __, __, P2, __, __, __, P1, __, __, LW, M0, M1, M1, M1, __,
		__, __, M1, M1, M0, LE, __, __, P2, __, __, __, P1, __, __, LW, M0, M1, M1, __, __,
		__, __, __, M1, M1, LE, __, __, P2, __, __, __, P1, __, __, LW, M1, M1, __, __, __,
		__, __, __, __, M1, M1, __, __, P7, __, __, __, P8, __, __, M1, M1, __, __, __, __,
		__, __, __, __, __, M1, M1, __, P7, __, __, __, P8, __, M1, M1, __, __, __, __, __,
		__, __, __, __, __, __, M1, M1, P7, __, __, __, P8, M1, M1, __, __, __, __, __, __,
		__, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, M2, M1, M1, M1, M2, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, M2, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, M1, __,
		__, __, M1, M1, W3, __, __, __, __, __, __, __, __, __, __, __, W1, M1, M1, __, __,
		__, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __,
		__, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __,
		__, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __,
		__, __, __, __, __, __, M1, M1, __, __, __, __, __, M1, M1, __, __, __, __, __, __,
		__, __, __, __, __, __, __, M1, M1, __, __, __, M1, M1, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, M2, M1, M2, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, M2, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, LE, __, __, __, L0, __, L0, __, __, __, LW, M0, M1, M1, M1, __,
		__, __, M1, M1, D3, LE, __, __, __, __, __, __, __, __, __, LW, D1, M1, M1, __, __,
		__, __, __, M1, M1, LE, __, __, __, __, __, __, __, __, __, LW, M1, M1, __, __, __,
		__, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __,
		__, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __,
		__, __, __, __, __, __, M1, M1, __, __, __, __, __, M1, M1, __, __, __, __, __, __,
		__, __, __, __, __, __, __, M1, M1, __, __, __, M1, M1, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, M1, M1, __, M1, M1, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, M1, M1, M1, __, __, __, __, __, __, __, __, __,
		__, __, __, __, __, __, __, __, __, __, M2, __, __, __, __, __, __, __, __, __, __,

		M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, M2, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1,
		__, M1, M1, M1, M0, __, __, __, __, L0, C0, L0, __, __, __, {param2 = 1, name = "decoblocks:old_skeleton", prob = 254}, M0, M1, M1, M1, __, __, __, M1, M1, W3, __, __, __, __, __, __, __, __, __, __, __, W1, M1, M1, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M2, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M0, LE, __, __, P0, __, __, __, P1, __, __, LW, M0, M1, M1, M1, __, __, __, M1, M1, M0, LE, __, __, P0, __, __, __, P1, __, __, LW, M0, M1, M1, __, __, __, __, __, M1, M1, LE, __, __, P0, __, __, __, P1, __, __, LW, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, P5, __, __, __, P8, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, P5, __, __, __, P8, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, P6, __, __, __, P8, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M2, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, M1, __, __, __, M1, M1, M0, __, __, __, __, __, __, __, __, __, __, __, M0, M1, M1, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M0, __, {param2 = 0, name = "decoblocks:old_skeleton", prob = 254}, LS, __, V0, P3, V0, __, LS, __, __, M0, M1, M1, M1, __, __, __, M1, M1, M0, __, __, LS, __, __, {param2 = 0, name = "bones:bones", prob = 254}, __, __, LS, __, __, M0, M1, M1, __, __, __, __, __, M1, M1, __, __, LS, __, __, __, __, __, LS, __, __, M1, M1, __, __, __, __, __, __, __, M1, M1, __, LS, __, __, __, __, __, LS, __, M1, M1, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M0, W3, W0, M0, W0, W3, W1, W1, W3, M0, W2, W1, M0, M1, M1, M1, __, __, __, M1, M1, M0, W2, W1, M0, W1, W1, D0, W0, W2, M0, W1, W0, M0, M1, M1, __, __, __, __, __, M1, M1, M0, M0, M0, W0, W1, W0, W3, W0, M0, M0, M0, M1, M1, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M1, M1, M1, __, __, __, M1, M1, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M0, M1, M1, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, __, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, __, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M1, M2, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __, __
	},
	yslice_prob = {
		{ypos = 0, prob = 254},
		{ypos = 1, prob = 254},
		{ypos = 2, prob = 254},
		{ypos = 3, prob = 254},
		{ypos = 4, prob = 254},
		{ypos = 5, prob = 254},
		{ypos = 6, prob = 254},
		{ypos = 7, prob = 254},
		{ypos = 8, prob = 254},
		{ypos = 9, prob = 254},
		{ypos = 10, prob = 254},
		{ypos = 11, prob = 254}
	}
}
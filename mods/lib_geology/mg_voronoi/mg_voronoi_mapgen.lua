

minetest.set_mapgen_setting('mg_name','singlenode',true)
minetest.set_mapgen_setting('flags','nolight',true)
--minetest.set_mapgen_params({mgname="singlenode"})


	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor
	local sin   = math.sin
	local cos   = math.cos
	local tan   = math.tan

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_voronoi.heightmap2d = {}
	mg_voronoi.cliffmap = {}
	mg_voronoi.fillermap = {}
	mg_voronoi.edgemap = {}

	mg_voronoi.flowmap = {}

	mg_voronoi.heatmap = {}
	mg_voronoi.humidmap = {}


	mg_voronoi.mg_world_scale = gal.mapgen.mg_world_scale
	mg_voronoi.mg_world_scale_inverse = gal.mapgen.mg_world_scale_inverse
	local mg_world_scale = mg_voronoi.mg_world_scale
	local mg_world_scale_inverse = mg_voronoi.mg_world_scale_inverse
	local mg_world_scale_inverse2 = 0.001 / mg_world_scale
	local mg_3d_scale = 0.125 * (0.1 / mg_world_scale)
	mg_voronoi.mg_river_size = 5

	mg_voronoi.water_level = gal.mapgen.water_level
	mg_voronoi.use_heat_scalar = false

	local b_mult = 1
	local dist_metric = gal.mapgen.distance_metric
		--gal.lib.voronoi.distance_metric = dist_metric
		--gal.lib.metrics.set_dist_func(gal.lib.voronoi.distance_metric)

	local mg_base_height = 300 * mg_world_scale
	local mg_tectonic_scale = 0.1
	local min_ocean = gal.mapgen.ocean_depth
	local min_beach = gal.mapgen.beach_depth
	local max_beach = gal.mapgen.maxheight_beach
	local max_coastal = gal.mapgen.maxheight_coastal
	local max_lowland = gal.mapgen.maxheight_lowland
	local max_shelf = gal.mapgen.maxheight_shelf
	local max_highland = gal.mapgen.maxheight_highland
	local max_mountain = gal.mapgen.minheight_snow

	p_file = "mg_voronoi_points"
	n_file = "mg_voronoi_neighbors"
	e_file = "mg_voronoi_edgemap"
	v_file = "mg_voronoi_vertexmap"

	gal.lib.voronoi.load_points_lite(p_file, mg_voronoi.mg_world_scale)
	gal.lib.voronoi.load_neighbors(n_file)
		--gal.lib.voronoi.load_edgemap(e_file)
		--gal.lib.voronoi.load_vertexmap(v_file)




	local edge_detection_list = {
		minetest.get_content_id("gal:stone_rune_tile"),
		minetest.get_content_id("gal:stone_sea_circular"),
		minetest.get_content_id("gal:stone_tile_02"),
		minetest.get_content_id("gal:stone_circle_tile"),
		minetest.get_content_id("gal:stone_iron_tile_checker"),
		minetest.get_content_id("gal:stone_tile_01"),
		minetest.get_content_id("gal:stone_marker")
	}

	local v_cscale = 0.05
	local v_pscale = 0.1
	local v_mscale = 0.125
	local v_cmscale = 0.1
	local v_pmscale = 0.2
	local v_mmscale = 0.25
	local v_csscale = 0.2
	local v_psscale = 0.4
	local v_msscale = 0.5
	local p_cscale = 0.66
	local p_pscale = 1.33
	local p_mscale = 2.64575131106

	mg_voronoi.mg_noise_spread = 2400 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_spread = 240 * mg_voronoi.mg_world_scale
--##	(2400 * 0.1) * 0.25 == 240 / 4 == 60
	mg_voronoi.mg_noise_scale = 35 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_scale = 3 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_offset = -4 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_octaves = 7
	mg_voronoi.mg_noise_persist = 0.4
	mg_voronoi.mg_noise_lacunarity = 2.19

	--mg_voronoi.mg_noise_3d_base_spread = 192
	mg_voronoi.mg_noise_3d_base_spread = 38
	mg_voronoi.mg_noise_3d_xz_spread = mg_voronoi.mg_noise_3d_base_spread * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_3d_y_spread = (mg_voronoi.mg_noise_3d_base_spread * 0.5) * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_3d_y_spread = 72 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_3d_density = (mg_voronoi.mg_noise_3d_base_spread / 3) * mg_world_scale

	mg_voronoi.mg_noise_v7_alt_mult = 1
	mg_voronoi.mg_noise_v7_base_mult = 2.8
	mg_voronoi.mg_noise_v7_scale = 50
	--mg_voronoi.mg_noise_v7_scale = 5

	mg_voronoi.mg_noise_v7_spread = (2400 * mg_voronoi.mg_noise_v7_alt_mult) * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_v7_spread = (240 * mg_voronoi.mg_noise_v7_alt_mult) * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_v7_alt_scale = mg_voronoi.mg_noise_v7_scale * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_v7_base_scale = (mg_voronoi.mg_noise_v7_scale * mg_voronoi.mg_noise_v7_base_mult) * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_v7_offset = -4 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_v7_octaves = 7
	mg_voronoi.mg_noise_v7_persist = 0.4
	mg_voronoi.mg_noise_v7_lacunarity = 2.19

	mg_voronoi.mg_noise_v7_height_spread = 1000 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_v7_height_spread = 100 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_v7_persist_spread = 2000 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_v7_persist_spread = 200 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_cliff_spread = 180 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_fill_spread = 150 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_fill_spread = 15 * mg_voronoi.mg_world_scale

	mg_voronoi.mg_noise_heathumid_spread = 1000 * mg_voronoi.mg_world_scale
	--mg_voronoi.mg_noise_heathumid_spread = 100 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_heat_offset = 0
	mg_voronoi.mg_noise_heat_scale = 12.5
	mg_voronoi.mg_noise_humid_offset = 50
	mg_voronoi.mg_noise_humid_scale = 50


	local nobj_terrain = nil
	local nbuf_terrain = {}

	local nobj_3dterrain = nil
	local nbuf_3dterrain = {}

	local nobj_height = nil
	local nbuf_height = {}

	local nobj_persist = nil
	local nbuf_persist = {}

	local nobj_cliffs = nil
	local nbuf_cliffs = {}

	local nobj_filler_depth = nil
	local nbuf_filler_depth = {}

	local nobj_heatmap = nil
	local nbuf_heatmap = {}
	local nobj_heatblend = nil
	local nbuf_heatblend = {}
	local nobj_humiditymap = nil
	local nbuf_humiditymap = {}
	local nobj_humidityblend = nil
	local nbuf_humidityblend = {}

	local np_terrain = {
		offset = mg_voronoi.mg_noise_offset,
		scale = mg_voronoi.mg_noise_scale,
		seed = 5934,
		spread = {x = (mg_voronoi.mg_noise_spread), y = (mg_voronoi.mg_noise_spread), z = (mg_voronoi.mg_noise_spread)},
		octaves = mg_voronoi.mg_noise_octaves,
		persist = mg_voronoi.mg_noise_persist,
		lacunarity = mg_voronoi.mg_noise_lacunarity,
	}
	local np_3dterrain = {
		offset = 0,
		scale = 1,
		spread = {x = mg_voronoi.mg_noise_3d_xz_spread, y = mg_voronoi.mg_noise_3d_y_spread, z = mg_voronoi.mg_noise_3d_xz_spread},
		seed = 5934,
		octaves = 5,
		persist = 0.5,
		lacunarity = 2.11,
	}

	local np_v7_alt = {
		offset = mg_voronoi.mg_noise_v7_offset,
		scale = mg_voronoi.mg_noise_v7_alt_scale,
		seed = 5934,
		spread = {x = mg_voronoi.mg_noise_v7_spread, y = mg_voronoi.mg_noise_v7_spread, z = mg_voronoi.mg_noise_v7_spread},
		octaves = mg_voronoi.mg_noise_v7_octaves,
		persist = mg_voronoi.mg_noise_v7_persist,
		lacunarity = mg_voronoi.mg_noise_v7_lacunarity,
	}
	local np_v7_base = {
		offset = mg_voronoi.mg_noise_v7_offset,
		scale = mg_voronoi.mg_noise_v7_base_scale,
		--seed = 82341,
		seed = 5934,
		spread = {x = mg_voronoi.mg_noise_v7_spread, y = mg_voronoi.mg_noise_v7_spread, z = mg_voronoi.mg_noise_v7_spread},
		octaves = mg_voronoi.mg_noise_v7_octaves,
		persist = mg_voronoi.mg_noise_v7_persist,
		lacunarity = mg_voronoi.mg_noise_v7_lacunarity,
		flags = "defaults"
	}

	local np_v7_height = {
		flags = "defaults",
		lacunarity = mg_voronoi.mg_noise_v7_lacunarity,
		--offset = 0.25,
		offset = 0.5,
		scale = 1,
		spread = {x = mg_voronoi.mg_noise_v7_height_spread, y = mg_voronoi.mg_noise_v7_height_spread, z = mg_voronoi.mg_noise_v7_height_spread},
		seed = 4213,
		octaves = mg_voronoi.mg_noise_v7_octaves,
		persist = mg_voronoi.mg_noise_v7_persist,
	}
	local np_v7_persist = {
		flags = "defaults",
		lacunarity = mg_voronoi.mg_noise_v7_lacunarity,
		offset = 0.6,
		scale = 0.1,
		spread = {x = mg_voronoi.mg_noise_v7_persist_spread, y = mg_voronoi.mg_noise_v7_persist_spread, z = mg_voronoi.mg_noise_v7_persist_spread},
		seed = 539,
		octaves = 3,
		persist = 0.6,
	}
	local np_cliffs = {
		offset = 0,					
		scale = 0.72,
		spread = {x = mg_voronoi.mg_noise_cliff_spread, y = mg_voronoi.mg_noise_cliff_spread, z = mg_voronoi.mg_noise_cliff_spread},
		seed = 78901,
		octaves = 5,
		persist = 0.5,
		lacunarity = 2.19,
	}
	local np_filler_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = mg_voronoi.mg_noise_fill_spread, y = mg_voronoi.mg_noise_fill_spread, z = mg_voronoi.mg_noise_fill_spread},
		seed = 261,
		octaves = 3,
		persistence = 0.7,
	}

	local np_heat = {
		flags = "defaults",
		lacunarity = 2,
		offset = mg_voronoi.mg_noise_heat_offset,
		scale = mg_voronoi.mg_noise_heat_scale,
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = mg_voronoi.mg_noise_heathumid_spread, y = mg_voronoi.mg_noise_heathumid_spread, z = mg_voronoi.mg_noise_heathumid_spread},
		seed = 5349,
		octaves = 3,
		persist = 0.5,
	}
	local np_heat_blend = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.5,
		spread = {x = 8, y = 8, z = 8},
		seed = 13,
		octaves = 2,
		persist = 1,
	}
	local np_humid = {
		flags = "defaults",
		lacunarity = 2,
		offset = mg_voronoi.mg_noise_humid_offset,
		scale = mg_voronoi.mg_noise_humid_scale,
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = mg_voronoi.mg_noise_heathumid_spread, y = mg_voronoi.mg_noise_heathumid_spread, z = mg_voronoi.mg_noise_heathumid_spread},
		seed = 842,
		octaves = 3,
		persist = 0.5,
	}
	local np_humid_blend = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.5,
		spread = {x = 8, y = 8, z = 8},
		seed = 90003,
		octaves = 2,
		persist = 1,
	}



	local function rangelim(v, min, max)
		if v < min then return min end
		if v > max then return max end
		return v
	end

	local cliffs_thresh = floor((np_terrain.scale) * 0.5)

	local function get_terrain_height_cliffs(theight,cheight)
			-- cliffs
		local t_cliff = 0
		if theight > 1 and theight < cliffs_thresh then 
			local clifh = max(min(cheight,1),0) 
			if clifh > 0 then
				clifh = -1 * (clifh - 1) * (clifh - 1) + 1
				t_cliff = clifh
				theight = theight + (cliffs_thresh - theight) * clifh * ((theight < 2) and theight - 1 or 1)
			end
		end
		return theight, t_cliff
	end

	local mg_points = gal.lib.voronoi.points[p_file]

	local get_cell = gal.lib.voronoi.get_nearest_cell
	local get_neighbor = gal.lib.voronoi.get_cell_neighbors

	local mapgen_times = {
		liquid_lighting = {},
		loop2d = {},
		loop3d = {},
		mainloop = {},
		make_chunk = {},
		noisemaps = {},
		preparation = {},
		setdata = {},
		writing = {},
	}

--
	local mg_base_altitude = mg_base_height * 1.4
	--local mg_base_altitude = mg_base_height
	--local mg_cont_altitude = mg_base_altitude / 7
	local tcont_x = (mg_points[1].x + mg_points[2].x + mg_points[3].x + mg_points[4].x + mg_points[5].x + mg_points[6].x + mg_points[7].x) / 7
	local tcont_z = (mg_points[1].z + mg_points[2].z + mg_points[3].z + mg_points[4].z + mg_points[5].z + mg_points[6].z + mg_points[7].z) / 7
	local tcont_y = mg_base_altitude + (mg_base_altitude / 7)
	c_northamerica = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = (mg_points[8].x + mg_points[9].x + mg_points[10].x + mg_points[11].x) / 4
	tcont_z = (mg_points[8].z + mg_points[9].z + mg_points[10].z + mg_points[11].z) / 4
	tcont_y = mg_base_altitude + (mg_base_altitude / 4)
	c_southamerica = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = (mg_points[12].x + mg_points[13].x + mg_points[14].x + mg_points[15].x + mg_points[16].x) / 5
	--tcont_x = (mg_points[12].x + mg_points[13].x + mg_points[14].x) / 3
	tcont_z = (mg_points[12].z + mg_points[13].z + mg_points[14].z + mg_points[15].z + mg_points[16].z) / 5
	--tcont_z = (mg_points[12].z + mg_points[13].z + mg_points[14].z) / 3
	tcont_y = mg_base_altitude + (mg_base_altitude / 5)
	--tcont_y = mg_base_altitude + (mg_base_altitude / 3)
	c_europe = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = (mg_points[17].x + mg_points[18].x + mg_points[19].x + mg_points[20].x + mg_points[21].x + mg_points[22].x + mg_points[23].x + mg_points[24].x + mg_points[25].x + mg_points[26].x) / 10
	--tcont_x = (mg_points[15].x + mg_points[16].x + mg_points[17].x + mg_points[18].x + mg_points[19].x + mg_points[20].x + mg_points[21].x + mg_points[22].x + mg_points[23].x + mg_points[24].x + mg_points[25].x + mg_points[26].x) / 12
	tcont_z = (mg_points[17].z + mg_points[18].z + mg_points[19].z + mg_points[20].z + mg_points[21].z + mg_points[22].z + mg_points[23].z + mg_points[24].z + mg_points[25].z + mg_points[26].z) / 10
	--tcont_z = (mg_points[15].z + mg_points[16].z + mg_points[17].z + mg_points[18].z + mg_points[19].z + mg_points[20].z + mg_points[21].z + mg_points[22].z + mg_points[23].z + mg_points[24].z + mg_points[25].z + mg_points[26].z) / 12
	tcont_y = mg_base_altitude + (mg_base_altitude / 10)
	--tcont_y = mg_base_altitude + (mg_base_altitude / 12)
	c_asia = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = (mg_points[27].x + mg_points[28].x + mg_points[29].x + mg_points[30].x + mg_points[31].x) / 5
	tcont_z = (mg_points[27].z + mg_points[28].z + mg_points[29].z + mg_points[30].z + mg_points[31].z) / 5
	tcont_y = mg_base_altitude + (mg_base_altitude / 5)
	c_africa = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = mg_points[32].x
	tcont_z = mg_points[32].z
	tcont_y = mg_base_altitude
	c_australia = {
		x = tcont_x,
		y = tcont_y,
		z = tcont_z
	}
	tcont_x = nil
	tcont_z = nil
	tcont_y = nil
--

	mg_voronoi.current_cell = {
		m = 0,
		p = 0,
		c = 0
	}

	local data = {}

	minetest.register_on_generated(function(minp, maxp, seed)
		
		-- Start time of mapchunk generation.
		local t0 = os.clock()
		
		local x1 = maxp.x
		local y1 = maxp.y
		local z1 = maxp.z
		local x0 = minp.x
		local y0 = minp.y
		local z0 = minp.z

		local sidelen = maxp.x - minp.x + 1
		local permapdims3d = {x = sidelen, y = sidelen, z = sidelen}
		local permapdims2d = {x = sidelen, y = sidelen, z = 0}
		local minpos3d = {x = x0, y = y0, z = z0}
		local minpos2d = {x = x0, y = z0}

		--nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, permapdims2d)
		--nbuf_terrain = nobj_terrain:get_2d_map(minpos2d)

		--nobj_3dterrain = nobj_3dterrain or minetest.get_perlin_map(np_3dterrain, permapdims3d)
		--nbuf_3dterrain = nobj_3dterrain:get_3d_map(minpos3d)

			--nobj_alt = nobj_alt or minetest.get_perlin_map(np_v7_alt, permapdims2d)
			--nbuf_alt = nobj_alt:get_2d_map(minpos2d)

			--nobj_base = nobj_base or minetest.get_perlin_map(np_v7_base, permapdims2d)
			--nbuf_height = nobj_base:get_2d_map(minpos2d)

		--nobj_height = nobj_height or minetest.get_perlin_map(np_v7_height, permapdims2d)
		--nbuf_height = nobj_height:get_2d_map(minpos2d)

		--nobj_persist = nobj_persist or minetest.get_perlin_map(np_v7_persist, permapdims2d)
		--nbuf_persist = nobj_persist:get_2d_map(minpos2d)

		--nobj_cliffs = nobj_cliffs or minetest.get_perlin_map(np_cliffs, permapdims2d)
		--nbuf_cliffs = nobj_cliffs:get_2d_map(minpos2d)

		--nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_filler_depth, permapdims2d)
		--nbuf_filler_depth = nobj_filler_depth:get_2d_map(minpos2d)

		nobj_heatmap = nobj_heatmap or minetest.get_perlin_map(np_heat, permapdims2d)
		nbuf_heatmap = nobj_heatmap:get_2d_map(minpos2d)
		nobj_heatblend = nobj_heatblend or minetest.get_perlin_map(np_heat_blend, permapdims2d)
		nbuf_heatblend = nobj_heatblend:get_2d_map(minpos2d)
		nobj_humiditymap = nobj_humiditymap or minetest.get_perlin_map(np_humid, permapdims2d)
		nbuf_humiditymap = nobj_humiditymap:get_2d_map(minpos2d)
		nobj_humidityblend = nobj_humidityblend or minetest.get_perlin_map(np_humid_blend, permapdims2d)
		nbuf_humidityblend = nobj_humidityblend:get_2d_map(minpos2d)

		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		vm:get_data(data)
		local a = VoxelArea:new({MinEdge = emin, MaxEdge = emax})
		local csize = vector.add(vector.subtract(maxp, minp), 1)

		-- Mapgen preparation is now finished. Check the timer to know the elapsed time.
		local t1 = os.clock()
	
		local write = false

		local water_level       = mg_voronoi.water_level
		--local edges = {}

--
-- ## VORONOI SELECTION
--
		local center_of_chunk_x = maxp.x - (sidelen / 2)
		local center_of_chunk_z = maxp.z - (sidelen / 2)

		local mn_idx, mn_dist, mn_z, mn_x, mn_rise, mn_run, mn_edge = get_cell(mg_points, {x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 1)
		get_neighbor(mg_points, mn_idx)
		local pn_idx, pn_dist, pn_z, pn_x, pn_rise, pn_run, pn_edge = get_cell(mg_points, {x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 2)
		get_neighbor(mg_points, pn_idx)
		local cn_idx, cn_dist, cn_z, cn_x, cn_rise, cn_run, cn_edge = get_cell(mg_points, {x = center_of_chunk_x, z = center_of_chunk_z}, dist_metric, 3)
		get_neighbor(mg_points, cn_idx)

		gal.mapgen.chunk_voronoi_cells = {
			m = mn_idx,
			p = pn_idx,
			c = cn_idx
		}
--
	--2D HEIGHTMAP GENERATION - Uses permapdims2d
		local index2d = 0
	
		local max_high = max_highland
		local max_mount = max_mountain
		local mean_alt = 0
		local min_alt = -31000
		local max_alt = 31000
		local XRS = 150

		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

-- ## NOISE CALCULATIONS
--
				local nterrain = minetest.get_perlin(np_terrain):get_2d({x=x,y=z})
				--local nterrain = nbuf_terrain[z-minp.z+1][x-minp.x+1]

				local aterrain = 0

				local hselect = minetest.get_perlin(np_v7_height):get_2d({x=x,y=z})
				--local hselect = nbuf_height[z-minp.z+1][x-minp.x+1]
				local hselect = rangelim(hselect, 0, 1)

				local persist = minetest.get_perlin(np_v7_persist):get_2d({x=x,y=z})
				--local persist = nbuf_persist[z-minp.z+1][x-minp.x+1]

				np_v7_base.persistence = persist;
				local height_base = minetest.get_perlin(np_v7_base):get_2d({x=x,y=z})
	
				np_v7_alt.persistence = persist;
				local height_alt = minetest.get_perlin(np_v7_alt):get_2d({x=x,y=z})
	
				if (height_alt > height_base) then
					aterrain = floor(height_alt)
				else
					aterrain = floor((height_base * hselect) + (height_alt * (1 - hselect)))
				end

				local ncliff = minetest.get_perlin(np_cliffs):get_2d({x=x,y=z})
				--local ncliff = nbuf_cliffs[z-minp.z+1][x-minp.x+1]

				local nfill = minetest.get_perlin(np_filler_depth):get_2d({x=x,y=z})
				--local nfill = nbuf_filler_depth[z-minp.z+1][x-minp.x+1]

					--local hnterrain = nterrain * math.sin(nfill)
				--local anterrain = aterrain + nterrain

-- ## VORONOI DISTANCE CALCULATIONS

				--local c_idx, c_dist, c_z, c_x, c_rise, c_run, c_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 3)
				--local p_idx, p_dist, p_z, p_x, p_rise, p_run, p_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 2)
				--local m_idx, m_dist, m_z, m_x, m_rise, m_run, m_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 1)

				local xc_idx, xc_dist, xc_z, xc_x, xc_rise, xc_run, xc_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 3)
				--local xp_idx, xp_dist, xp_z, xp_x, xp_rise, xp_run, xp_edge = get_cell(mg_points, {x = xc_x, z = xc_z}, dist_metric, 2)
				local xp_idx, xp_dist, xp_z, xp_x, xp_rise, xp_run, xp_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 2)
				--local xm_idx, xm_dist, xm_z, xm_x, xm_rise, xm_run, xm_edge = get_cell(mg_points, {x = xp_x, z = xp_z}, dist_metric, 1)
				local xm_idx, xm_dist, xm_z, xm_x, xm_rise, xm_run, xm_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 1)
				local m_idx = xm_idx

				--local xm_slope = (xm_rise * v_cscale) / (xm_run * v_cscale)
				----local xm_slope = (xm_z - xp_z) / (xm_x - xp_x)
				--local xp_slope = (xp_rise * v_pscale) / (xp_run * v_pscale)
				----local xp_slope = (xp_z - xc_z) / (xp_x - xc_x)
				--local xc_slope = (xc_rise * v_mscale) / (xc_run * v_mscale)
				----local xc_slope = (xc_z - z) / (xc_x - x)
				--local mp_diff = xm_slope - xp_slope
				--local pc_diff = xp_slope - xc_slope
				--local x_diff = mp_diff - pc_diff

				local xmcontinental = xm_dist * v_cscale
					--local xpcontinental = (xp_dist * v_pscale) - (mp_diff * mg_world_scale)
				local xpcontinental = xp_dist * v_pscale
					--local xccontinental = (xc_dist * v_mscale) - (pc_diff * mg_world_scale)
				local xccontinental = xc_dist * v_mscale

				local xbcontinental = (xmcontinental + xpcontinental + xccontinental)
				--local xbcontinental = (xmcontinental + xpcontinental + xccontinental)

				--local m_y = (mg_base_height * 1.4) - ((mp_dist * v_pscale) + (mc_dist * v_mscale))
				--local p_y = m_y - (xm_dist * v_cscale)
				--local c_y = p_y - (xp_dist * v_pscale)
				

--
				local t_x
				local t_y
				local t_z
				
				if m_idx >= 1 and m_idx <= 7 then
					t_x = c_northamerica.x
					t_y = c_northamerica.y
					--t_y = mg_base_height + nfill
					t_z = c_northamerica.z
				elseif m_idx >= 8 and m_idx <= 11 then
					t_x = c_southamerica.x
					t_y = c_southamerica.y
					--t_y = y
					t_z = c_southamerica.z
				elseif m_idx >= 12 and m_idx <= 16 then
					t_x = c_europe.x
					t_y = c_europe.y
					--t_y = y
					t_z = c_europe.z
				elseif m_idx >= 17 and m_idx <= 26 then
					t_x = c_asia.x
					t_y = c_asia.y
					--t_y = y
					t_z = c_asia.z
				elseif m_idx >= 27 and m_idx <= 31 then
					t_x = c_africa.x
					t_y = c_africa.y
					--t_y = y
					t_z = c_africa.z
				elseif m_idx == 32 then
					t_x = c_australia.x
					t_y = c_australia.y
					--t_y = y
					t_z = c_australia.z
				else
					t_x = x
					--t_y = y
					t_z = z
				end
--
				local t_dist = gal.lib.metrics.get_distance((t_x - x), (t_z - z), dist_metric)
				local tcontinental = t_dist * v_cscale
				------local tterrain = t_y - tcontinental
				----local tterrain = t_y - t_dist
--

-- ## TERRAIN GENERATION

				--local t_alt, t_cliff = get_terrain_height_cliffs((mg_base_height - mpc_d),ncliff)

--[[  ## GOOD WORKING CODE
				local vcontinental = bcontinental
				local bterrain = (mg_base_height - bcontinental) + (mg_base_height * 0.4)

				local nheight = nterrain * math.sin(nfill)
				local aheight = (aterrain * math.sin(nfill)) * (1 / bcontinental)

				local bheight = (bterrain + nterrain) * (1 / bcontinental)
				local belevation = (bheight + aheight) * (mg_world_scale / 0.01)
--]]


				--local xvcontinental = xbcontinental + (x_diff * mg_world_scale)
				local xbterrain = (mg_base_height * 1.4) - xbcontinental
				--local xaheight = (aterrain * math.sin(nfill)) * (1 / xbcontinental)
				local xaheight = aterrain * math.sin(nfill)
					--local xaheight = aterrain * (1 / xbcontinental)
				local xnheight = (nterrain * math.sin(nfill)) * (1 / xbcontinental)
				--local xnheight = nterrain * math.sin(nfill)
					--local xnheight = nterrain * (1 / xbcontinental)
				local xbheight = (xbterrain + xaheight) * (1 / xbcontinental)
					--local xbheight = xbterrain * (1 / xbcontinental)
				local belevation = (xbheight + xnheight) * (mg_world_scale / 0.01)
					--local belevation = xbheight * (mg_world_scale / 0.01)
					--local belevation = xbterrain + aterrain
					--local belevation = xbterrain


				----local nelevation = belevation + (bterrain * 0.5)
				local nelevation = belevation
				--local nelevation = velevation
				--local nelevation = fterrain



--[[	## Heightmap from 3D data-- DNU

				--local n_y = nelevation * mg_3d_scale
				local n_y = nelevation
				local n_f = minetest.get_perlin(np_3dterrain):get_3d({x = x, y = n_y, z = z})
					--local n_f = nbuf_3dterrain[z-minp.z+1][nelevation-minp.y+1][x-minp.x+1]

				local s_d = (1 - n_y) / mg_voronoi.mg_noise_3d_density
				--local s_d = (1 - nelevation) / (mg_voronoi.mg_noise_3d_density * mg_world_scale)
				----local s_d = n_f - nelevation
				local n_t = n_y + n_f + s_d
				----local n_t = n_y * n_f - s_d

				local t_alt = n_t
--]]


				--local t_alt, t_cliff = get_terrain_height_cliffs(nelevation,ncliff)

				local t_alt = nelevation
				local t_cliff = 0

				gal.mapgen.heightmap[index2d] = t_alt
				--mg_voronoi.heightmap2d[index2d] = t_alt
				--mg_voronoi.heightmap2d[index2d] = nelevation

				mg_voronoi.cliffmap[index2d] = t_cliff

--## BIOMES GENERATION

				--local nheat = gal.mapgen.get_heat_scalar(z) + ((nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1]) * 0.125)
				local nheat = gal.mapgen.get_heat_scalar(z) + (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1])

				local nhumid_cont = (((x - t_x) * mg_world_scale_inverse) + (math.sin((x - t_x) * mg_world_scale_inverse)))
				----local nhumid_cont = (((x - m_x) * mg_world_scale_inverse) + (math.sin((x - m_x) * mg_world_scale_inverse)))
				local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]) + nhumid_cont
				--local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1])

				mg_voronoi.heatmap[index2d] = nheat
				mg_voronoi.humidmap[index2d] = nhumid

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_alt)
				--gal.mapgen.biomemap[index2d] = gal.mapgen.biomes[{heat = nheat, humid = nhumid}]
				if z == center_of_chunk_z and x == center_of_chunk_x then
					gal.mapgen.chunk_biome = gal.mapgen.biomemap[index2d]
				end

--## EDGE MAP
				local t_edge = 0
				if xm_edge and xm_edge ~= "" then
					t_edge = t_edge + 1
				end
				if xp_edge and xp_edge ~= "" then
					t_edge = t_edge + 2
				end
				if xc_edge and xc_edge ~= "" then
					t_edge = t_edge + 4
				end
				mg_voronoi.edgemap[index2d] = t_edge

				mean_alt = mean_alt + t_alt
				if min_alt == -31000 then
					min_alt = t_alt
				else
					min_alt = min(t_alt,min_alt)
				end
				if max_alt == 31000 then
					max_alt = t_alt
				else
					max_alt = max(t_alt,max_alt)
				end

--## SPAWN SELECTION
				if z == player_spawn_point.z then
					if x == player_spawn_point.x then
						player_spawn_point.y = t_alt
					end
				end
				if z == origin_y_val.z then
					if x == origin_y_val.x then
						origin_y_val.y = t_alt
					end
				end
			end
		end
	
		gal.mapgen.chunk_mean_altitude = mean_alt / ((x1 - x0) * (z1 - z0))
		gal.mapgen.chunk_min_altitude = min_alt
		gal.mapgen.chunk_max_altitude = max_alt

		local t2 = os.clock()

--[[
	-- ## 3D TERRAIN GENERATION
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				for x = minp.x, maxp.x do

					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

					local n_y = mg_voronoi.heightmap2d[index2d] * mg_3d_scale
					----local n_y = gal.mapgen.heightmap[index2d] * mg_3d_scale
					--local n_y = nbuf_terrain[z-minp.z+1][x-minp.x+1] * mg_3d_scale

					local n_f = minetest.get_perlin(np_3dterrain):get_3d({x = x, y = y, z = z})
					--local n_f = nbuf_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]

					local s_d = (1 - y) / mg_voronoi.mg_noise_3d_density
					--local s_d = n_f - n_y
					local n_t = n_y + n_f + s_d
					--local n_t = n_y * n_f - s_d

					if n_t > 0 then
						gal.mapgen.heightmap[index2d] = y
					end

				end
			end
		end
--]]

		local t3 = os.clock()

--[[
	--2D FLOW ACCUMMULATION SELECTION
		local index2d = 0
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do

				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local t_y = gal.mapgen.heightmap[index2d]

				local i_n
				local i_e
				local i_s
				local i_w

				local t_n
				local t_e
				local t_s
				local t_w

				local s_n
				local s_e
				local s_s
				local s_w

				local fa_w = 0
				local fa_d = 0

				if z = minp.z then
					i_n = ((z + 1) - minp.z) * csize.x + (x - minp.x) + 1
					i_s = (z - minp.z) * csize.x + (x - minp.x) + 1
				elseif z = maxp.z then
					i_n = (z - minp.z) * csize.x + (x - minp.x) + 1
					i_s = ((z - 1) - minp.z) * csize.x + (x - minp.x) + 1
				else
					i_n = ((z + 1) - minp.z) * csize.x + (x - minp.x) + 1
					i_s = ((z - 1) - minp.z) * csize.x + (x - minp.x) + 1
				end

				if x = minp.x then
					i_e = (z - minp.z) * csize.x + ((x + 1) - minp.x) + 1
					i_w = (z - minp.z) * csize.x + (x - minp.x) + 1
				elseif x = maxp.x then
					i_e = (z - minp.z) * csize.x + (x - minp.x) + 1
					i_w = (z - minp.z) * csize.x + ((x - 1) - minp.x) + 1
				else
					i_e = (z - minp.z) * csize.x + ((x + 1) - minp.x) + 1
					i_w = (z - minp.z) * csize.x + ((x - 1) - minp.x) + 1
				end

				t_n = gal.mapgen.heightmap[i_n]
				t_e = gal.mapgen.heightmap[i_e]
				t_s = gal.mapgen.heightmap[i_s]
				t_w = gal.mapgen.heightmap[i_w]

				if t_n > t_y then
					fa_w = fa_w + 1
				elseif t_n < t_y then
					fa_d = fa_d + 1
				else

				end

				if t_s > t_y then
					fa_w = fa_w + 2
				elseif t_s < t_y then
					fa_d = fa_d + 2
				else

				end

				if t_e > t_y then
					fa_w = fa_w + 4
				elseif t_e < t_y then
					fa_d = fa_d + 4
				else

				end

				if t_w > t_y then
					fa_w = fa_w + 8
				elseif t_w < t_y then
					fa_d = fa_d + 8
				else

				end

				mg_voronoi.flowmap[index2d] = 

			end
		end
--]]


--[[
	--2D BIOME SELECTION
		local index2d = 0
		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local t_y = gal.mapgen.heightmap[index2d]

				local nheat = mg_voronoi.heatmap[index2d]
				local nhumid = mg_voronoi.humidmap[index2d]

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_y)
				if z == center_of_chunk_z and x == center_of_chunk_x then
					gal.mapgen.chunk_biome = gal.mapgen.biomemap[index2d]
				end

			end
		end
--]]

	--2D HEIGHTMAP RENDER
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				--local vi = area:index(minp.x, y, z)
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local write_3d = false

					local theight = gal.mapgen.heightmap[index2d]
					--local t2dheight = mg_voronoi.heightmap2d[index2d]
					local t_cliff = mg_voronoi.cliffmap[index2d] or 0
					local t_biome_name = gal.mapgen.biomemap[index2d]

					local nheat = mg_voronoi.heatmap[index2d]
					local nhumid = mg_voronoi.humidmap[index2d]
					local h_mod = (nheat - nhumid) * mg_world_scale

					--local t_fillmap = mg_voronoi.fillermap[index2d]
					local t_fillmap = 0
					local t_edge = mg_voronoi.edgemap[index2d]

					local fill_depth = 4
					local top_depth = 1

-- ## BIOME GENERATION
					local t_air = gal.mapgen.c_air
					local t_ignore = gal.mapgen.c_ignore

					local t_top = gal.mapgen.c_top
					local t_filler = gal.mapgen.c_filler
					local t_stone = gal.mapgen.c_stone
					local t_water = gal.mapgen.c_water
					local t_river = gal.mapgen.c_river
					local t_riverbed = gal.mapgen.c_gravel
					local t_riverbed_depth = 5
					local t_ice = gal.mapgen.c_ice
					local t_mud = gal.mapgen.c_mud

					t_stone = gal.mapgen.biome_info[t_biome_name].b_stone
					t_filler = gal.mapgen.biome_info[t_biome_name].b_filler
					local t_filldepth = fill_depth + t_fillmap
					t_top = gal.mapgen.biome_info[t_biome_name].b_top
					top_depth = 1
					t_water = gal.mapgen.biome_info[t_biome_name].b_water
					t_river = gal.mapgen.biome_info[t_biome_name].b_river
					t_riverbed = gal.mapgen.biome_info[t_biome_name].b_riverbed
					t_riverbed_depth = gal.mapgen.biome_info[t_biome_name].b_riverbed_depth

						--if t_edge ~= "" then
						--	--t_top = t_stone
						--	t_top = edge_detection_list[t_edge]
						--end

					if t_cliff > 0 then
						t_filler = t_stone
					end

--
					max_high = max_highland + h_mod
					max_mount = max_mountain + h_mod
					--max_high = max_highland
					--max_mount = max_mountain

					--if theight < min_ocean then
					--	t_top = t_stone
					--	t_filler = t_stone
					--	t_stone = t_stone
					--	t_water = t_water
					--	t_river = t_water
					--end
					if theight > max_high then
						t_top = t_stone
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_water
						t_river = t_ice
					end
					if theight > max_mount then
						t_top = t_ice
						t_filler = t_stone
						t_stone = t_stone
						t_water = t_ice
						t_river = t_ice
					end
--

	--3D TERRAIN CARVING
--[[
					----local t_y = t2dheight
					--local t_y = t2dheight * mg_3d_scale
					local t_y = theight * mg_3d_scale
					------local t_y = nbuf_terrain[z-minp.z+1][x-minp.x+1] * mg_3d_scale

					----local n_f = minetest.get_perlin(np_3dterrain):get_3d({x = x, y = t_y, z = z})
					local n_f = minetest.get_perlin(np_3dterrain):get_3d({x = x, y = y, z = z})
					--local n_f = nbuf_3dterrain[z-minp.z+1][y-minp.y+1][x-minp.x+1]

					--local s_d = (1 - t_y) / mg_voronoi.mg_noise_3d_density
					local s_d = (1 - y) / mg_voronoi.mg_noise_3d_density
					----local s_d = n_f - t_y

					local n_t = t_y + n_f + s_d
					--local n_t = t_y * n_f - s_d

					if y <= mg_voronoi.water_level then
						if y > theight then
							write_3d = true
						end
						if (theight > y) and (theight > mg_voronoi.water_level) then
							write_3d = true
						end
					end

					if n_t > 0 then
						write_3d = true
					end
--]]
					write_3d = true

-- ## NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if write_3d == true then
						if y < (theight - (fill_depth + top_depth)) then
							t_node = t_stone
							--if (y <= mg_voronoi.water_level) and (theight > mg_voronoi.water_level) then
							--	if not (n_t > 0) then
							--		t_node = t_water
							--	end
							--end
						elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
							t_node = t_filler
						elseif y >= (theight - top_depth) and y <= theight then
							t_node = t_top
						elseif y > theight and y <= mg_voronoi.water_level then
						--Water Level (Sea Level)
							t_node = t_water
						end

					end

					data[ivm] = t_node
					write = true

				end
			end
		end
		
		local t4 = os.clock()
	
		if write then
			vm:set_data(data)
		end
	
		local t5 = os.clock()
		
		if write then
	
			minetest.generate_ores(vm,minp,maxp)
			minetest.generate_decorations(vm,minp,maxp)
				
			vm:set_lighting({day = 0, night = 0})
			vm:calc_lighting()
			vm:update_liquids()
		end
	
		local t6 = os.clock()
	
		if write then
			vm:write_to_map()
		end
	
		local t7 = os.clock()
	
		-- Print generation time of this mapchunk.
		local chugent = math.ceil((os.clock() - t0) * 1000)
		print ("[mg_voronoi] Mapchunk generation time " .. chugent .. " ms")
	
		table.insert(mapgen_times.noisemaps, 0)
		table.insert(mapgen_times.preparation, t1 - t0)
		table.insert(mapgen_times.loop2d, t2 - t1)
		table.insert(mapgen_times.loop3d, t3 - t2)
		table.insert(mapgen_times.mainloop, t4 - t3)
		table.insert(mapgen_times.setdata, t5 - t4)
		table.insert(mapgen_times.liquid_lighting, t6 - t5)
		table.insert(mapgen_times.writing, t7 - t6)
		table.insert(mapgen_times.make_chunk, t7 - t0)
	
		-- Deal with memory issues. This, of course, is supposed to be automatic.
		local mem = math.floor(collectgarbage("count")/1024)
		if mem > 1000 then
			print("mg_voronoi is manually collecting garbage as memory use has exceeded 500K.")
			collectgarbage("collect")
		end
	end)

	local function mean( t )
		local sum = 0
		local count= 0
	
		for k,v in pairs(t) do
			if type(v) == 'number' then
				sum = sum + v
				count = count + 1
			end
		end
	
		return (sum / count)
	end

	minetest.register_on_shutdown(function()

		gal.lib.voronoi.save_neighbors("mg_voronoi_neighbors")
		--gal.lib.voronoi.save_edgemap("mg_voronoi_edgemap")
		----gal.lib.voronoi.save_vertexmap("mg_voronoi_vertexmap")

		if #mapgen_times.make_chunk == 0 then
			return
		end
	
		local average, standard_dev
		minetest.log("mg_voronoi lua Mapgen Times:")
		print("mg_voronoi lua Mapgen Times:")
	
		average = mean(mapgen_times.liquid_lighting)
		minetest.log("  liquid_lighting: - - - - - - - - - - - -  "..average)
		print("  liquid_lighting: - - - - - - - - - - - -  "..average)

		average = mean(mapgen_times.loop2d)
		minetest.log(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
		print(" 2D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.loop3d)
		minetest.log(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
		print(" 3D Noise loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.mainloop)
		minetest.log(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)
		print(" Main Render loops: - - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.make_chunk)
		minetest.log("  makeChunk: - - - - - - - - - - - - - - -  "..average)
		print("  makeChunk: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.noisemaps)
		minetest.log("  noisemaps: - - - - - - - - - - - - - - -  "..average)
		print("  noisemaps: - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.preparation)
		minetest.log("  preparation: - - - - - - - - - - - - - -  "..average)
		print("  preparation: - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.setdata)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
		print("  writing: - - - - - - - - - - - - - - - -  "..average)
	
		average = mean(mapgen_times.writing)
		minetest.log("  writing: - - - - - - - - - - - - - - - -  "..average)
		print("  writing: - - - - - - - - - - - - - - - -  "..average)

		print("******       Thanks for playing GAL!       *******")

	end)


	local function mg_voronoi_spawnplayer(player)
	
		if player_spawn_point then
			print ("[mg_voronoi] spawn player (" .. player_spawn_point.x .. " " .. player_spawn_point.y .. " " .. player_spawn_point.z .. ")")
			player:setpos({x = player_spawn_point.x, y = player_spawn_point.y, z = player_spawn_point.z})
		else	
			print ("[mg_voronoi] no suitable spawn found")
			local y_height = origin_y_val.y
			if y_height then
				player:setpos({x = 0, y = y_height, z = 0})
			else
				player:setpos({x = 0, y = 5, z = 0})
			end
		end

	end
	
	minetest.register_on_newplayer(function(player)
		mg_voronoi_spawnplayer(player)
	end)
	
	minetest.register_on_respawnplayer(function(player)
		mg_voronoi_spawnplayer(player)
		return true
	end)





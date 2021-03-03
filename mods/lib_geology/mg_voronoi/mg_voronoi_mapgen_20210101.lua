

minetest.set_mapgen_setting('mg_name','singlenode',true)
minetest.set_mapgen_setting('flags','nolight',true)
--minetest.set_mapgen_params({mgname="singlenode"})


	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor

	local player_spawn_point = {x=-5,y=0,z=-5}
	local origin_y_val = {x=0,y=0,z=0}

	mg_voronoi.cliffmap = {}
	mg_voronoi.fillermap = {}
	mg_voronoi.edgemap = {}

	mg_voronoi.heatmap = {}
	mg_voronoi.humidmap = {}


	mg_voronoi.mg_world_scale = gal.mapgen.mg_world_scale
	local mg_world_scale = mg_voronoi.mg_world_scale
	mg_voronoi.mg_river_size = 5

	mg_voronoi.water_level = gal.mapgen.water_level
	mg_voronoi.use_heat_scalar = false

	local b_mult = 1
	local dist_metric = gal.mapgen.distance_metric
	--gal.lib.voronoi.distance_metric = dist_metric
	--gal.lib.metrics.set_dist_func(gal.lib.voronoi.distance_metric)

	local mg_base_height = 300 * mg_world_scale
	local mg_tectonic_scale = 0.1
	local max_lowland = gal.mapgen.maxheight_lowland
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

	mg_voronoi.mg_noise_spread = 2400
--##	(2400 * 0.1) * 0.25 == 240 / 4 == 60
	mg_voronoi.mg_noise_scale = 35
	mg_voronoi.mg_noise_offset = -4 * mg_voronoi.mg_world_scale
	mg_voronoi.mg_noise_octaves = 7
	mg_voronoi.mg_noise_persist = 0.4
	mg_voronoi.mg_noise_lacunarity = 2.19


	local nobj_terrain = nil
	local nbuf_terrain = {}

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

	np_terrain = {
		offset = mg_voronoi.mg_noise_offset * mg_voronoi.mg_world_scale,
		scale = mg_voronoi.mg_noise_scale * mg_voronoi.mg_world_scale,
		seed = 5934,
		spread = {x = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale), y = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale), z = (mg_voronoi.mg_noise_spread * mg_voronoi.mg_world_scale)},
		octaves = mg_voronoi.mg_noise_octaves,
		persist = mg_voronoi.mg_noise_persist,
		lacunarity = mg_voronoi.mg_noise_lacunarity,
		--flags = "defaults"
	}
	local np_cliffs = {
		offset = 0,					
		scale = 0.72,
		spread = {x = 180, y = 180, z = 180},
		seed = 78901,
		octaves = 5,
		persist = 0.5,
		lacunarity = 2.19,
	}
	np_filler_depth = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 1.2,
		spread = {x = 150, y = 150, z = 150},
		seed = 261,
		octaves = 3,
		persistence = 0.7,
	}
	local np_heat = {
		flags = "defaults",
		lacunarity = 2,
		offset = 0,
		scale = 12.5,
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = (1000 * mg_voronoi.mg_world_scale), y = (1000 * mg_voronoi.mg_world_scale), z = (1000 * mg_voronoi.mg_world_scale)},
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
		offset = 50,
		scale = 50,
		--spread = {x = 1000, y = 1000, z = 1000},
		spread = {x = (1000 * mg_voronoi.mg_world_scale), y = (1000 * mg_voronoi.mg_world_scale), z = (1000 * mg_voronoi.mg_world_scale)},
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

	c_northamerica = {
		x = (mg_points[1].x + mg_points[2].x + mg_points[3].x + mg_points[4].x + mg_points[5].x + mg_points[6].x + mg_points[1].x) / 7,
		z = (mg_points[1].z + mg_points[2].z + mg_points[3].z + mg_points[4].z + mg_points[5].z + mg_points[6].z + mg_points[1].z) / 7
	}
	c_southamerica = {
		x = (mg_points[8].x + mg_points[9].x + mg_points[10].x + mg_points[11].x) / 4,
		z = (mg_points[8].z + mg_points[9].z + mg_points[10].z + mg_points[11].z) / 4
	}
	c_europe = {
		x = (mg_points[12].x + mg_points[13].x + mg_points[14].x + mg_points[15].x + mg_points[16].x) / 5,
		z = (mg_points[12].z + mg_points[13].z + mg_points[14].z + mg_points[15].z + mg_points[16].z) / 5
	}
	c_asia = {
		x = (mg_points[17].x + mg_points[18].x + mg_points[19].x + mg_points[20].x + mg_points[21].x + mg_points[22].x + mg_points[23].x + mg_points[24].x + mg_points[25].x + mg_points[26].x) / 10,
		z = (mg_points[17].z + mg_points[18].z + mg_points[19].z + mg_points[20].z + mg_points[21].z + mg_points[22].z + mg_points[23].z + mg_points[24].z + mg_points[25].z + mg_points[26].z) / 10
	}
	c_africa = {
		x = (mg_points[27].x + mg_points[28].x + mg_points[29].x + mg_points[30].x + mg_points[31].x) / 5,
		z = (mg_points[27].z + mg_points[28].z + mg_points[29].z + mg_points[30].z + mg_points[31].z) / 5
	}
	c_australia = {
		x = mg_points[32].x,
		z = mg_points[32].z
	}


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
		local permapdims2d = {x = sidelen, y = sidelen, z = 0}
		local minpos2d = {x = x0, y = z0}

		--nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, permapdims2d)
		--nbuf_terrain = nobj_terrain:get_2d_map(minpos2d)
	
		nobj_cliffs = nobj_cliffs or minetest.get_perlin_map(np_cliffs, permapdims2d)
		nbuf_cliffs = nobj_cliffs:get_2d_map(minpos2d)
	
		nobj_filler_depth = nobj_filler_depth or minetest.get_perlin_map(np_filler_depth, permapdims2d)
		nbuf_filler_depth = nobj_filler_depth:get_2d_map(minpos2d)

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
		local XRS = 150

		for z = minp.z, maxp.z do
			for x = minp.x, maxp.x do
	
				index2d = (z - minp.z) * csize.x + (x - minp.x) + 1

				local nterrain = minetest.get_perlin(np_terrain):get_2d({x=x,y=z})
				--local nterrain = nbuf_terrain[z-minp.z+1][x-minp.x+1]

				local ncliff = nbuf_cliffs[z-minp.z+1][x-minp.x+1]
				--local n_y, n_c = get_terrain_height_cliffs(nterrain,ncliff)

				local nfill = nbuf_filler_depth[z-minp.z+1][x-minp.x+1]
				--mg_voronoi.fillermap[index2d] = nfill

				--local hterrain = nterrain + (nterrain * math.sin(nfill))
				local hterrain = nterrain * math.sin(nfill)

-- ## VORONOI DISTANCE CALCULATIONS

				local c_idx, c_dist, c_z, c_x, c_rise, c_run, c_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 3)
				local p_idx, p_dist, p_z, p_x, p_rise, p_run, p_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 2)
				--local p_idx, p_dist, p_z, p_x, p_rise, p_run, p_edge = get_cell(mg_points, {x = c_x, z = c_z}, dist_metric, 2)
				local m_idx, m_dist, m_z, m_x, m_rise, m_run, m_edge = get_cell(mg_points, {x = x, z = z}, dist_metric, 1)
				--local m_idx, m_dist, m_z, m_x, m_rise, m_run, m_edge = get_cell(mg_points, {x = p_x, z = p_z}, dist_metric, 1)

				--local mpos_dist = gal.lib.metrics.get_distance({x = (m_x - x), z = (m_z - z)}, dist_metric)
				--local mpt_dist = (m_dist + p_dist + c_dist)

				--local ppos_dist = gal.lib.metrics.get_distance({x = (p_x - x), z = (p_z - z)}, dist_metric)
				--local ppt_dist = (p_dist + c_dist)

				--local c_y = (mpos_dist - mpt_dist) + (ppos_dist - ppt_dist)
				--local p_y = mpos_dist - mpt_dist

				local mcontinental = m_dist * v_cscale
				local pcontinental = p_dist * v_pscale
				local ccontinental = c_dist * v_mscale
				local bcontinental = (mcontinental + pcontinental + ccontinental)

					----local pm_mid_x, pm_mid_z = gal.lib.metrics.get_midpoint({x = m_x, z = m_z}, {x = p_x, z = p_z})
				--local v_tri_x, v_tri_z = gal.lib.metrics.get_triangulation_2d({x = m_x, z = m_z}, {x = p_x, z = p_z}, {x = c_x, z = c_z})
				--local v_dist = gal.lib.metrics.get_distance({x = (v_tri_x - x), z = (v_tri_z - z)}, dist_metric)
				--local vcontinental = v_dist * v_pscale

					----local mslope = (mg_base_height * 1.4) - mcontinental
					----local mpslope = (mg_base_height * 1.4) - p_dist
					----local pslope = ((m_z - p_z) / (m_x - p_x))
					----local cslope = ((p_z - c_z) / (p_x - c_x))
					----local vslope = (mslope + pslope + cslope)

					----local mpslope = ((m_z - p_z) / (m_x - p_x))
					--local v_slope = (v_tri_z - z) / (v_tri_x - x)
					--local mp_y = ((mg_base_height * 1.4) - vcontinental) / v_dist

-- ## TERRAIN GENERATION
				local cont_x
				local cont_z

				if m_idx >= 1 and m_idx <= 7 then
					cont_x = c_northamerica.x
					cont_z = c_northamerica.z
				elseif m_idx >= 8 and m_idx <= 11 then
					cont_x = c_southamerica.x
					cont_z = c_southamerica.z
				elseif m_idx >= 12 and m_idx <= 16 then
					cont_x = c_europe.x
					cont_z = c_europe.z
				elseif m_idx >= 17 and m_idx <= 26 then
					cont_x = c_asia.x
					cont_z = c_asia.z
				elseif m_idx >= 27 and m_idx <= 31 then
					cont_x = c_africa.x
					cont_z = c_africa.z
				elseif m_idx == 32 then
					cont_x = c_australia.x
					cont_z = c_australia.z
				else
					cont_x = x
					cont_z = z
				end

				local cont_terrain = gal.lib.metrics.get_distance({x = (cont_x - x), z = (cont_z - z)}, dist_metric) * v_pscale

				--local bterrain = (mg_base_height - bcontinental) + (mg_base_height * 0.4)
				local bterrain = (mg_base_height - (cont_terrain + bcontinental)) + (mg_base_height * 0.4)
				local bheight = (bterrain + nterrain) * (1/bcontinental)
				local belevation = bheight * (mg_world_scale/0.01)

				--local cterrain = (mg_base_height - c_y) + (mg_base_height * 0.4)
				--local cheight = cterrain * (1/bcontinental)
				--local celevation = cheight * (mg_world_scale/0.01)

				------CREDITS:  Dokimi mg_tectonic
				--local v_gradient = mcontinental / mg_base_height
 				--local v_mup = (1 - v_gradient) + (-1 * v_gradient)
				--local v_whs = 1 - v_gradient
				--local v_roll = XRS + (XRS * v_gradient)
				--local v_wav = (v_whs * math.sin(mcontinental / v_roll))    -- north south wave (main ranges)
				--local v_den_base = (v_wav ^3) + v_mup + ((belevation ^2) * v_whs)
				----local v_tectonic = (v_den_base * 0.1) * mg_world_scale
				--local v_tectonic = (v_den_base * 0.1875) * mg_world_scale
					--local t_base = 0.01 * y
					--local den_soft = (den_base * 1.5) + ((nfill ^3) * 0.5) - v_gradient
					--local t_soft = 0.03 * y - 1.5
					--local den_allu = (den_soft * 1.01) - (v_gradient * 1.5)
					--local t_allu = 0.056 * y - 2.98
					--local den_sedi = (den_allu * 1.1)
					--local t_sedi = 0.057 * y - 3.2

					----a river running bisecting the land East/west
					--local channel = (50 +(n_terr2*30))*math.cos(xab/42)
					--local w = (22 + (n_terr2*9) + (10*xtgrad)) * (1 + (y/(12 - (3*xtgrad))))
					--if z <= channel + w and z >= channel - w then
					--	basin = true
					--end

					------local hterrain = nterrain * math.sin(nfill)
				--local mterrain = belevation * math.sin(hterrain)
					----local nelevation = belevation + v_tectonic
				--local nelevation = belevation + mterrain
				local nelevation = belevation + hterrain
					----local nelevation = belevation + v_tectonic + mterrain
					----local nelevation = celevation
						--local nelevation = (mp_y * 0.1)

				local t_y, t_c = get_terrain_height_cliffs(nelevation,ncliff)
				mg_voronoi.cliffmap[index2d] = t_c


				gal.mapgen.heightmap[index2d] = t_y

--## BIOMES GENERATION

				local nheat = gal.mapgen.get_heat_scalar(z) + (nbuf_heatmap[z-minp.z+1][x-minp.x+1] + nbuf_heatblend[z-minp.z+1][x-minp.x+1])

				----local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]) + (((x - m_x) * 0.1) / (t_y - max_lowland))
				----local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]) + (((x - m_x) * (0.01 / mg_world_scale)) - (t_y - max_lowland))
				--local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]) + math.sin((x - cont_x) * (0.001 / mg_world_scale))
				local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1]) + ((abs(x - cont_x) * (0.001 / mg_world_scale)) + (math.sin(abs(x - cont_x) * (0.001 / mg_world_scale))))
				----local nhumid = gal.mapgen.get_humid_scalar(z) + (nbuf_humiditymap[z-minp.z+1][x-minp.x+1] + nbuf_humidityblend[z-minp.z+1][x-minp.x+1])

				mg_voronoi.heatmap[index2d] = nheat
				mg_voronoi.humidmap[index2d] = nhumid

				gal.mapgen.biomemap[index2d] = gal.mapgen.get_biome_name(nheat,nhumid,t_y)
				if z == center_of_chunk_z and x == center_of_chunk_x then
					gal.mapgen.chunk_biome = gal.mapgen.biomemap[index2d]
				end


--## EDGE MAP
				local t_edge = ""
				if m_edge and m_edge ~= "" then
					t_edge = 1
				end
				if p_edge and p_edge ~= "" then
					t_edge = 2
				end
				if c_edge and c_edge ~= "" then
					t_edge = 4
				end
				mg_voronoi.edgemap[index2d] = t_edge

				--mean_alt = mean_alt + t_y

--## SPAWN SELECTION
				if z == player_spawn_point.z then
					if x == player_spawn_point.x then
						player_spawn_point.y = t_y
					end
				end
				if z == origin_y_val.z then
					if x == origin_y_val.x then
						origin_y_val.y = t_y
					end
				end
			end
		end
	
		--gal.mapgen.chunk_mean_altitude = mean_alt / ((x1 - x0) * (z1 - z0))

		local t2 = os.clock()
	
		local t3 = os.clock()
	--
	--2D HEIGHTMAP RENDER
		local index2d = 0
		for z = minp.z, maxp.z do
			for y = minp.y, maxp.y do
				--local vi = area:index(minp.x, y, z)
				for x = minp.x, maxp.x do
				 
					index2d = (z - minp.z) * csize.x + (x - minp.x) + 1   
					local ivm = a:index(x, y, z)

					local theight = gal.mapgen.heightmap[index2d]
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
					--max_high = max_highland + h_mod
					--max_mount = max_mountain + h_mod
					max_high = max_highland
					max_mount = max_mountain

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
-- ## NODE PLACEMENT FROM HEIGHTMAP

					local t_node = t_ignore

				--2D Terrain
					if y < (theight - (fill_depth + top_depth)) then
						t_node = t_stone
					elseif y >= (theight - (fill_depth + top_depth)) and y < (theight - top_depth) then
						t_node = t_filler
					elseif y >= (theight - top_depth) and y <= theight then
						t_node = t_top
					elseif y > theight and y <= mg_voronoi.water_level then
					--Water Level (Sea Level)
						t_node = t_water
					end

					--data[vi] = t_node
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





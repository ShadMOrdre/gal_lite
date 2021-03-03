

--##
--##	CONSTANTS, LOCALIZED FUNCTIONS
--##

	local abs   = math.abs
	local max   = math.max
	local min   = math.min
	local floor = math.floor
	
	

--##
--##    LINE FUNCTIONS:  Lerp, Steps, Bias, Gain
--##

	gal.lib.metrics.lerp = function(noise_a, noise_b, n_mod)
		return noise_a * (1 - n_mod) + noise_b * n_mod
	end

	gal.lib.metrics.steps = function(noise, h)
		local w = math.abs(noise)				--n_base
		local k = math.floor(h / w)
		local f = (h - k * w) / w
		local s = math.min(2 * f, 1.0)
		return (k + s) * w
	end

	gal.lib.metrics.bias = function(noise, bias)
		return (noise / ((((1.0 / bias) - 2.0) * (1.0 - noise)) + 1.0))
	end

	gal.lib.metrics.gain = function(noise, gain)
		if noise < 0.5 then
			return bias(noise * 2.0, gain) / 2.0
		else
			return bias(noise * 2.0 - 1.0, 1.0 - gain) / 2.0 + 0.5
		end
	end



--##
--##	MIDPOINT, TRIANGULATION FUNCTIONS
--##

	gal.lib.metrics.get_midpoint = function(a,b)						--get_midpoint(a,b)
		--return {x = ((a.x+b.x) * 0.5), z = ((a.z+b.z) * 0.5)}				--returns the midpoint between two points
		return ((a.x+b.x) * 0.5), ((a.z+b.z) * 0.5)					--returns the midpoint between two points
	end
	
	gal.lib.metrics.get_triangulation_2d = function(a,b,c)					--get_2d_triangulation(a,b,c)
		return ((a.x+b.x+c.x)/3), ((a.z+b.z+c.z)/3)				--returns the triangulated point between three points (average pos)
	end
	
	gal.lib.metrics.get_triangulation_3d = function(a,b,c)					--get_3d_triangulation(a,b,c)
		return ((a.x+b.x+c.x)/3), ((a.y+b.y+c.y)/3), ((a.z+b.z+c.z)/3)		--returns the 3D triangulated point between three points (average pos)
	end


--##
--##	DIRECTION, SLOPE FUNCTIONS
--##

	gal.lib.metrics.get_direction_to_pos = function(a,b)
		local t_compass
		local t_dir = {x = 0, z = 0}
	
		if a.z < b.z then
			t_dir.z = 1
			t_compass = "N"
		elseif a.z > b.z then
			t_dir.z = -1
			t_compass = "S"
		else
			t_dir.z = 0
			t_compass = ""
		end
		if a.x < b.x then
			t_dir.x = 1
			t_compass = t_compass .. "E"
		elseif a.x > b.x then
			t_dir.x = -1
			t_compass = t_compass .. "W"
		else
			t_dir.x = 0
			t_compass = t_compass .. ""
		end
		return t_dir, t_compass
	end
	
	gal.lib.metrics.get_slope = function(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		return (rise/run), rise, run
	end
	
	gal.lib.metrics.get_3d_slope = function(a,b)
		local h_run = a.x-b.x
		local h_rise = a.z-b.z
		local h_slope = h_rise / h_run
		local v_run = ((h_run * h_run) + (h_rise * h_rise))^0.5
		local v_rise = a.y-b.y
		local v_slope = v_rise / v_run

		return v_slope, v_rise, v_run, h_slope, h_rise, h_run
	end
	
	gal.lib.metrics.get_slope_inverse = function(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		return (run/rise) / 2, run, rise
	end
	
	gal.lib.metrics.get_line_inverse = function(a,b)
		local run = a.x-b.x
		local rise = a.z-b.z
		local inverse = (run - rise) / 2
		local c = {
			x = a.x + inverse,
			y = b.z + inverse
		}
		local d = {
			x = b.x - inverse,
			y = a.z - inverse
		}
		return c, d
	end

	gal.lib.metrics.get_trilinear_interpolation = function(a,b)

		local v000 = {x = a.x, y = a.y, z = a.z}
		local v100 = {x = b.x, y = a.y, z = a.z}
		local v010 = {x = a.x, y = b.y, z = a.z}
		local v001 = {x = a.x, y = a.y, z = b.z}
		local v101 = {x = b.x, y = a.y, z = b.z}
		local v011 = {x = a.x, y = b.y, z = b.z}
		local v110 = {x = b.x, y = b.y, z = a.z}
		local v111 = {x = b.x, y = b.y, z = b.z}

		local p000 = (1 - v000.x) * (1 - v000.y) * (1 - v000.z)
		local p100 = v100.x * (1 - v100.y) * (1 - v100.z)
		local p010 = (1 - v010.x) * v010.y * (1 - v010.z)
		local p001 = (1 - v001.x) * (1 - v001.y) * v001.z
		local p101 = v101.x * (1 - v101.y) * v101.z
		local p011 = (1 - v011.x) * v011.y * v011.z
		local p110 = v110.x * v110.y * (1 - v110.z)
		local p111 = v111.x * v111.y * v111.z

		return p000 + p100 + p010 + p001 + p101 + p011 + p110 + p111
	end
	





--##
--##	DISTANCE FUNCTIONS
--##

--## 3D Distance

	gal.lib.metrics.get_distance_3d_chebyshev = function(a,b)						--get_distance(a,b)
	    return (max(abs(a.x-b.x), max(abs(a.y-b.y), abs(a.z-b.z))))					--returns the chebyshev distance between two points
	end

	gal.lib.metrics.get_distance_3d_euclid = function(a,b)
		local dx = a.x - b.x
		local dy = a.y - b.y
		local dz = a.z - b.z
		return (dx*dx+dy*dy+dz*dz)^0.5
	end

	gal.lib.metrics.get_distance_3d_manhattan = function(a,b)					--get_manhattan_distance(a,b)
	    return (abs(a.x-b.x) + abs(a.y-b.y) + abs(a.z-b.z))					--returns the manhattan distance between two points
	end


--## 2D Distance

	gal.lib.metrics.get_dist_a = function(a,b)						--get_distance(a,b)
		return (abs(a) + abs(b)) * 0.5
	end

	gal.lib.metrics.get_dist_c = function(a,b)						--get_distance(a,b)
		return max(abs(a), abs(b))
	end

	gal.lib.metrics.get_dist_e = function(a,b)						--get_distance(a,b)
		return ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
	end

	gal.lib.metrics.get_dist_l = function(a,b)						--get_distance(a,b)
		return min(abs(a), abs(b))
	end

	gal.lib.metrics.get_dist_m = function(a,b)						--get_distance(a,b)
		return abs(a) + abs(b)
	end

	gal.lib.metrics.get_dist_r = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return d_a + d_c + d_e + d_m
	end

	gal.lib.metrics.get_dist_x = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_c + d_e + d_m) * 0.25
	end

	gal.lib.metrics.get_dist_ac = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		return (d_a + d_c) * 0.5
	end

	gal.lib.metrics.get_dist_ae = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_a + d_e) * 0.5
	end

	gal.lib.metrics.get_dist_al = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_l = min(abs(a), abs(b))
		return (d_a + d_l) * 0.5
	end

	gal.lib.metrics.get_dist_am = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_m) * 0.5
	end

	gal.lib.metrics.get_dist_ce = function(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_c + d_e) * 0.5
	end

	gal.lib.metrics.get_dist_cl = function(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_l = min(abs(a), abs(b))
		return (d_c + d_e) * 0.5
	end

	gal.lib.metrics.get_dist_cm = function(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_m = abs(a) + abs(b)
		return (d_c + d_m) * 0.5
	end

	gal.lib.metrics.get_dist_em = function(a,b)						--get_distance(a,b)
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_e + d_m) * 0.5
	end

	gal.lib.metrics.get_dist_ace = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		return (d_a + d_c + d_e) * 0.35
	end

	gal.lib.metrics.get_dist_acm = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_c = max(abs(a), abs(b))
		local d_m = abs(a) + abs(b)
		return (d_a + d_c + d_m) * 0.35
	end

	gal.lib.metrics.get_dist_aem = function(a,b)						--get_distance(a,b)
		local d_a = (abs(a) + abs(b)) * 0.5
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_a + d_e + d_m) * 0.35
	end

	gal.lib.metrics.get_dist_cem = function(a,b)						--get_distance(a,b)
		local d_c = max(abs(a), abs(b))
		local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		local d_m = abs(a) + abs(b)
		return (d_c + d_e + d_m) * 0.35
	end

	gal.lib.metrics.set_dist_func = function(d_type)

		if d_type == "a" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_a
		elseif d_type == "c" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_c
		elseif d_type == "e" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_e
		elseif d_type == "l" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_l
		elseif d_type == "m" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_m
		elseif d_type == "r" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_r
		elseif d_type == "x" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_x
		elseif d_type == "ac" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_ac
		elseif d_type == "ae" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_ae
		elseif d_type == "al" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_al
		elseif d_type == "am" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_am
		elseif d_type == "ce" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_ce
		elseif d_type == "cl" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_cl
		elseif d_type == "cm" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_cm
		elseif d_type == "em" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_em
		elseif d_type == "ace" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_ace
		elseif d_type == "acm" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_acm
		elseif d_type == "aem" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_aem
		elseif d_type == "cem" then
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_cem
		else
			gal.lib.metrics.get_dist = gal.lib.metrics.get_dist_e
		end
	end

	gal.lib.metrics.get_distance = function(a,b,d_type)						--get_distance(a,b)
	
		local this_dist
		
		if d_type == "a" then
			this_dist = (abs(a) + abs(b)) * 0.5
		elseif d_type == "c" then
			this_dist = max(abs(a), abs(b))
		elseif d_type == "e" then
			this_dist = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
		elseif d_type == "l" then
			this_dist = min(abs(a), abs(b))
		elseif d_type == "m" then
			this_dist = abs(a) + abs(b)
		elseif d_type == "x" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_c + d_e + d_m) * 0.25
		elseif d_type == "r" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = d_a + d_c + d_e + d_m
		elseif d_type == "ac" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			this_dist = (d_a + d_c) * 0.5
		elseif d_type == "ae" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_a + d_e) * 0.5
		elseif d_type == "al" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_l = min(abs(a), abs(b))
			this_dist = (d_a + d_l) * 0.5
		elseif d_type == "am" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_m) * 0.5
		elseif d_type == "ce" then
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_c + d_e) * 0.5
		elseif d_type == "cl" then
			local d_c = max(abs(a), abs(b))
			local d_l = min(abs(a), abs(b))
			this_dist = (d_c + d_e) * 0.5
		elseif d_type == "cm" then
			local d_c = max(abs(a), abs(b))
			local d_m = abs(a) + abs(b)
			this_dist = (d_c + d_m) * 0.5
			--this_dist = (d_c + d_m)
		elseif d_type == "em" then
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_e + d_m) * 0.5
		elseif d_type == "ace" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			this_dist = (d_a + d_c + d_e) * 0.35
		elseif d_type == "acm" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_c = max(abs(a), abs(b))
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_c + d_m) * 0.35
		elseif d_type == "aem" then
			local d_a = (abs(a) + abs(b)) * 0.5
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_a + d_e + d_m) * 0.35
		elseif d_type == "cem" then
			local d_c = max(abs(a), abs(b))
			local d_e = ((abs(a) * abs(a)) + (abs(b) * abs(b)))^0.5
			local d_m = abs(a) + abs(b)
			this_dist = (d_c + d_e + d_m) * 0.35
		else
			this_dist = 0
		end
	
		return this_dist
	
	end











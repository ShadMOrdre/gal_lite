


					--local cm_idx, cm_dist, cm_z, cm_x, cm_rise, cm_run, cm_edge = get_cell(mg_points, {x = c_x, z = c_z}, dist_metric, 1)
					--local cp_idx, cp_dist, cp_z, cp_x, cp_rise, cp_run, cp_edge = get_cell(mg_points, {x = c_x, z = c_z}, dist_metric, 2)

					--local pm_idx, pm_dist, pm_z, pm_x, pm_rise, pm_run, pm_edge = get_cell(mg_points, {x = p_x, z = p_z}, dist_metric, 1)
					--local pc_idx, pc_dist, pc_z, pc_x, pc_rise, pc_run, pc_edge = get_cell(mg_points, {x = p_x, z = p_z}, dist_metric, 3)

					--local mp_idx, mp_dist, mp_z, mp_x, mp_rise, mp_run, mp_edge = get_cell(mg_points, {x = m_x, z = m_z}, dist_metric, 2)
					--local mc_idx, mc_dist, mc_z, mc_x, mc_rise, mc_run, mc_edge = get_cell(mg_points, {x = m_x, z = m_z}, dist_metric, 3)

					--local mp_idx, mp_dist, mp_z, mp_x, mp_rise, mp_run, mp_edge = get_cell(mg_points, {x = xm_x, z = xm_z}, dist_metric, 2)
					--local mc_idx, mc_dist, mc_z, mc_x, mc_rise, mc_run, mc_edge = get_cell(mg_points, {x = xm_x, z = xm_z}, dist_metric, 3)



					--local mcontinental = m_dist * v_cscale
					--local pcontinental = p_dist * v_pscale
					--local ccontinental = c_dist * v_mscale

					--local bcontinental = (mcontinental + pcontinental + ccontinental)

				--local xmcontinental = (xm_dist * v_cscale) - xm_slope
				--local xpcontinental = (xp_dist * v_pscale) - xp_slope
				--local xccontinental = (xc_dist * v_mscale) - xc_slope




					----local p_y = (mg_base_height * 1.4) - ((pm_dist * v_cscale) + (pc_dist * v_mscale))
					--local p_y = m_y - (pm_dist * v_cscale)
					----local c_y = (mg_base_height * 1.4) - ((cm_dist * v_cscale) + (cp_dist * v_pscale))
					--local c_y = p_y - (cp_dist * v_pscale)


				--local mpc_x = (m_x + p_x + c_x) / 3
				--local mpc_z = (m_z + p_z + c_z) / 3
				--local mpc_d = gal.lib.metrics.get_distance((mpc_x - x), (mpc_z - z), dist_metric)








--[[
					--local vcontinental = (tcontinental + bcontinental)
				--local vcontinental = bcontinental
				--local bterrain = (mg_base_height - bcontinental) + (mg_base_height * 0.4)
				--local vterrain = (-mg_base_height + vcontinental) - (mg_base_height * 0.4)
					------local bterrain = (mg_base_height + (tcontinental^0.5)) - vcontinental
					------local bterrain = (mg_base_height - vcontinental) + (mg_base_height * 0.4) + (tcontinental^0.5)

				--local fterrain
				--if bterrain > min_ocean then
				--	fterrain = bterrain
				--else
				--	fterrain = vterrain
				--end
				--local fterrain = c_y - (c_dist * v_mscale)
				local fterrain = c_y

					----local nheight = (nterrain * math.sin(nfill)) * (1 / bcontinental)
					------local nheight = nterrain * math.sin(nfill)
					------local aheight = (aterrain * math.sin(nfill)) * (1 / bcontinental)
					--local aheight = aterrain * math.sin(nfill)
					----------local anheight = (anterrain * math.sin(nfill)) * (1 / bcontinental)

					--local bheight = bterrain * (1 / bcontinental)
					--local bheight = (bterrain + nheight) * (1 / bcontinental)
					----local bheight = (bterrain + nterrain) * fcontinental
				------local bheight = (bterrain + aterrain) * (1 / bcontinental)
					--local bheight = (bterrain + aterrain + nterrain) * (1 / bcontinental)
					----local hheight = (aheight + nheight) * (1 / bcontinental)
					--local hheight = ((aterrain + nterrain) * math.sin(nfill)) * (1 / bcontinental)
					--local bheight = bterrain + (((aterrain + nterrain) * math.sin(nfill)) * (1 / bcontinental))
				--local vheight = vterrain * (1 / vcontinental)

				--local belevation = bheight * (mg_world_scale / 0.01)
				--local velevation = vheight * (mg_world_scale / 0.01)
					----local belevation = (bheight + nheight) * (mg_world_scale / 0.01)
					--local belevation = (bheight + aheight) * (mg_world_scale / 0.01)
				--local belevation = bterrain + (hheight * (mg_world_scale / 0.01))

					--local felevation = fterrain * (mg_world_scale / 0.01)
					--local helevation = hterrain * (mg_world_scale / 0.01)
--]]


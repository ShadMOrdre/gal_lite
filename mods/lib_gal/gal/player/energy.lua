function gal.player.energy.update_energy(p,name,dtime)
	-- loop through all online players and check their movement and update their energy
		local pos = p:getpos()
		local lastpos = gal.player.data.get(name,"lastpos")
		--local timelast = gal.player.data.get(name,"timeofday")
		--local timeofday = minetest.get_timeofday()
		local timesince = minetest.get_timeofday() - gal.player.data.get(name,"timeofday")
		--local daylast = gal.player.data.get(name,"currentday")
		--local currentday = minetest.get_day_count()
		local daysince = minetest.get_day_count() - gal.player.data.get(name,"currentday")
		local p_stamina = gal.player.data.get_number(name,"stamina")
		local sleep_hud = gal.player.data.get(name,"sleep_hud")

		--minetest.log("ToD:  " .. minetest.get_timeofday() .. "  |     CurDay:  " .. minetest.get_day_count() .. "  |")

		if timesince >= 0.05 then
			if lastpos ~= nil then
					if minetest.check_player_privs(name, {immortal=true}) then
						gal.player.data.set(name,"energy",20)
						return
					end
					
					local anim = gal.player.api.get_animation(p)
					local adj = 0.2
					if anim.animation == "lay" then
						adj = adj + 1.15
						if math.random(0,4) == 1 then
							minetest.sound_play("default_snore",{object=p})
						end
						if p:get_hp() < gal.player.data.get_number(name,"max_hp") then
							p:set_hp(p:get_hp()+2)
						end
					end
					if anim.animation == "sit" then
						adj = adj + 0.5
						if p:get_hp() < gal.player.data.get_number(name,"max_hp") then
							p:set_hp(p:get_hp()+1)
						end
					end
					
						-- adjust their energy
						local vdiff = pos.y - lastpos.y
						if vdiff > 0 then
							adj = adj - ( vdiff * 0.2 )
						end
						
						local hdiff = math.sqrt(math.pow(pos.x-lastpos.x, 2) + math.pow(pos.z-lastpos.z, 2))
						
						gal.player.data.increment(name,STAT_TRAVEL,math.floor(hdiff))
						
						adj = adj - ( hdiff * 0.03 )
						
					--if default.player_attached_to[name] == "boats:boat" and adj < 0 then
					if gal.player.api.player_attached[name] == "boats:boat" and adj < 0 then
						adj = adj * 0.75
					end
					--print("hdiff "..tostring(hdiff))
					--print("Energy Adjustments")
					--print(tostring(adj))
					--print("After stamina adjustment")
					adj = adj + p_stamina
					--print(tostring(adj))
					
					gal.player.data.increment(name,"energy",adj)
					local p_energy = gal.player.data.get_number(name,"energy")
					--print("Energy "..tostring(p_energy))
	--				if p_energy < 0 then
	--					p_energy = 0
	--					if p:get_hp() > 0 then
	--						p:set_hp(p:get_hp()-1)
	--					else
	--						p:set_hp(0)
	--					end
	--				end
					
					if p_energy >= 20 then
						p_energy = 20
						if anim.animation == "lay" then
							-- wake them up
							--default.player_set_animation(p, "stand")
							gal.player.api.set_animation(p, "stand")
							p:set_eye_offset({x=0,y=0,z=0},{x=0,y=0,z=0})
							if sleep_hud ~= nil then
								p:hud_remove(sleep_hud)
								sleep_hud = nil
							end
							gal.player.cmsg.push_message_player(p,"You feel fully energized!")
							gal.player.physics.unfreeze_player(name)
						end
						gal.player.data.set(name,"energy",p_energy)
					end
					if p_energy < 8 and gal.player.data.get(name,"can_boost_stamina") == true then
					  gal.player.data.set(name,"can_boost_stamina",false)
					  if p_stamina < 0.65 then
					    p_stamina = p_stamina + 0.003
					  end
					end
					if p_energy < 2 then
						gal.player.affects.affectPlayer(name,"tired")
					end
					if p_energy > 8 then
					  gal.player.data.set(name,"can_boost_stamina",true)
					end
				gal.player.data.set(name,"stamina",p_stamina)
			end
		end

		gal.player.data.set(name,"lastpos",pos)
		gal.player.hud.change_item(p,"energy",{number = gal.player.data.get(name,"energy")})
end

local affect_tired = {
	affectid = "tired",
	name = "Exhaustion",
	stages = {
				{ 
					time = 120,
					physics = { speed = -0.2 },
					custom = { chance=100, func = function(name, player, affectid)
						gal.player.cmsg.push_message_player(player,"You are exhausted")
					end,runonce=true},
				},
			},
	onremove = function(name, player, affectid)
		gal.player.physics.adjust_physics(player,{speed=0.2})
		gal.player.cmsg.push_message_player(player,"You don't feel as tired anymore")
	end,
	removeOnDeath = true,
}

gal.player.affects.registerAffect(affect_tired)

minetest.register_chatcommand("sit",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		--default.player_set_animation(player, "sit")
		gal.player.api.set_animation(player, "sit")
		player:set_eye_offset({x=0,y=-5,z=0},{x=0,y=0,z=0})
		local sleep_hud = gal.player.data.get(name,"sleep_hud")
		if sleep_hud ~= nil then
			player:hud_remove(sleep_hud)
			gal.player.data.unset(name,"sleep_hud")
		end
		gal.player.physics.freeze_player(name)
	end,
})

minetest.register_chatcommand("sleep",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		--default.player_set_animation(player, "lay")
		gal.player.api.set_animation(player, "lay")
		player:set_eye_offset({x=0,y=-10,z=0},{x=0,y=0,z=0})
		local sleep_hud = player:hud_add({
			hud_elem_type = "image",
			text = "energy_blackout.png",
			position = {x=1,y=1},		
			name="sleep",
			scale = {x=-100, y=-100},
			alignment = {x=-1,y=-1},
			offset = {x=0,y=0},
		})
		gal.player.physics.freeze_player(name)
		gal.player.data.set(name,"sleep_hud",sleep_hud)
	end,
})

minetest.register_chatcommand("stand",{
	func = function( name, param )
		local player = minetest.get_player_by_name(name)
		--default.player_set_animation(player, "stand")
		gal.player.api.set_animation(player, "stand")
		player:set_eye_offset({x=0,y=0,z=0},{x=0,y=0,z=0})
		local sleep_hud = gal.player.data.get(name,"sleep_hud")
		if sleep_hud ~= nil then
			player:hud_remove(sleep_hud)
			gal.player.data.unset(name,"sleep_hud")
		end
		gal.player.physics.unfreeze_player(name)
	end,
})

function gal.player.energy.respawnplayer(player)
	local name = player:get_player_name()
	gal.player.data.set(name,"energy",20)
	gal.player.data.set(name,"lastpos",player:getpos())
	gal.player.data.set(name,"timeofday",minetest.get_timeofday())
	gal.player.data.set(name,"currentday",minetest.get_day_count())
	gal.player.energy.update_energy(player,name)	
end

mobs:register_mob("mobs_npc:female1_npc", {
type = "npc",
	hp_min = 30,
	hp_max = 75,
	exp_min = 0,
	exp_max = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	textures = {
		"mobs_female1.png",	
		"3d_armor_trans.png",
		"3d_armor_trans.png",
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1.25,
	run_velocity = 3.75,
	damage = 6,
	drops = { },
	armor = 150,
	drawtype = "front",
	activity_level = 5,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	walk_chance = 1,
	attack_type = "dogfight",
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	jump = true,
	sounds = {
		attack = "default_punch",
	},
	attacks_monsters=false,
	peaceful = true,
	step=2,
	blood_amount = 35,
	blood_offset = 0.25,
	rewards = {
		{chance=90, item="gal:food_bread"},
		{chance=40, item="gal:6_exp"},
		{chance=60, item="potions:magic_replenish1"},
	},
})

mobs:register_mob("mobs_npc:female2_npc", {
type = "npc",
	hp_min = 30,
	hp_max = 75,
	exp_min = 0,
	exp_max = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	textures = {
		"mobs_female2.png",	
		"3d_armor_trans.png",
		"3d_armor_trans.png",
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1.25,
	run_velocity = 3.75,
	damage = 6,
	drops = { },
	armor = 150,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	activity_level = 5,
	attack_type = "dogfight",
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	jump = true,
	sounds = {
		attack = "default_punch",
	},
	attacks_monsters=false,
	peaceful = true,
	step=2,
	blood_amount = 35,
	blood_offset = 0.25,
	rewards = {
		{chance=90, item="gal:food_bread"},
		{chance=40, item="gal:6_exp"},
		{chance=60, item="potions:magic_replenish1"},
	},
})

mobs:register_mob("mobs_npc:female3_npc", {
type = "npc",
	hp_min = 30,
	hp_max = 75,
	exp_min = 0,
	exp_max = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	textures = {
		"mobs_female3.png",	
		"3d_armor_trans.png",
		"3d_armor_trans.png",
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1.3,
	run_velocity = 4.15,
	damage = 6,
	drops = { },
	armor = 150,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	activity_level = 5,
	attack_type = "dogfight",
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	jump = true,
	sounds = {
		attack = "default_punch",
	},
	attacks_monsters=false,
	peaceful = true,
	step=2,
	blood_amount = 35,
	blood_offset = 0.25,
	rewards = {
		{chance=90, item="gal:food_bread"},
		{chance=40, item="gal:6_exp"},
		{chance=60, item="potions:magic_replenish1"},
	},
})

mobs:register_mob("mobs_npc:mother", {
	type = "npc_special",
	hp_min = 30,
	hp_max = 75,
	exp_min = 0,
	exp_max = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "3d_armor_character.x",
	textures = {"mobs_mother.png",	
				"3d_armor_trans.png",
				"3d_armor_trans.png",
			},
	visual_size = {x=0.9, y=0.9},
	makes_footstep_sound = true,
	view_range = 12,
	walk_velocity = 1.3,
	run_velocity = 4.15,
	damage = 6,
	drops = { },
	armor = 150,
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	on_rightclick = nil,
	activity_level = 65,
	attack_type = "dogfight",
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219,
	},
	jump = true,
	sounds = {
		attack = "default_punch",
	},
	attacks_monsters=false,
	peaceful = true,
	step=2,
	blood_amount = 35,
	blood_offset = 0.25,
	rewards = {
	},
	walk_chance = 0,
	lifetimer = false,
	avoid_nodes = {"gal:fire_basic_flame","gal:liquid_water_source","gal:liquid_water_flowing","gal:liquid_lava_source","gal:liquid_lava_flowing"},
	avoid_range = 4,
	on_step = function(self,dtime)
		self.timer = self.timer+dtime		
		if self.timer < self.step then
			return
		end
		self.timer = 0
		if self.sounds and self.sounds.random and self.state ~= "attack" then
			if randomChance(self.random_freq) then
				if ( self.type == "npc" and randomChance(65) ) or self.type ~= "npc" then
					local maxhear = 50
					local g = 1
					if self.type == "npc" then
						maxhear = 20
						g = 0.7
					end 			
					minetest.sound_play(self.sounds.random, {object = self.object, max_hear_distance=maxhear, gain=g})
				end
			end
		end
		
		--math.randomseed(os.clock())
		if math.random(1, 100) < self.activity_level then
			if mobs.api_throttling(self) then return end
			-- if there is a player nearby look at them			
			local lp = nil
			local s = self.object:getpos()
		
			local o = minetest.get_objects_inside_radius(self.object:getpos(), 3)
			
			local yaw = 0
			for _,o in pairs(o) do
				if o:is_player() then
					lp = o:getpos()
					break
				end
			end
		
			if lp ~= nil then
				mobs:face_pos(self,lp)
			else 
				local yaw = self.object:getyaw()+((math.random(0,360)-270)/180*math.pi)
				self.object:setyaw(yaw)
			end
		end
		self.set_velocity(self, 0)
		self.set_animation(self, "stand")		
	end,
})


mobs:register_egg("mobs_npc:female1_npc", "NPC - Female 01", "mobs_human_female_icon.png", 1)

mobs:register_egg("mobs_npc:female2_npc", "NPC - Female 02", "mobs_human_female_icon.png", 1)

mobs:register_egg("mobs_npc:female3_npc", "NPC - Female 03", "mobs_human_female_icon.png", 1)

mobs:register_egg("mobs_npc:mother", "NPC - Mother", "mobs_human_female_icon.png", 1)


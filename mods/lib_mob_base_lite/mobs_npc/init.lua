
mobs_npc = {}

mobs_npc.path = minetest.get_modpath("mobs_npc")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...)
		if a == nil then
			return s
		end
		a = {a, ...}
		return s:gsub("(@?)@(%(?)(%d+)(%)?)",
			function(e, o, n, c)
				if e == ""then
					return a[tonumber(n)] .. (o == "" and c or "")
				else
					return "@" .. o .. n .. c
				end
			end)
	end
end
mobs.intllib = S

dofile(mobs_npc.path .. "/utils.lua")  --From Adventuretest
dofile(mobs_npc.path .. "/npc_appearance.lua") -- TenPlus1

-- NPC
dofile(mobs_npc.path .. "/npc.lua") -- TenPlus1
dofile(mobs_npc.path .. "/trader.lua")  --From Farlands
--dofile(mobs_npc.path .. "/blacksmith_vAdventureTEST.lua")  --From Adventuretest
dofile(mobs_npc.path .. "/builder.lua")  --From Adventuretest
dofile(mobs_npc.path .. "/soldier.lua")  --From Adventuretest
--dofile(path .. "/igor.lua")    TO BE USED AS STUB FOR NPCF DECO AND NPCF INFO NPCs.


dofile(mobs_npc.path.."/barbarians.lua")
dofile(mobs_npc.path.."/blacksmith.lua")
dofile(mobs_npc.path.."/explorer.lua")
dofile(mobs_npc.path.."/men.lua")
dofile(mobs_npc.path.."/women.lua")
dofile(mobs_npc.path.."/kids.lua")

dofile(mobs_npc.path.."/spawner.lua")

dofile(mobs_npc.path .. "/mobs_npc_tool.lua") -- TenPlus1

dofile(mobs_npc.path .. "/lucky_block.lua")

print (S("[MOD] Mobs Redo 'NPCs' loaded"))

-- New stuff

minetest.register_node("mobs_npc:beacon", {
	description = "NPC Beacon",
	tiles = {
		"mobs_beacon.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.4375, -0.4375, 0.5}, -- NodeBox1
			{-0.5, 0.4375, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox3
			{0.4375, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox5
			{-0.5, 0.4375, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox7
			{-0.5, -0.5, 0.4375, 0.5, -0.4375, 0.5}, -- NodeBox8
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox9
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox11
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox12
			{-0.25, -0.25, -0.25, 0.25, 0.25, 0.25}, -- NodeBox13
			{-0.3125, -0.3125, -0.3125, 0.3125, 0.3125, 0.3125}, -- NodeBox14
			{-0.4375, -0.4375, -0.4375, 0.4375, 0.4375, 0.4375}, -- NodeBox15
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.4375, -0.4375, 0.5}, -- NodeBox1
			{-0.5, 0.4375, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox2
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox3
			{0.4375, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox4
			{-0.5, 0.4375, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox5
			{-0.5, 0.4375, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox6
			{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.4375}, -- NodeBox7
			{-0.5, -0.5, 0.4375, 0.5, -0.4375, 0.5}, -- NodeBox8
			{-0.5, -0.5, 0.4375, -0.4375, 0.5, 0.5}, -- NodeBox9
			{0.4375, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox10
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.4375}, -- NodeBox11
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.4375}, -- NodeBox12
		}
	},
	use_texture_alpha = true,
	groups = {cracky=1, oddly_breakeable_by_hand=1},
	sounds = gal.node_sound_glass_defaults()
})

minetest.register_abm({
	nodenames = {"mobs_npc:beacon",},
	interval = 10,
	chance = 25,
	action = function(pos, node)
		minetest.add_entity({x=pos.x+math.random(-5,5), y=pos.y+0.5, z=pos.z+math.random(-5,5)}, "mobs_npc:npc")
		local position = minetest.pos_to_string(pos, 0)
		minetest.chat_send_all("npc spawned at:"..position)
	end
})

minetest.register_craft({
	output = 'mobs_npc:beacon',
	recipe = {
		{'', 'default:glass', ''},
		{'default:glass', 'default:diamond', 'default:glass'},
		{'', 'default:glass', ''},
	}
})


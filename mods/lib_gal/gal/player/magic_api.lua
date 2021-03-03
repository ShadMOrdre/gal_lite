--[[ SPELL DEF

{
	-- Parameters
	id = Spell Identifier, used in /cast command (e.g /cast <id> <target>)
	type = Cast, Wand
	level = minimum magic level to use spell
	
	-- Cast Specifics
	on_cast (name,target) = function to call when using /cast <id>. Target can be nil
	
	-- Wand Specific
	on_use = function to call when wand is used
	wand_texture = texture for the wand tool
}
]]

gal.player.magic._spells = {}

function gal.player.magic.register_spell(def)
	if def.id == "" or def.id == nil then
		minetest.log("error","Unable to register spell, no ID")
		return
	end
	if def.type == "cast" then
		if def.on_cast == nil then
			minetest.log("error","Unable to register spell, missing on_cast function")
			return
		end
		gal.player.magic._spells[def.id] = def
	end
	
	if def.type == "wand" then
		-- wand will automatically register the wand tool
		if def.on_use == nil then
			minetest.log("error","Unable to register spell, missing on_use function")
			return
		end
		if def.wand_texture == nil then
			minetest.log("error","Unable to register spell, missing wand_texture")
			return
		end
		-- register the wand tool
		minetest.register_tool("gal:wand_"..def.id,{
			description = def.desc,
			inventory_image = def.wand_texture,
		    stack_max = 1,
			on_use = def.on_use,
			sounds = def.sounds,
			skill = SKILL_MAGIC,
		})
	end
	
	minetest.log("action","Registered spell "..tostring(def.desc))
end

function gal.player.magic.cast(id,name,target)
	if gal.player.magic._spells[id] ~= nil then
		local spell = gal.player.magic._spells[id]
		if spell.type == "cast" then
			local sk = gal.player.skills.get_skill(name,SKILL_MAGIC)
			local skb = gal.player.skills.get_def(SKILL_MAGIC)
			local mana = spell.max_mana - ( ( (sk.level - spell.level) / skb.max_level ) * 10 )
			if sk.level >= gal.player.magic._spells[id].level then
				local p_mana = gal.player.data.get_number(name,"mana")
				if p_mana >= mana then
					p_mana = p_mana - mana
					minetest.chat_send_player(name,"You cast "..spell.desc)
					spell.on_cast(spell,name,target)
					gal.player.data.set(name,"mana",p_mana)
				else
					minetest.chat_send_player(name,"You don't have enough magic!")
				end
			else
				minetest.chat_send_player(name,"You are not a high enough level to cast "..gal.player.magic._spells[id].desc)
			end
		else
			minetest.chat_send_player(name,"You cannot cast "..tostring(id))
		end
	else
		minetest.chat_send_player(name,"Spell "..tostring(id).." does not exist")
	end
end

minetest.register_chatcommand("cast",{
	params = "<spell id> [target]",
	desc = "Casts a spell at an optional target",
	privs = {},
	func = function(name, param)
		local id, target = string.match(param, "([^ ]+) (.+)")
		if id == nil and target == nil then
			id = param
		end
		gal.player.magic.cast(id,name,target)
	end,
})

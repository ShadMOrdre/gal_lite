if (gal.player.cmsg) then
	function quests.show_message(t, playername, text)
		if (quests.hud[playername].central_message_enabled) then
			local player = minetest.get_player_by_name(playername)
			gal.player.cmsg.push_message_player(player, text, quests.colors[t])
			minetest.sound_play("quests_" .. t, {to_player = playername})
		end
	end
else
	function quests.show_message(...)
	end
end

local bookshelf_formspec =
	"size[8,7;]" ..
	gal.gui.gui_bg ..
	gal.gui.gui_bg_img ..
	gal.gui.gui_slots ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	gal.gui.get_hotbar_bg(0,2.85)

local function get_bookshelf_formspec(inv)
	local formspec = bookshelf_formspec
	local invlist = inv and inv:get_list("books")
	-- Inventory slots overlay
	local bx, by = 0, 0.3
	for i = 1, 16 do
		if i == 9 then
			bx = 0
			by = by + 1
		end
		if not invlist or invlist[i]:is_empty() then
			formspec = formspec ..
				"image[" .. bx .. "," .. by .. ";1,1;default_bookshelf_slot.png]"
		end
		bx = bx + 1
	end
	return formspec
end

minetest.register_node("lib_books:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_wood.png",
		"default_wood.png", "default_bookshelf.png", "default_bookshelf.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = gal.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bookshelf_formspec(nil))
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_bookshelf_formspec(meta:get_inventory()))
	end,
	on_blast = function(pos)
		local drops = {}
		gal.get_inventory_drops(pos, "books", drops)
		drops[#drops+1] = "lib_books:bookshelf"
		minetest.remove_node(pos)
		return drops
	end,
})


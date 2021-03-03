--This mod is licensed under CC BY-SA

lib_tree = {}
lib_tree.path = minetest.get_modpath("lib_tree")


local schem_file_list = {}
local schem_file_list_length = 0
local schem_file_list_idx = 0
local current_schematic = {}
local states = {
	"select_schem_file",
	"select_schem_rot",
	"select_save_type",
}
local rotatations = {
	"0",
	"90",
	"180",
	"270",
}
local current_state = "select_schem_file"
local current_rot = rotatations[1]                --ROTATIONS:	"0", "90", "180", "270"
local current_save_type = "mts2lua"               --TYPES:		"mts2lua", "lua2mts"

--
function lib_tree.convert_mts_to_lua()
  local building = lib_tree.path..'/schems/'..current_schem_name
  local str = minetest.serialize_schematic(building, "lua", {lua_use_comments = true, lua_num_indent_spaces = 0}).." return(schematic)"
  local schematic = loadstring(str)()
  local file = io.open(lib_tree.path..'/schems/'..current_schem_name..".lua", "w")
  file:write(dump(schematic))
  file:close()
--print(dump(schematic))
end

function lib_tree.mts_save()
    local f = assert(io.open(lib_tree.path..'/schems/'..current_schem_name..".lua", "r"))
    local content = f:read("*all").." return(schematic2)"
    f:close()

  local schematic2 = loadstring("schematic2 = "..content)()
  local seb = minetest.serialize_schematic(schematic2, "mts", {})
	local filename = lib_tree.path..'/schems/'..current_schem_name .. ".mts"
	filename = filename:gsub("\"", "\\\""):gsub("\\", "\\\\")
	local file, err = io.open(filename, "wb")
	if err == nil and seb then
		file:write(seb)
		file:flush()
		file:close()
	end
	print("Wrote: " .. filename)
end

function lib_tree.get_file_list()

	local file_list = minetest.get_dir_list( lib_tree.path..'/schems', false );
	local idx_file_list = 0
	if file_list then
		for _,filename in ipairs( file_list ) do		
			idx_file_list = idx_file_list + 1
			-- we need the filename without extension (*.mts, *.we, *.wem)
			local schemname = filename;
			local i = string.find(           filename, '.mts',  -4 );
			if( i ) then
				schemname = string.sub( filename, 1, i-1 );
			else
				i = string.find(         filename, '.we',   -3 );
				if( i ) then
					schemname = string.sub( filename, 1, i-1 );
				else
					i = string.find( filename, '.wem',  -4 );
					if( i ) then
						schemname = string.sub( filename, 1, i-1 );
					else
						i = string.find( filename, '.schematic', -10 );
						if( i ) then
							schemname = string.sub( filename, 1, i-1 );
						else
							i = string.find( filename, '.lua', -10 );
							if( i ) then
								schemname = string.sub( filename, 1, i-1 );
							else
								return;
							end
						end
					end
				end
			end

			-- only add known file types
			if( not( schemname )) then
				return;
			end

			schem_file_list[idx_file_list] = filename
		end
    end
	schem_file_list_length = idx_file_list
end

lib_tree.get_file_list()
current_schem_name = schem_file_list[1]



minetest.register_craftitem("lib_tree:tree_tool", {
    description = "Tree Schematic Tool",
    inventory_image = "worktable_saw.png",
    --
    -- save lua of schem
    --
    on_use = function(itemstack, placer, pointed_thing)
	  
	  if current_schem_name ~= "" then
	    if schem_file_list_idx == schem_file_list_length then
		  schem_file_list_idx = 1
		else
	      schem_file_list_idx = schem_file_list_idx + 1
		end
	    current_schem_name = schem_file_list[schem_file_list_idx]
	  	minetest.chat_send_all( "Using " .. schem_file_list_idx .. " of " .. schem_file_list_length .. "files")		
	  	minetest.chat_send_all( "Using " .. current_schem_name)
	  end
	  return itemstack

    end,
	
    --
    -- build schematic
    --
	on_secondary_use = function(itemstack, user, pointed_thing)
	
      if current_schematic then
		-- lib_tree.convert_mts_to_lua()
		-- towns_gambit.mts_save()
      end
	  return itemstack
	end,
	
	
    on_place = function(itemstack, placer, pointed_thing)

		if pointed_thing.above then
			
			local schem_lua = minetest.serialize_schematic(lib_tree.path .. '/schems/'..current_schem_name, "lua", {lua_use_comments = false, lua_num_indent_spaces = 0}).." return(schematic)"
			
			schem_lua = schem_lua:gsub("air", "ignore")

			schem_lua = schem_lua:gsub("30biomes:fir_needles", "lib_ecology:fir_needles")
			schem_lua = schem_lua:gsub("30biomes:fir_tree", "lib_ecology:fir_trunk")
			schem_lua = schem_lua:gsub("biomes:fir_needles", "lib_ecology:fir_needles")
			schem_lua = schem_lua:gsub("biomes:fir_treex", "lib_ecology:fir_trunk")

			schem_lua = schem_lua:gsub("basic_trees:birch_leaves", "lib_ecology:birch_01_leaves")
			schem_lua = schem_lua:gsub("basic_trees:birch_trunk", "lib_ecology:birch_01_trunk")
			schem_lua = schem_lua:gsub("basic_trees:cedar_leaves", "default:leaves")
			schem_lua = schem_lua:gsub("basic_trees:cedar_trunk", "default:tree")
			schem_lua = schem_lua:gsub("basic_trees:cypress_leaves", "default:leaves")
			schem_lua = schem_lua:gsub("basic_trees:cypress_trunk", "default:tree")
			schem_lua = schem_lua:gsub("basic_trees:eucalyptus_leaves", "lib_ecology:savanna_leaves")
			schem_lua = schem_lua:gsub("basic_trees:eucalyptus_trunk", "lib_ecology:savanna_trunk")
			schem_lua = schem_lua:gsub("basic_trees:maple_leaves", "lib_ecology:maple_leaves")
			schem_lua = schem_lua:gsub("basic_trees:maple_trunk", "lib_ecology:maple_trunk")
			schem_lua = schem_lua:gsub("basic_trees:oak_leaves", "lib_ecology:oak_leaves")
			schem_lua = schem_lua:gsub("basic_trees:oak_trunk", "lib_ecology:oak_trunk")
			schem_lua = schem_lua:gsub("basic_trees:sequoia_leaves", "lib_ecology:sequoia_leaves")
			schem_lua = schem_lua:gsub("basic_trees:sequoia_trunk", "lib_ecology:sequoia_trunk")
			schem_lua = schem_lua:gsub("basic_trees:willow_leaves", "lib_ecology:willow_twig")
			schem_lua = schem_lua:gsub("basic_trees:willow_trunk", "lib_ecology:willow_02_trunk")

			schem_lua = schem_lua:gsub("doomshrooms:cap", "lib_ecology:mushroom_big_brown")
			schem_lua = schem_lua:gsub("doomshrooms:stalk", "lib_ecology:mushroom_big_stem")
			
			schem_lua = schem_lua:gsub("ethereal:acacia_leaves", "default:acacia_leaves")
			schem_lua = schem_lua:gsub("ethereal:acacia_trunk", "default:acacia_tree")
			schem_lua = schem_lua:gsub("ethereal:coconut", "lib_ecology:coconut")
			schem_lua = schem_lua:gsub("ethereal:palmleaves", "lib_ecology:palm_01_leaves")
			schem_lua = schem_lua:gsub("ethereal:palm_trunk", "lib_ecology:palm_01_trunk")
			schem_lua = schem_lua:gsub("ethereal:pineleaves", "default:pine_needles")

			schem_lua = schem_lua:gsub("hyrule_mapgen:magic_leaves", "default:leaves")
			schem_lua = schem_lua:gsub("hyrule_mapgen:magic_tree", "default:tree")
			schem_lua = schem_lua:gsub("hyrule_mapgen:palm_tree", "lib_ecology:palm_01_trunk")
			schem_lua = schem_lua:gsub("hyrule_mapgen:coconut", "lib_ecology:coconut")
			schem_lua = schem_lua:gsub("hyrule_mapgen:palm_leaves", "lib_ecology:palm_01_leaves")
			schem_lua = schem_lua:gsub("hyrule_mapgen:wild_leaves", "default:leaves")
			schem_lua = schem_lua:gsub("hyrule_mapgen:wild_tree", "default:tree")

			schem_lua = schem_lua:gsub("mapgen:bamboo_leaves", "lib_ecology:bamboo_02_leaves")
			schem_lua = schem_lua:gsub("mapgen:bamboo_with_leaves", "lib_ecology:bamboo_with_leaves")
			schem_lua = schem_lua:gsub("mapgen:bamboo", "lib_ecology:bamboo_02_trunk")
			schem_lua = schem_lua:gsub("mapgen:bamboo_small", "lib_ecology:bamboo_small")
			schem_lua = schem_lua:gsub("mapgen:bamboo_small_top", "lib_ecology:bamboo_small_top")
			schem_lua = schem_lua:gsub("mapgen:baobab_leaves", "lib_ecology:baobab_leaves")
			schem_lua = schem_lua:gsub("mapgen:baobab_tree", "lib_ecology:baobab_trunk")
			schem_lua = schem_lua:gsub("mapgen:palm_leaves", "lib_ecology:palm_02_leaves")
			schem_lua = schem_lua:gsub("mapgen:palm_tree", "lib_ecology:palm_02_trunk")
			schem_lua = schem_lua:gsub("mapgen:palm_leaves_coconut", "lib_ecology:coconut")
			schem_lua = schem_lua:gsub("mapgen:vine", "lib_ecology:vine")
			schem_lua = schem_lua:gsub("mapgen:willow_leaves", "lib_ecology:willow_leaves")
			schem_lua = schem_lua:gsub("mapgen:willow_tree", "lib_ecology:willow_02_trunk")
			schem_lua = schem_lua:gsub("mapgen:yellow_ipe_leaves", "lib_ecology:yellow_ipe_leaves")
			schem_lua = schem_lua:gsub("mapgen:yellow_ipe_tree", "lib_ecology:yellow_ipe_trunk")
			
			schem_lua = schem_lua:gsub("maple:maple_leaves", "lib_ecology:maple_leaves")
			schem_lua = schem_lua:gsub("maple:maple_tree", "lib_ecology:maple_trunk")

			schem_lua = schem_lua:gsub("moreplants:junglevine", "lib_ecology:vine")
			schem_lua = schem_lua:gsub("moreplants:palm", "lib_ecology:palm_01_trunk")
			schem_lua = schem_lua:gsub("moreplants:palmleaves1", "lib_ecology:palm_01_leaves")
			schem_lua = schem_lua:gsub("moreplants:palmleaves2", "lib_ecology:palm_01_leaves")

			
			
			-- -- format schematic string
			local schematic = loadstring(schem_lua)()
			--current_schematic = loadstring(schem_lua)()

			local width = schematic["size"]["x"]
			local depth = schematic["size"]["z"]
			local height = schematic["size"]["y"]

			local p = pointed_thing.above
			p.x = p.x - width/2
			p.z = p.z - depth/2
			
			-- -- local count = worldedit.deserialize(pointed_thing.above, value)
			-- --{["air"] = "ignore", }
			-- lib_tree.path..'/schems/'..current_schem_name, 
			minetest.place_schematic(p, schematic, "0", nil)
		end
		return itemstack
    end,
  })



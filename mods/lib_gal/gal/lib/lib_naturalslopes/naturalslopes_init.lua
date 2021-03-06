-- Global namespace for functions
--naturalslopeslib = {}

local poschangelib_available = false
local twmlib_available = false
--for _, name in ipairs(minetest.get_modnames()) do
	--if name == "poschangelib" then
		poschangelib_available = true
	--elseif name == "twmlib" then
	--	twmlib_available = true
	--end
--end

--- Get the name of the regular node from a slope, or nil.
function gal.lib.naturalslopes.get_regular_node_name(node_name)
	if string.find(node_name, ":slope_") == nil then
		return nil
	end
	for _, regex in ipairs({"^(.-:)slope_inner_(.*)$", "^(.-:)slope_outer_(.*)$", "^(.-:)slope_pike_(.*)$", "^(.-:)slope_(.*)$"}) do
		local match, match2 = string.match(node_name, regex)
		if match and minetest.registered_nodes[match .. match2] ~= nil then
			return match .. match2
		end
	end
	return nil
end
--- Get node name for slopes from a subname.
-- For example 'dirt' will be named 'naturalslopeslib:slope_dirt'
function gal.lib.naturalslopes.get_straight_slope_name(subname)
	--return minetest.get_current_modname() .. ':slope_' .. subname
	return 'gal:slope_' .. subname
end
function gal.lib.naturalslopes.get_inner_corner_slope_name(subname)
	--return minetest.get_current_modname() .. ':slope_inner_' .. subname
	return 'gal:slope_inner_' .. subname
end
function gal.lib.naturalslopes.get_outer_corner_slope_name(subname)
	--return minetest.get_current_modname() .. ':slope_outer_' .. subname
	return 'gal:slope_outer_' .. subname
end
function gal.lib.naturalslopes.get_pike_slope_name(subname)
	--return minetest.get_current_modname() .. ':slope_pike_' .. subname
	return 'gal:slope_pike_' .. subname
end

-- Set functions to get configuration and default values
function gal.lib.naturalslopes.setting_enable_surface_update()
	if not twmlib_available then return false end
	local value = minetest.settings:get_bool('naturalslopeslib_enable_surface_update')
	if value == nil then return true end
	return value
end
function gal.lib.naturalslopes.setting_enable_shape_on_walk()
	if not poschangelib_available then return false end
	local value = minetest.settings:get_bool('naturalslopeslib_enable_shape_on_walk')
	if value == nil then return true end
	return value
end
function gal.lib.naturalslopes.setting_enable_shape_on_generation()
	local value = minetest.settings:get_bool('naturalslopeslib_register_default_slopes')
	if value == nil then value = true end
	return value
end
function gal.lib.naturalslopes.setting_generation_method()
	local value = minetest.settings:get('naturalslopeslib_generation_method')
	if value == nil then value = 'VoxelManip' end
	return value
end
function gal.lib.naturalslopes.setting_generation_factor()
	return tonumber(minetest.settings:get('naturalslopeslib_update_shape_generate_factor')) or 0.05
end
function gal.lib.naturalslopes.setting_generation_skip()
	return tonumber(minetest.settings:get('naturalslopeslib_update_shape_generate_skip')) or 0
end
function gal.lib.naturalslopes.setting_enable_shape_on_dig_place()
	local value = minetest.settings:get_bool('naturalslopeslib_enable_shape_on_dig_place')
	if value == nil then value = true end
	return value
end
function gal.lib.naturalslopes.setting_smooth_rendering()
	local value = minetest.settings:get_bool('naturalslopeslib_smooth_rendering')
	if value == nil then value = true end
	return value
end

--dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/update_shape.lua")
---- Include registration methods
--dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/register_slopes.lua")
--dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/sloped_stomp.lua")


dofile(gal.lib.naturalslopes.path .. "/update_shape.lua")
-- Include registration methods
dofile(gal.lib.naturalslopes.path .. "/register_slopes.lua")
dofile(gal.lib.naturalslopes.path .. "/sloped_stomp.lua")






local min_group_items = 8 --Todo: setting

------------------------------------------------------------------------
-- Item groups collection
------------------------------------------------------------------------
local itemgroups = {}
local itemgroups_unordered = {}

local function get_or_new_itemgroup(group)
	if itemgroups[group] then
		return itemgroups[group]
	end
	local title = group:gsub("_", " "):gsub("(%a)([%w_']*)", function(first, rest) return first:upper()..rest:lower() end)
	local itemgroup = { name = group, title = title, items = {}, items_unordered = {}}
	itemgroups[group] = itemgroup
	table.insert(itemgroups_unordered, itemgroup)
	return itemgroup
end

------------------------------------------------------------------------
-- Get group assignment for item
------------------------------------------------------------------------
local function get_group_assingment(def)
	-- Order all stairs and slabs to the stairs group
	if def.groups.stair or def.groups.slab then
		return "stairs"
	end

	-- Group by mod origin by default
	return def.mod_origin
end

------------------------------------------------------------------------
-- Process items after all mods loaded
------------------------------------------------------------------------
minetest.after(0,function()
	--------------------------------------------------------------------
	-- Compat to creative mod - replace hardcoded grouped pages
	--------------------------------------------------------------------
	local unregister = {
			["creative:nodes"] = true,
			["creative:tools"] = true,
			["creative:craftitems"] = true,
	}

	local pages_to_end = { }
	local move_to_end = true
	for idx = #gal.sfinv.pages_unordered, 1, -1 do
		local page = gal.sfinv.pages_unordered[idx]
		if unregister[page.name] then
			move_to_end = false
			gal.sfinv.pages[page.name] = nil
			table.remove(gal.sfinv.pages_unordered, idx)
		elseif move_to_end then
			table.insert(pages_to_end, 1, page)
			gal.sfinv.pages[page.name] = nil
			table.remove(gal.sfinv.pages_unordered, idx)
		end
	end

	--------------------------------------------------------------------
	-- Sort items to groups
	--------------------------------------------------------------------
	for itemname, def in pairs(minetest.registered_items) do
		if def.groups.not_in_creative_inventory ~= 1 and
				def.description and def.description ~= "" then

			local group = get_group_assingment(def)
			local itemgroup = get_or_new_itemgroup(group)
			itemgroup.items[itemname] = def
			table.insert(itemgroup.items_unordered, def)
		end
	end

	--------------------------------------------------------------------
	-- register groups
	--------------------------------------------------------------------
	table.sort(itemgroups_unordered, function(a,b) return a.name < b.name end)
	local misc_group = get_or_new_itemgroup("other")

	for _, itemgroup in ipairs(itemgroups_unordered) do
		local items_count = #itemgroup.items_unordered
		if items_count >= min_group_items or 
				(items_count > 0 and itemgroup.name == "other") then
			gal.sfinv.creative.register_tab("smart_sfinv_creative:"..itemgroup.name, itemgroup.title, itemgroup.items)
		else
			-- apply to "misc" group
			for itemname, def in pairs(itemgroup.items) do
				misc_group.items[itemname] = def
				table.insert(misc_group.items_unordered, def)
			end
		end
	end

	--------------------------------------------------------------------
	-- restore pages after the replaced groups
	--------------------------------------------------------------------
	for _, page in ipairs(pages_to_end) do
		gal.sfinv.register_page(page.name, page)
	end
end)

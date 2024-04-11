-- Full Descriptions v1.0.1
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")



-- ========== Main ==========

gm.pre_script_hook(gm.constants.run_create, function()
    local lang_map = gm.variable_global_get("_language_map")
    local classes = {"class_item", "class_equipment"}
    
    for _, c in ipairs(classes) do
        local class = gm.variable_global_get(c)
        for i = 1, #class do
            local item = class[i]
            local localization = string.sub(item[3], 1, #item[3] - 5)
            gm.ds_map_set(lang_map, localization..".pickup", gm.ds_map_find_value(lang_map, localization..".description"))
        end
    end
end)

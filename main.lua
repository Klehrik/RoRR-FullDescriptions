-- Full Descriptions v1.0.2
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")

local line_length = 80



-- ========== Main ==========

gm.pre_script_hook(gm.constants.run_create, function()
    local lang_map = gm.variable_global_get("_language_map")
    local classes = {"class_item", "class_equipment"}
    
    for _, c in ipairs(classes) do
        local class = gm.variable_global_get(c)
        for i = 1, #class do
            local item = class[i]
            local localization = string.sub(item[3], 1, #item[3] - 5)   -- "item.<identifier>"
            local desc = gm.ds_map_find_value(lang_map, localization..".description")

            if desc then
                -- Insert breakpoints every line_length chars after a space
                local formatted = ""
                local current = 1
                for i = line_length, #desc, line_length do
                    for j = i, #desc do
                        if string.sub(desc, j, j) == " " then
                            formatted = formatted..string.sub(desc, current, j).."\n"
                            current = j + 1
                            break
                        end
                    end
                end
                formatted = formatted..string.sub(desc, current, #desc)

                gm.ds_map_set(lang_map, localization..".pickup", formatted)
            end
        end
    end
end)
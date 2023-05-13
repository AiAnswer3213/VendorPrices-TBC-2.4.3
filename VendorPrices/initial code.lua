local vendorPrices = { 
    [769] = 3, -- Item ID 769 costs 3 copper
}

local function AddVendorPrice(frame, itemID)
    -- print("AddVendorPrice called! Item ID: " .. itemID)
    local vendorPrice = vendorPrices[itemID]
    if vendorPrice then
        -- print("Vendor price found! Price: " .. vendorPrice)
        frame:AddLine("Vendor Price: " .. vendorPrice)
        frame:Show()
    end
end

local function OnTooltipSetItem(frame, ...)
    -- print("OnTooltipSetItem called!")
    local _, itemLink = frame:GetItem()
    if itemLink then
        -- print("Got itemLink: " .. itemLink)

        local itemID = string.match(itemLink, "item:(%d+)")
        -- print("Extracted itemID: " .. tostring(itemID))

        if itemID then
            local numItemID = tonumber(itemID)
            -- print("Parsed itemID to number: " .. tostring(numItemID))
            AddVendorPrice(frame, numItemID)
        end
    end
end


GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
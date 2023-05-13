local vendorPrices = { 
    [769] = 3, -- Item ID 769 costs 3 copper
}

local function AddVendorPrice(frame, itemID)
    local vendorPrice = vendorPrices[itemID]
    if vendorPrice then
        SetTooltipMoney(frame, vendorPrice)
        frame:Show()
    end
end

local tooltip = CreateFrame("Frame", nil, GameTooltip)
tooltip:SetScript("OnHide", function()
    GameTooltip.itemLink = nil
end)
tooltip:SetScript("OnShow", function()
    local _, itemLink = GameTooltip:GetItem()
    if itemLink then
        local itemID = string.match(itemLink, "item:(%d+)")
        if itemID then
            local numItemID = tonumber(itemID)
            AddVendorPrice(GameTooltip, numItemID)
        end
    end
end)

GameTooltip:HookScript("OnTooltipSetItem", function(...)
    tooltip:Show()
end)

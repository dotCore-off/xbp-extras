local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Premium customer")
CHALLENGE:SetIcon("battlepass/challenges/cart.png")
CHALLENGE:SetProgressDesc("Spend :goal more premium points in Pointshop")
CHALLENGE:SetFinishedDesc("Spent :goal premium points in Pointshop")
CHALLENGE:SetID("ps_buy_prem")
CHALLENGE:AddHook("SH_POINTSHOP:OnItemBought", function(self, ply, item, itm)  
    // Item price
    local itemCost = item.PremiumPointsCost

    // If item's cost is above 0
    if (IsValid(ply) and itemCost > 0) then
        self:AddProgress(itemCost)
        self:NetworkProgress()
    end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
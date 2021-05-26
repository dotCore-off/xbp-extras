local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Shopping Fever !")
CHALLENGE:SetIcon("battlepass/challenges/cart.png")
CHALLENGE:SetProgressDesc("Spend :goal more points in Pointshop")
CHALLENGE:SetFinishedDesc("Spent :goal points in Pointshop")
CHALLENGE:SetID("ps_buy")
CHALLENGE:AddHook("SH_POINTSHOP.OnItemBought", function(self, ply, item, itm)  
    // Item price
    local itemCost = itm.PointsCost

    // If item category is a skin one
    if (IsValid(ply) and itemCost > 0) then
        self:AddProgress(itemCost)
        self:NetworkProgress()
    end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
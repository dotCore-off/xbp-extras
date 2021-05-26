local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()
CHALLENGE:SetName("Cosmetics before all !")
CHALLENGE:SetIcon("battlepass/challenges/cart.png")
CHALLENGE:SetProgressDesc("Buy :goal more skins in Pointshop")
CHALLENGE:SetFinishedDesc("Bought :goal skins in Pointshop")
CHALLENGE:SetID("ps_skins")
CHALLENGE:AddHook("SH_POINTSHOP.OnItemBought", function(self, ply, item, itm)  
    // Item category
    local itemCat = itm.Category

    // If item category is a skin one
    if (IsValid(ply) and itemCat == "vic_models" or itemCat == "sponsor_models") then
        self:AddProgress(1)
        self:NetworkProgress()
    end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
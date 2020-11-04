-- Do not delete
local REWARD = BATTLEPASS:CreateReward()

-- Unlock if tier is reached
function REWARD:CanUnlock(ply, reward)
	return true
end

-- Message that is shown to user when reward is hovered
function REWARD:GetTooltip(reward)
	return "Unlock this permanently !"
end

-- Get and show model function on reward
function REWARD:GetModel(reward)
	local wep = ps2_items.Get(reward)
	if (!wep) then return ".mdl" end

	return ps2_items.Model or ".mdl"
end

-- Get and show item name on reward
function REWARD:GetName(reward) 
	local wep = ps2_items.Get(reward)
	return wep and wep.PrintName or "Unknown skin"
end

-- Function that is run on unlock
function REWARD:Unlock(ply, reward, amount)
	if (CLIENT) then return end
    -- Item var
    local itemClass = Pointshop2.GetItemClassByPrintName(reward)
    -- Command to give a PS2 item
	return ply:PS2_EasyAddItem(itemClass.className)
end

-- Reward registration
REWARD:Register("ps2_items")
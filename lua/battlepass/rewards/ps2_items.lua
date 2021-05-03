// Do not touch
local REWARD = BATTLEPASS:CreateReward()

// Verification function
function REWARD:CanUnlock(ply, reward)
	// Unlock the item
	// You may actually put a CustomCheck here if you want
	return true
end

// Tooltip function
function REWARD:GetTooltip(reward)
	// Get the reward
	local wep = ps2_items.Get(reward)

	// Return configured Description or a static text
	return ps2_items.Description or "Unlock this !"
end

// Model function
function REWARD:GetModel(reward)
	// Get the reward
	local wep = ps2_items.Get(reward)
	if (!wep) then return ".mdl" end
	
	// Return configured Model
	return ps2_items.Model or ".mdl"
end

// Name function
function REWARD:GetName(reward) 
	// Get the reward
	local wep = ps2_items.Get(reward)

	// Return configured Print Name or a static text
	return wep and wep.PrintName or "Unknown skin"
end

// On unlock, do ...
function REWARD:Unlock(ply, reward, amount)
	// SERVER only
	if (CLIENT) then return end

    // Item variable
	// Read Pointshop 2 documentation for more informations
    local itemClass = Pointshop2.GetItemClassByPrintName(reward)

    // Add the above item to player's inventory
	return ply:PS2_EasyAddItem(itemClass.className)
end

// Reward registration
REWARD:Register("ps2_items")
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
	local wep = sh_ps_items.Get(reward)

	// Return configured Description or a static text
	return sh_ps_items.Description or "Unlock this !"
end

// Model function
function REWARD:GetModel(reward)
	// Get the reward
	local wep = sh_ps_items.Get(reward)
	if (!wep) then return ".mdl" end
	
	// Return configured Model
	return sh_ps_items.Model or ".mdl"
end

// Name function
function REWARD:GetName(reward) 
	// Get the reward
	local wep = sh_ps_items.Get(reward)

	// Return configured Print Name or a static text
	return wep and wep.PrintName or "Unknown skin"
end

// On unlock, do ...
function REWARD:Unlock(ply, reward, amount)
	// SERVER only
	if (CLIENT) then return end

    // Item variable
	local itm = self:NewItemTable(reward)

	// Add the item to player's inventory
	return ply:SH_AddItem(itm, true, true)
end

// Reward registration
REWARD:Register("sh_ps_items")
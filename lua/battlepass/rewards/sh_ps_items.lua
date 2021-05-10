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
	// Return a static string
	// You can use a custom thingy here
	return "Unlock this permanently !"
end

// Icon function
function REWARD:GetModel(reward)
	// Get the reward
	local wep = ps2_items.Get(reward)
	// Small verif
	if (!wep) then return ".mdl" end

	// Return the reward's model to display
	return ps2_items.Model or ".mdl"
end

// Name function
function REWARD:GetName(reward) 
	// Get the reward
	local wep = ps2_items.Get(reward)

	// Return the reward's name or a static string
	return wep and wep.PrintName or "Unknown item"
end

// On unlock, do ...
function REWARD:Unlock(ply, reward, amount)
	// SERVER only
	if (CLIENT) then return end

	// Get the item stored in reward
	local itm = SH_POINTSHOP:NewItemTable(reward)

	// Add it to player's inventory
	return ply:SH_AddItem(itm)
end

// Reward registration
REWARD:Register("sh_ps_items")
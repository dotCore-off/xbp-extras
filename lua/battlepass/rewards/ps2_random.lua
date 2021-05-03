// Do not touch
local REWARD = BATTLEPASS:CreateReward()
// Displayed icon in tier
REWARD.Mat = "battlepass/mystery.png"

// Verification function
function REWARD:CanUnlock(ply, reward)
	// Unlock the item
	// You may actually put a CustomCheck here if you want
	return true
end

// Tooltip function
function REWARD:GetTooltip(reward)
	// Get the reward
	local wep = ps2_random.Get(reward)

	// Return configured Description or a static text
	return ps2_random.Description or "Earn a mystery item !"
end

// Icon function
function REWARD:GetModel(reward)	
	// Return above defined icon
	return self.Mat
end

// Name function
function REWARD:GetName(reward) 
	// Get the reward
	local wep = ps2_random.Get(reward)

	// Return configured Print Name or a static text
	return wep and wep.PrintName or "Mystery item"
end

// On unlock, do ...
function REWARD:Unlock(ply, reward, amount)
	// SERVER only
	if (CLIENT) then return end

	// Fetch all items
	// View Pointshop 2 documentation for more informations on targeting
	local items = Pointshop2.GetRegisteredItems()

	// Randomizer
    local itemClass = table.Random(items)

	// Add the randomly selected item to player's inventory
    return ply:PS2_EasyAddItem(itemClass.className)
end

// Reward registration
REWARD:Register("ps2_random")
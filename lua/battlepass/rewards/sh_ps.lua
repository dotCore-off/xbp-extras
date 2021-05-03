// Do not touch
local REWARD = BATTLEPASS:CreateReward()
// Displayed icon in tier
REWARD.Mat = "battlepass/wallet_large.png"

// Verification function
function REWARD:CanUnlock(ply, reward)
	// Unlock the item
	// You may actually put a CustomCheck here if you want
	return true
end

// Tooltip function
function REWARD:GetTooltip(reward)
	// Return amount of points + formatting
	return string.Comma(reward) .. " point" .. (reward != 1 and "s" or "")
end

// Icon function
function REWARD:GetModel(reward)	
	// Return above defined icon
	return self.Mat
end

// Name function
function REWARD:GetName(reward) 
    // Display the amount of points fetched from REWARD:GetTooltip()
	return self:GetTooltip(reward)
end

// On unlock, do ...
function REWARD:Unlock(ply, reward, amount)
	// SERVER only
	if (CLIENT) then return end

    // Give the configured amount of points to player
    return ply:SH_AddStandardPoints(reward)
end

// Reward registration
REWARD:Register("ps2_random")
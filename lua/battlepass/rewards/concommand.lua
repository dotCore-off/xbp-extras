// Do not touch
local REWARD = BATTLEPASS:CreateReward()
// Displayed icon in tier
REWARD.Mat = "battlepass/command.png"

// Verification function
function REWARD:CanUnlock(ply, reward)
	// Unlock the item
	// You may actually put a CustomCheck here if you want
	return true
end

// Tooltip function
function REWARD:GetTooltip(reward)
    local wep = concommand.Get(reward)

	// Return commands description
	return concommand.Description or "Runs a command !"
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

    // Variables
    local wep = concommand.Get(reward)
    local command = concommand.Command

    // Verification
    if (!wep) then return end
    if (!command) then return end

    // Placeholders
    local sid = ply:SteamID()
    local sid64 = ply:SteamID64()

    // Replace all occurences
    // We start with sid64 cuz sid would both works with sid64 & sid occurences
    string.Replace(command, "sid64", sid64)
    string.Replace(command, "sid", sid)
    
    // Store the function RCC in a var
    local eCommand = RunConsoleCommand(command)

    // Execute the command in servers console on claim
    return eCommand
end

// Reward registration
REWARD:Register("concommand")
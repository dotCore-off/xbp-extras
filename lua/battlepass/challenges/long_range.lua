// Do not touch
local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

// Change these to whatever you want
CHALLENGE:SetName("Long Range Kills")
CHALLENGE:SetIcon("battlepass/challenges/kill.png")
CHALLENGE:SetProgressDesc("Kill :goal more players on a short distance")
CHALLENGE:SetFinishedDesc("Killed :goal players on a short distance")
CHALLENGE:SetID("close_range")

// Exactly the same as close_range.lua, we hook on a Player's death
CHALLENGE:AddHook("PlayerDeath", function(self, ply, victim, inflictor, attacker)
    // Avoid progress through suicides
    // Handle life's crualty ma dude
    if (victim == attacker) then return end

    // Pretty long range
    // This is the var you should edit in case you want to modifiy range
    // Note that only kills that are above this distance will count
    local longDistance = 2000

    // Ew oh, what a big If
    // We first make sure the Player is the Attacker
    // Then, we look if the Victim is another Player
    // Finally, distance check
    if (ply == attacker and victim:IsPlayer() and attacker:GetPos():Distance(victim:GetPos()) > longDistance) then
        self:AddProgress(1)
        self:NetworkProgress()
    end
end)

// Register challenge
BATTLEPASS:RegisterChallenge(CHALLENGE)
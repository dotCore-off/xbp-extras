local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

-- Change these to whatever you want
CHALLENGE:SetName("Survive in-game")
CHALLENGE:SetIcon("battlepass/challenges/icon.png")
CHALLENGE:SetProgressDesc("Survive :goal more minutes")
CHALLENGE:SetFinishedDesc("Survived :goal minutes")
CHALLENGE:SetID("alive")

-- This hook is currently minutes based
-- I've added team check cuz it didn't work without it, not sure why
-- This may come from my gamemode so try without it if you want
CHALLENGE:AddTimer( 1*60, function( self, ply )
    if (ply:Alive()) and (ply:Team() == TEAM_XXXXX)) then
        self:AddProgress(1)
        self:NetworkProgress()
    end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
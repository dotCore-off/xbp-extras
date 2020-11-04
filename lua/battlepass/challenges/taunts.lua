local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

-- Change these to whatever you want
CHALLENGE:SetName("Play a taunt")
CHALLENGE:SetIcon("battlepass/challenges/icon.png")
CHALLENGE:SetProgressDesc("Play :goal more taunts")
CHALLENGE:SetFinishedDesc("Played :goal taunts")
CHALLENGE:SetID("taunt")

-- This is a homemade hook
-- Please, if your gamemode have a hook regarding tautns, edit this
-- Else, create a hook with the same name that the one above that is run when a taunt is done by a player
-- P.S : if there's a Spectator's team, I recommend you to check for it so they can't exploit lmao
CHALLENGE:AddHook("GetTauntDone", function(self, ply)
  if (IsValid(ply) and ply:Alive() and ply:Team() != TEAM_SPECTATORS) then
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
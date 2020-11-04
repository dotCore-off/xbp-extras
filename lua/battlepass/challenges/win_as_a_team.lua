local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

-- Change these to whatever you want
CHALLENGE:SetName("Win as a XXXXX")
CHALLENGE:SetIcon("battlepass/challenges/icon.png")
CHALLENGE:SetProgressDesc("Win :goal more rounds as a XXXXX")
CHALLENGE:SetFinishedDesc("Won :goal times as a XXXXX")
CHALLENGE:SetID("win_as_a_team")

-- You may change this hook depending of your gamemode
-- You have to take the hook where round is ended
CHALLENGE:AddHook("OnRoundEnd", function(self, ply)
  if (ply:Team() == TEAM_XXXXX) and (ply:Alive()) then
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

-- Change these to whatever you want
CHALLENGE:SetName("Be the XXXXX")
CHALLENGE:SetIcon("battlepass/challenges/icon.png")
CHALLENGE:SetProgressDesc("Be a XXXXX :goal more rounds")
CHALLENGE:SetFinishedDesc("Was a XXXXX :goal times")
CHALLENGE:SetID("be_a_team")

-- You may change this hook depending of your gamemode
-- You have to take the hook where round is started and teams are assigned
CHALLENGE:AddHook("OnRoundStart", function(self, ply)
  if (ply:Team() == TEAM_XXXXX) then
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
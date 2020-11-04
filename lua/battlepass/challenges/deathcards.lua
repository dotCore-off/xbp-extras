local CHALLENGE = BATTLEPASS:CreateTemplateChallenge()

-- Change these to whatever you want
CHALLENGE:SetName("Deathcards")
CHALLENGE:SetIcon("battlepass/challenges/icon.png")
CHALLENGE:SetProgressDesc("Purchase :goal more deathcards")
CHALLENGE:SetFinishedDesc("Purchased :goal deathcards")
CHALLENGE:SetID("deathscreen")

-- Tried to find the right hook
-- It seems to doesn't work currently
-- Pretty sure I'm near the solution, but I hate you sleepyy, Deathcards code is shitty as fuck :(
CHALLENGE:AddHook("purchasedCard", function(self, ply)
  for i, ply in ipairs(cards) do
    self:AddProgress(1)
    self:NetworkProgress()
  end
end)
BATTLEPASS:RegisterChallenge(CHALLENGE)
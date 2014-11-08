local function languagefix (event, player)
	player:RemoveSpell(668, player)
	player:LearnSpell(668, player)
end

RegisterPlayerEvent(3, languagefix)
RegisterPlayerEvent(27, languagefix)
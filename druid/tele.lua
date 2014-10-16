local function tele (event, player, spell)
	if (spell:GetEntry()==19027) then
		spell:Cancel()
	end
	
end
RegisterPlayerEvent(5, tele)
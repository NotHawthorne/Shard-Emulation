local function silence (event, player, spell)
	if (spell:GetEntry()==818057) then
		player:CastSpell(818058, player)
	end
	
end
RegisterPlayerEvent(5, silence)
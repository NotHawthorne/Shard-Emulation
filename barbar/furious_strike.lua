local function furious_strike (event, player, spell)
	if (spell:GetEntry()==818020) then
		player:AddAura(818021, player)
	end
	
end
RegisterPlayerEvent(5, furious_strike)
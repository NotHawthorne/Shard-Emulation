local function necroguardian (event, player, spell)
	if (spell:GetEntry()==759) then
		local pet = player:SpawnCreature(1513, player:GetX(), player:GetY(), player:GetZ(), player:GetO())
		local playerguid = player:GetGUIDLow()
		if(pet) then
			local petguid = pet:GetGUIDLow()
			pet:SetOwnerGUID(41)
			player:SetMinionGUID(petguid)
		end
	end
end
RegisterPlayerEvent(5, necroguardian)
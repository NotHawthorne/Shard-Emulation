local function invoke (event, player, spell)
	if (spell:GetEntry()==818022) then
		if (player:GetItemCount(17010)<=0) then
			spell:Cancel()
			player:SendBroadcastMessage("You don't have any Exort Essences!")
		else
			player:RemoveItem(17010, 1)
		end
	end
	if (spell:GetEntry()==818023) then
		if (player:GetItemCount(7081)<=0) then
			spell:Cancel()
			player:SendBroadcastMessage("You don't have any Quas Essences!")
		else
			player:RemoveItem(7081, 1)
		end
	end
	if (spell:GetEntry()==818024) then
		if (player:GetItemCount(22577)<=0) then
			spell:Cancel()
			player:SendBroadcastMessage("You don't have any Wex Essences!")
		else
			player:RemoveItem(22577, 1)
		end
	end	if (spell:GetEntry()==818056) then
		if (player:GetItemCount(12808)<=0) then
			spell:Cancel()
			player:SendBroadcastMessage("You don't have any Essences of Undeath!")
		else
			player:RemoveItem(12808, 1)
		end
	end
	if (spell:GetEntry()==818025) then
		local wex = player:GetAura(818024)
		local quas = player:GetAura(818023)
		local exort = player:GetAura(818022)
		local undeath = player:GetAura(818056)
		if ((exort==nil) and (quas==nil) and (wex==nil)) then 
			player:SendBroadcastMessage("Please apply Essence auras before using this spell!")
			spell:Cancel()
		end
		if (((exort~=nil) and (exort:GetStackAmount()==1)) and (quas==nil) and (wex==nil) and (undeath==nil)) then
			player:AddItem(1181, 1) --FIREBALL RANK 5
			player:RemoveAura(818022)
		end
		if ((exort==nil) and ((quas~=nil) and (quas:GetStackAmount()==1)) and (wex==nil) and (undeath==nil)) then
			player:AddItem(1712, 1) --FROSTBOLT RANK 5
			player:RemoveAura(818023)
		end
		if ((exort==nil) and ((quas~=nil) and (quas:GetStackAmount()==1)) and ((wex~=nil) and (wex:GetStackAmount()==1)) and (undeath==nil)) then
			player:AddItem(4424, 1) --SLOW FALL
			player:RemoveAura(818023)
			player:RemoveAura(818024)
		end
		if (((exort~=nil) and (exort:GetStackAmount()==1)) and ((quas~=nil) and (quas:GetStackAmount()==1)) and ((wex~=nil) and (wex:GetStackAmount()==1)) and (undeath==nil)) then
			player:AddItem(10306, 1) --MAGE ARMOR RANK 6
			player:RemoveAura(818023)
			player:RemoveAura(818024)
			player:RemoveAura(818022)
		end
		if (((exort~=nil) and (exort:GetStackAmount()==1)) and ((quas~=nil) and (quas:GetStackAmount()==1)) and ((wex~=nil) and (wex:GetStackAmount()==3)) and (undeath==nil)) then
			player:AddItem(27501, 1) --SUMMON IMP
			player:RemoveAura(818023)
			player:RemoveAura(818024)
			player:RemoveAura(818024)
			player:RemoveAura(818024)
			player:RemoveAura(818022)
		end
		if ((exort==nil) and ((quas~=nil) and (quas:GetStackAmount()==3)) and (wex==nil) and (undeath==nil)) then
			player:AddItem(33460, 1) --SUMMON WATER ELEMENTAL
			player:RemoveAura(818023)
			player:RemoveAura(818023)
			player:RemoveAura(818023)
		end		
		if (((exort~=nil) and (exort:GetStackAmount()==1)) and (quas==nil) and (wex==nil) and ((undeath~=nil) and(undeath:GetStackAmount()==1))) then
			player:AddItem(11808, 1) --CREATE INVOKER CROWN
			player:RemoveAura(818022)
			player:RemoveAura(818056)
		end
		if (((exort~=nil) and (exort:GetStackAmount()==1)) and ((quas~=nil) and (quas:GetStackAmount()==1)) and ((wex~=nil) and (wex:GetStackAmount()==1)) and ((undeath~=nil) and(undeath:GetStackAmount()==1))) then
			player:AddItem(28252, 1) --CREATE INVOKER ROBES
			player:RemoveAura(818022)
			player:RemoveAura(818023)
			player:RemoveAura(818024)
			player:RemoveAura(818056)
		end
	else
	end
end
RegisterPlayerEvent(5, invoke)
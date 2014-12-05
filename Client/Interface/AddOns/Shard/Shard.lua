Shard_ClassData	= {}
Shard_SpellData = {}
Shard_CharData	= {}

function Shard_RecieveData(SentData, Identifier)
	if (SentData~=nil) and (type(SentData)=="table") then
		if (Identifier==1) then
			Shard_ClassData = SentData
		elseif (Identifier==2) then
			Shard_SpellData = SentData
		elseif (Identifier==3) then
			Shard_CharData = SentData
		end
	end
end

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
	if (GameTooltip:GetSpell()~=nil) then
		local spellName, spellRank, spellID = GameTooltip:GetSpell()
    	for k, v in pairs(Shard_SpellData) do
    		if (spellID==v[1]) then
    			if (type==1) then
					GameTooltip:SetText(desc)
				end
			end
    	end
    end
    self:Show()
end)
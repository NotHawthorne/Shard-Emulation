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
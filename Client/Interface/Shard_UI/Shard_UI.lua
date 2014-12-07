print("UI Loaded.")

function Shard_CharFrame_Enable()
	Shard_CharModel:SetUnit("player")
	Shard_CharFrame:Show()
	Shard_CharFrame_Title:SetText(UnitName("player").."'s Character Sheet")
end
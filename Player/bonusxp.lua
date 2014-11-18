bonus_xp_system = {}
bonus_xp_system.creature_exceptions = {} -- By Id
function bonus_xp_system.check(group, killed_level)
	for k, v in ipairs(group) do
		sub_level = v:GetLevel() - killed_level
		if(sub_level) > 4) then
			bonus_xp_system.give(v, v:GetLevel() * 24)
		end
	end
end
function bonus_xp_system.give(player, xp_to_give)
	player:GiveXP(xp_to_give)
	player:SendBroadCastMessage("You gain ".. bonus_xp .." bonus experience due to kill difficulty and grouping.")
end
function bonus_xp_system.initialize(event, killer, killed)
		local stop = false
		for _k, creature_entry in pairs(bonus_xp_system.creature_exceptions) do
			if (creature_entry == killed:GetEntry()) then
				stop = true
			end
		end
		if ((killer:IsInGroup()) and (stop == false)) then
			bonus_xp_system.check(killer:GetGroup(), killed:GetLevel())
		end
end
RegisterPlayerEvent(7, bonus_xp_system.initialize)

--[[
	Should bonus XP be checked and calculated based on average level of group?
	
	-- If we need a check for pet/totem kill of creature
	if(killer:GetOwner()) then
		killer = killer:GetOwner()
	end
	if (killer:IsPlayer()) then --Check
]]--
local function hederine_oncombat (event, creature, target)
	creature:SendUnitYell("What the hell are you doing here? No matter.", 0)
	creature:RegisterEvent(hederine_2, 12000, 0)
	creature:RegisterEvent(hederine_3, 15000, 0)
end
function hederine_adds(creature)
    local x,y,z = creature:GetRelativePoint(math.random()*9, math.random()*2*math.pi)
    local add = creature:SpawnCreature(6268, x, y, z, 0, 2, 300000)
    if(add) then
        add:AttackStart(creature:GetVictim())
    end
end
function timer(creature)
	SendWorldMessage("[PvE]: |CFF81E3D9Lady Hederine will respawn in one hour!|r")
end
function remove_events(event, creature)
	creature:RemoveEvents()
end
function death(event, creature, killer)
	creature:RemoveEvents()
	SendWorldMessage("[PvE]: |CFF81E3D9"..killer:GetGuildName().."'s group has just slain Lady Hederine! She will respawn in 23 hours, 3 minutes, and 20 seconds!|r")
	creature:RegisterEvent(timer, 79400000, 0)
end
function hederine_cleave(creature)
	creature:CastSpell(creature:GetVictim(), 39144)
end
function hederine_2(eventID, delay, pCall, creature)
    if (creature:GetHealthPct() <= 90) then
        creature:SendUnitYell("Feast on their mana!", 0)
		hederine_adds(creature)
    end
end
function hederine_3(eventID, delay, pCall, creature)
    if (creature:GetHealthPct() <= 45) then
        creature:SendUnitYell("I shall be the death of you!", 0)
		hederine_cleave(creature)
    end
end
function spawn(event, creature)
	SendWorldMessage("[PvE]: |CFF81E3D9Lady Hederine has respawned!|r")
end

RegisterCreatureEvent(10201, 1, hederine_oncombat)
RegisterCreatureEvent(10201, 2, remove_events) -- Leave combat
RegisterCreatureEvent(10201, 4, death) -- Death
RegisterCreatureEvent(10201, 5, spawn) -- Spawn
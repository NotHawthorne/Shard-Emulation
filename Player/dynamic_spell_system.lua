--[[
	Spell Table Syntax
	------------------
	SpellID 		- The EntryID of the spell
	SkillID 		- The ID of the skill you want the spell to scale off of
	Type			- Type of spell
	Data1-5			- Vary based off of Type, described below
	EffectMult		- 
	BaseCooldown	- Base cooldown of the spell in milliseconds
	CooldownMult	- 
	ExEffect1-3 	- ID's of spell effects you'd like to apply to the target.
	ExDuration1-3	- Duration of corresponding ExEffect

	Spell Types
	-----------
	TYPE 1 = DAMAGE
		Data1 - Base Damage Min
		Data2 - Base Damage Max
		Data3 - School
		Data4 - NIL
		Data5 - NIL
	TYPE 2 = DAMAGE OVER TIME
		Data1 - Base Damage Min
		Data2 - Base Damage Max
		Data3 - School
		Data4 - Duration
		Data5 - Ticktime
	TYPE 3 = HEAL
		Data1 - Base Heal Min
		Data2 - Base Heal Max
		Data3 - NIL
		Data4 - NIL
		Data5 - NIL
	TYPE 4 = HEAL OVER TIME
		Data1 - Base Heal Min
		Data2 - Base Heal Max
		Data3 - NIL
		Data4 - Duration
		Data5 - Ticktime
	TYPE 5 = BUFF/APPLY EFFECT
		Data1 - NIL
		Data2 - NIL
		Data3 - NIL
		Data4 - NIL
		Data5 - NIL

	Useful ExEffect SpellID's
	-------------------------
	Stun			- 20310
	Frozen Solid	- 47591
	Sleep			- 31292
	Charm			- 6358
	Blind			- 43433
]]--
spell_table = {}
function CacheSpells()		--Pulls the data from the SQL tables and caches it
	spell_table = {}
	cached_spells = 0
	SpellInfo = CharDBQuery("SELECT * FROM shard_spell_table ORDER BY SpellID")
	repeat
		local SpellID 		= SpellInfo:GetUInt32(0)
		local SkillID 		= SpellInfo:GetUInt32(1)
		local Type			= SpellInfo:GetUInt32(2)
		local Comment		= SpellInfo:GetString(3)
		local Data1			= SpellInfo:GetUInt32(4)
		local Data2			= SpellInfo:GetUInt32(5)
		local Data3			= SpellInfo:GetUInt32(6)
		local Data4			= SpellInfo:GetUInt32(7)
		local Data5			= SpellInfo:GetUInt32(8)
		local EffectMult	= SpellInfo:GetUInt32(9)
		local BaseCooldown	= SpellInfo:GetUInt32(10)
		local CooldownMult	= SpellInfo:GetUInt32(11)
		local ExEffect1		= SpellInfo:GetUInt32(12)
		local ExEffect2		= SpellInfo:GetUInt32(13)
		local ExEffect3		= SpellInfo:GetUInt32(14)
		local ExDuration1	= SpellInfo:GetUInt32(15)
		local ExDuration2	= SpellInfo:GetUInt32(16)
		local ExDuration3	= SpellInfo:GetUInt32(17)
		spell_table[SpellID] = {SpellID, SkillID, Type, Comment, Data1, Data2, Data3, Data4, Data5, EffectMult, BaseCooldown, CooldownMult, ExEffect1, ExEffect2, ExEffect3, ExDuration1, ExDuration2, ExDuration3}
		cached_spells = cached_spells+1
		--SendWorldMessage("[Shard]: Spell "..spell_table[SpellID][1].." loaded successfully.")
	until not SpellInfo:NextRow()
	print("[Shard]: "..cached_spells.." spells cached successfully.")
	SendWorldMessage("[Shard]: "..cached_spells.." spells loaded successfully.")
end
CacheSpells()

function On_SpellCast (event, player, spell)
	local target = spell:GetTarget()
	local spellEntry = spell:GetEntry()
	if (spell_table[spellEntry]~=nil) then

		local SpellID 		= spell_table[spellEntry][1]
		local SkillID 		= spell_table[spellEntry][2]
		local Type			= spell_table[spellEntry][3]
		local Data1			= spell_table[spellEntry][5]
		local Data2			= spell_table[spellEntry][6]
		local Data3			= spell_table[spellEntry][7]
		local Data4			= spell_table[spellEntry][8]
		local Data5			= spell_table[spellEntry][9]
		local EffectMult	= spell_table[spellEntry][10]
		local BaseCooldown	= spell_table[spellEntry][11]
		local CooldownMult	= spell_table[spellEntry][12]
		local ExEffect1		= spell_table[spellEntry][13]
		local ExEffect2		= spell_table[spellEntry][14]
		local ExEffect3		= spell_table[spellEntry][15]
		local ExDuration1	= spell_table[spellEntry][16]
		local ExDuration2	= spell_table[spellEntry][17]
		local ExDuration3	= spell_table[spellEntry][18]

		local cd = (BaseCooldown-(player:GetSkillValue(SkillID)*CooldownMult))*SpellCooldownMult

	--TYPE 1, DAMAGE
		if (Type==1) then
			local mindmg = Data1+(player:GetSkillValue(SkillID)*(EffectMult*0.8))
			local maxdmg = Data2+(player:GetSkillValue(SkillID)*(EffectMult*1.2))
			local dmg = math.random(mindmg, maxdmg)

			SendDamage(player, target, SpellID, dmg, Data3)
			SendCooldown(player, SpellID, cd)

	--TYPE 2, DAMAGE OVER TIME
		elseif (Type==2) then
			local mindmg = Data1+(player:GetSkillValue(SkillID)*(EffectMult*0.8))
			local maxdmg = Data2+(player:GetSkillValue(SkillID)*(EffectMult*1.2))
			local dmg = math.random(mindmg, maxdmg)
			local aura = player:GetAura(SpellID)

			SendAura(player, target, SpellID, Data4)

			if (aura~=nil) then
			else
				local function PeriodicDamage(eventId, delay, repeats, target)
					local auracheck = player:GetAura(SpellID)
					if (auracheck) then
						SendDamage(player, target, SpellID, dmg, Data3)
					else
						RemoveEventById(eventId)
					end
				end
				local registerdmg = player:RegisterEvent(PeriodicDamage, Data5, 0)
			end

			SendCooldown(player, SpellID, cd)

	--TYPE 3, HEAL
		elseif (Type==3) then
			local minamt = Data1+(player:GetSkillValue(SkillID)*(EffectMult*0.8))
			local maxamt = Data2+(player:GetSkillValue(SkillID)*(EffectMult*1.2))
			local amt = math.random(minamt, maxamt)

			SendHeal(player, target, SpellID, amt)
			SendCooldown(player, SpellID, cd)

	--TYPE 4, HEAL OVER TIME
		elseif (Type==4) then
			local minamt = Data1+(player:GetSkillValue(SkillID)*(EffectMult*0.8))
			local maxamt = Data2+(player:GetSkillValue(SkillID)*(EffectMult*1.2))
			local amt = math.random(minamt, maxamt)
			local aura = player:GetAura(SpellID)

			SendAura(player, target, SpellID, Data4)

			if (aura~=nil) then
			else
				local function PeriodicHeal(eventId, delay, repeats, target)
					local auracheck = player:GetAura(SpellID)
					if (auracheck) then
						SendHeal(player, target, SpellID, amt)
					else
						RemoveEventById(eventId)
					end
				end
				local registerheal = player:RegisterEvent(PeriodicHeal, Data5, 0)
			end

			SendCooldown(player, SpellID, cd)

	--TYPE 5, BUFF/APPLY EFFECT
		elseif (Type==5) then
			SendCooldown(player, SpellID, cd)
		end

	--APPLY EXEFFECTS
		if (ExEffect1~=nil) then
			SendAura(player, target, ExEffect1, ExDuration1)
		end
		if (ExEffect2~=nil) then
			SendAura(player, target, ExEffect2, ExDuration2)
		end
		if (ExEffect3~=nil) then
			SendAura(player, target, ExEffect3, ExDuration3)
		end
	end
end
RegisterPlayerEvent(5, On_SpellCast)
--[[SPELL PREFERENCES
	-----------------
	SpellCooldownMult			- Affects the rate of cooldown for all shard_spell_table defined spells.
]]
SpellCooldownMult				= 1

--[[GROUP PREFERENCES
	-----------------
	GroupBonusExpMultiplier		- This number will be multiplied by the level of the killed mob to calculate bonus EXP gain.
	GroupBonusExpLevelDiff		- The maximum levels higher a player can be than the mob he kills to gain bonus EXP.
]]
GroupBonusExpMultiplier			= 18
GroupBonusExpLevelDiff			= 4

--[[PVP PREFERENCES
	---------------
	EnableDeathAnnouncer		- Set to true if you wish PvP deaths to be announced globally.
	PvPLevelDiff				- Players that die to a player that has this much of a level advantage will not drop loot.
]]
EnableDeathAnnouncer			= true
PvPLevelDiff					= 4

--[[COMMAND PREFERENCES
	-------------------
	ReloadSpellsCommand			- Reloads the shard_spells_table data.
	CullCharactersCommand		- Sweeps through the various Shard tables and deletes characters that don't exist in the "characters" table.
]]
ReloadSpellsCommand 			= "%reload spells"
--CullCharactersCommand			= "%cull characters"

ClassColorCodes = {"C79C6E", "F58CBA", "ABD473", "FFF569", "FFFFFF", "C41F3B", "0070DE", "69CCF0", "9482C9", nil, "FF7D0A"}
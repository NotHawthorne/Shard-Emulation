ShardLUA
========
The LUA code for The Shard of Entropy. Requires Eluna 3.3.5a, and a few custom SQL tables, outlined at the bottom of this README. My SQL DB's are named wrath_characters, wrath_mangos, and wrath_realmd. If you see those in a script, rename them to your DB names for them to work properly. Many of the spell scripts contain references to custom spells not included.

NOTHAWTHORNE'S PREAMBLE
=======================
I started The Shard of Entropy as something to work on in my spare time. Releasing it to the public was a good thing, and I got a lot of ideas and fun out of seeing things progress and grow. However, as time went on, it became more work than enjoyment for me. If I don't enjoy what I'm doing, I don't do it anymore. (At least when it comes to my hobbies.)
On top of this, I refuse to present something I see as shitty. Logging on and getting instagibbed by a Killing Spree Stalker with level 80 poisons? That's shitty. Falling to your death and losing your gear because of Blink? Shitty. If I'm going to be developing something like this, I'm going to make goddamned sure that it's going to be built well, and Shard in its most recent incarnation was many things, but not built well. 
If you guys want to go ahead and contribute, please do so. I encourage it highly. I will be tweaking and adding things as well, albeit at a slower pace than I was. However, I will not take on the duty of running the server anymore. I love you guys, long live <Solomon Jones>.

FAQ
===
Q: How does the Invocation script work?
A: It uses custom spells in my spell.dbc file, but can be reworked as long as you make the spells. The Wex/Quas/Exort spells will check for an "essence" item on spellcast, and if they are there, consume them and add one stack of the appropriate buff. Invoke will check for the number of Wex/Quas/Exort buffs on the caster, and appropriately grant the spell scrolls (based off of the Scroll of Spirit items, just modified in the database to be Unique(3) and cast various other spells)

Q: entropypvp.lua won't work!
A: You need empty vendor NPCs with entryID's of 818001-818010 for the script to work correctly. 

Q: _______ is buggy/poorly scripted!
A: I know. Few things in this repository are 100% finished, and my coding ability is subpar at that. On top of that, none of these scripts have the commenting necessary for people to easily understand what each part of my scripts are for. This is because this repository is nothing, at the moment, but a personal project that I've only uploaded for any parties interested in contributing to or using these scripts.

[[BROKEN/UNFINISHED SCRIPTS]]
==================
1) .\general\aa\alternate_advancement.lua/apply_aa.lua
-AddAura is acting weird with not applying certain auras. Weaponmastery is the only one that works fully, and Defense is only partially complete. I also know it would be easier to procedurally generate the menus as opposed to predefining each one, however, I haven't taken the time to learn how to do that. 

2) .\general\items\horadcric_cube.lua
-Right now, the main issue is obtaining the ID of the slot Horadric Cube is in. Other than that, it works pretty nicely.

3) .\necromancer\necroguardian.lua
-Necromancers have fallen by the wayside, and this was me playing around with certain concepts. The idea is unfinished and the script is pretty much useless.

4) .\spellbreaker\medivhs_disdain.lua
-Partially complete.

Character DB Tables
============
1) alternate_advancement, with the following INT columns
-ID (Auto-Inc)
-playerguid
-category
-selection
-points (default: 0)
2) character_aa_points, with the following INT columns
-playerguid
-points

World DB Tables
===============
1) ownership, with a single INT column
-guild

2) horadric_cube, with the following INT columns
-ID (Auto-Inc)
-item (use the EntryID of the item here)
-rarity (use the number in the rarity column of the item you wish to add to the cube possiblities)

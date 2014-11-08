local NPC_ID = 11546
local NPC_ID2 = 6768

function jorach_gossip1 (event, plr, unit)
	if (plr:GetQuestStatus(818009)==3) then
		unit:SendUnitSay("Ah, Jorach sends another hired hand to do his dirty work, does he?", 0)
        plr:GossipMenuAddItem(0, "Stand and deliver, Jorach!", 0, 1)
		plr:GossipMenuAddItem(0, "<Cancel>", 0, 2)
        plr:GossipSendMenu(1, unit)
	end
	if (plr:GetItemCount(11815)==1) then
		unit:SendUnitSay("Hello there.", 0)
	end
end

function remove_events(event, creature)
	creature:RemoveEvents()
	creature:SetFaction(35)
end

local function jorach_select (event, player, unit, sender, intid, code)
	if (intid == 1) then
        player:GossipClearMenu()
		unit:SendUnitSay("Watch your mouth, cur! Have you any idea why the Assassin's Guild wishes to have my head?", 0)
        player:GossipMenuAddItem(0, "Must I?", 0, 3)
		player:GossipMenuAddItem(0, "<Cancel>", 0, 2)
        player:GossipSendMenu(1, unit)
    end
	if (intid == 2) then
        player:GossipComplete()
    end
	if (intid == 3) then
		player:GossipClearMenu()
		unit:SendUnitSay("Jorach is too calculating for his own good. He would lie in wait for a year to do something that could take place in a day. During my tenure in the Assassin's Guild, I realized I could get things done much more effectively by catching the enemy off-guard with full-frontal aggression.", 0)
        player:GossipMenuAddItem(0, "<Continue listening.>", 0, 4)
		player:GossipMenuAddItem(0, "<Cancel>", 0, 2)
        player:GossipSendMenu(1, unit)
    end
	if (intid == 4) then
		player:GossipClearMenu()
		unit:SendUnitSay("However, old Jorach didn't take too kindly to my lack of subtlety. He deemed me a potential hazard to Guild secrets, and ordered my execution. The bastard would have had his lackeys kill me in my sleep had I not been battling a nasty case of insomnia that night!", 0)
        player:GossipMenuAddItem(0, "What are you trying to say, Sterling?", 0, 5)
		player:GossipMenuAddItem(0, "<Cancel>", 0, 2)
        player:GossipSendMenu(1, unit)
    end
	if (intid == 5) then
		unit:SendUnitSay("What I'm trying to say is that there's two sides to every coin. Now, we can proceed in one of two ways. Either you can ally yourself to me, and I will train you as my pupil, or you may try your hand at slaying me to win the favor of that old fool Jorach.", 0)
        player:GossipMenuAddItem(0, "Prepare to die. [Path of the Assassin]", 0, 6)
		player:GossipMenuAddItem(0, "You'd better know what you're doing. [Path of the Stalker]", 0, 7)
		player:GossipMenuAddItem(0, "<Cancel>", 0, 2)
        player:GossipSendMenu(1, unit)
    end
	if (intid == 6) then
		local target = unit:GetNearestPlayer(50)
		unit:SendUnitYell("Well, then! Have at me!", 0)
		unit:SetFaction(168)
		unit:AttackStart(target)
	end
	if (intid == 7) then
		player:GossipComplete()
		player:FailQuest(818009)
		player:SendQuestTemplate(818010)
		unit:SendUnitSay("Alright! Now, just reach into that crate over there for your training supplies.", 0)
	end
end

RegisterCreatureGossipEvent(NPC_ID, 1, jorach_gossip1)
RegisterCreatureGossipEvent(NPC_ID, 2, jorach_select)
RegisterCreatureEvent(11546, 4, remove_events)
RegisterCreatureEvent(11546, 2, remove_events)
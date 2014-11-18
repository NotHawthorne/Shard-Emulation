--Mastery System
ms = {}
ms.getMasteries = nil
ms.masteries = {}
ms.auras = {
  [1] = {
    [1] = { {1, 13706}, {2, 13804}, {3, 13805}, {4, 13806}, {5, 13807}  },
    [2] = { {1, 29590}, {2, 29591}, {3, 29592}  },
    [3] = { {1, 16538}, {2, 16539}, {3, 16540}, {4, 16541}, {5, 16542}  },
    [4] = { {1, 20111}, {2, 20112}, {3, 20113}  },
    [5] = { {1, 13715}, {2, 13848}, {3, 13849}, {4, 13851}, {5, 13852}  },
    [6] = { {1, 12281}, {2, 12812}, {3, 12813}, {4, 12814}, {5, 12815}  }
  }
}
--Mastery data: [0] = {selection, points}
function ms.apply_aa(event, player)
  ms.getMasteries = CharDBQuery("SELECT selection,points,category FROM shard_aa_allocation WHERE playerguid="..player:GetGUIDLow().." ORDER BY category ASC")
  repeat
    ms.masteries[db:GetUInt32(2)] = {db:GetUInt32(0), db:GetUInt32(1)}
  until not ms.getMasteries:NextRow()

  for mastery, data in ipairs(ms.masteries) do
    for selection, aura in ipairs(ms.auras[mastery][data[0]]) do
      if (aura[0] >= data[1]) then
        player:AddAura(aura[0], player)
      end
    end
  end
end
RegisterPlayerEvent(3, apply_aa)
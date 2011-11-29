local T, C, L = unpack(Tukui)

if not C.chat.enable == true then return end

local function SetupChat( self )

ChatFrame_RemoveChannel( ChatFrame3, L.chat_trade )
ChatFrame_RemoveChannel( ChatFrame3, L.chat_general )
ChatFrame_RemoveChannel( ChatFrame3, L.chat_defense )
ChatFrame_RemoveChannel( ChatFrame3, L.chat_recrutment )
ChatFrame_RemoveChannel( ChatFrame3, L.chat_lfg )


FCF_SetWindowName(ChatFrame1, "Genreal")

ChatFrame_RemoveAllMessageGroups(ChatFrame1)
ChatFrame_AddMessageGroup(ChatFrame1, "TRADE")
ChatFrame_AddChannel(ChatFrame1, L.chat_trade) -- erf, it seem we need to localize this now
ChatFrame_AddChannel(ChatFrame1, L.chat_general) -- erf, it seem we need to localize this now
ChatFrame_AddChannel(ChatFrame1, L.chat_defense) -- erf, it seem we need to localize this now
ChatFrame_AddChannel(ChatFrame1, L.chat_recrutment) -- erf, it seem we need to localize this now
ChatFrame_AddChannel(ChatFrame1, L.chat_lfg) -- erf, it seem we need to localize this now
ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
ChatFrame_AddMessageGroup(ChatFrame1, "DND")
ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_XP_GAIN")
ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_HONOR_GAIN")
ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_FACTION_CHANGE")
ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")
ChatFrame_AddMessageGroup(ChatFrame1, "MONEY")
ChatFrame_AddMessageGroup(ChatFrame1, "CURRENCY")


FCF_SetWindowName(ChatFrame3, "G S W")

ChatFrame_RemoveAllMessageGroups(ChatFrame3)
ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
ChatFrame_AddMessageGroup(ChatFrame3, "SAY")
ChatFrame_AddMessageGroup(ChatFrame3, "EMOTE")
ChatFrame_AddMessageGroup(ChatFrame3, "YELL")
ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
ChatFrame_AddMessageGroup(ChatFrame3, "GUILD_ACHIEVEMENT")
ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_SAY")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_EMOTE")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_YELL")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_EMOTE")
ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame3, "PARTY")
ChatFrame_AddMessageGroup(ChatFrame3, "PARTY_LEADER")
ChatFrame_AddMessageGroup(ChatFrame3, "RAID")
ChatFrame_AddMessageGroup(ChatFrame3, "RAID_LEADER")
ChatFrame_AddMessageGroup(ChatFrame3, "RAID_WARNING")
ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND")
ChatFrame_AddMessageGroup(ChatFrame3, "BATTLEGROUND_LEADER")
ChatFrame_AddMessageGroup(ChatFrame3, "BG_HORDE")
ChatFrame_AddMessageGroup(ChatFrame3, "BG_ALLIANCE")
ChatFrame_AddMessageGroup(ChatFrame3, "BG_NEUTRAL")
ChatFrame_AddMessageGroup(ChatFrame3, "SYSTEM")
ChatFrame_AddMessageGroup(ChatFrame3, "ERRORS")
ChatFrame_AddMessageGroup(ChatFrame3, "AFK")
ChatFrame_AddMessageGroup(ChatFrame3, "DND")
ChatFrame_AddMessageGroup(ChatFrame3, "IGNORED")
ChatFrame_AddMessageGroup(ChatFrame3, "ACHIEVEMENT")
ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")

ChatFrame_RemoveAllMessageGroups(ChatFrame4)
ChatFrame4Tab:Kill()
ChatFrame4:Kill()

end

TukuiChat:HookScript( "OnEvent", function( self, event, ... )
	local addon = ...
	if( event == "ADDON_LOADED" ) then
		if( addon == "Blizzard_CombatLog" ) then
			self:UnregisterEvent( "ADDON_LOADED" )
			SetupChat( self )
		end
	elseif( event == "PLAYER_ENTERING_WORLD" ) then
		self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )
	end
end )

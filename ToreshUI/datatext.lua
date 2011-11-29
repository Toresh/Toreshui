local T, C, L = unpack(Tukui)

---------------------------------------------------------------------------------
--Over write datatext function so we can use data broker.
---------------------------------------------------------------------------------


T.PP = function(p, obj)
	local middle = CentreInfo
	local left = TukuiInfoLeft
	local right = TukuiInfoRight
	local mapleft = TukuiMinimapStatsLeft
	local mapright = TukuiMinimapStatsRight
	local maptop = MiniMapTop
	
	if p == 1 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint("LEFT", left, 30, 0)
		obj:SetPoint('TOP', left)
		obj:SetPoint('BOTTOM', left)
	elseif p == 2 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint('TOP', left)
		obj:SetPoint('BOTTOM', left)
	elseif p == 3 then
		obj:SetParent(left)
		obj:SetHeight(left:GetHeight())
		obj:SetPoint("RIGHT", left, -30, 0)
		obj:SetPoint('TOP', left)
		obj:SetPoint('BOTTOM', left)
	elseif p == 4 then
		obj:ClearAllPoints()
		obj:SetParent(middle)
		obj:SetHeight(middle:GetHeight())
		obj:SetPoint("LEFT", 30, 0)		
	elseif p == 5 then
		obj:ClearAllPoints()
		obj:SetParent(middle)
		obj:SetHeight(middle:GetHeight())
		obj:SetPoint("CENTER", -(T.buttonsize*5), 0)		
	elseif p == 6 then
		obj:ClearAllPoints()
		obj:SetParent(middle)
		obj:SetHeight(middle:GetHeight())
		obj:SetPoint("CENTER", (T.buttonsize*5), 0)
	elseif p == 7 then
		obj:ClearAllPoints()
		obj:SetParent(middle)
		obj:SetHeight(middle:GetHeight())
		obj:SetPoint("RIGHT", -30, 0)
	elseif p == 8 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint("LEFT", right, 30, 0)
		obj:SetPoint('TOP', right)
		obj:SetPoint('BOTTOM', right)
	elseif p == 9 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint('TOP', right)
		obj:SetPoint('BOTTOM', right)
	elseif p == 10 then
		obj:SetParent(right)
		obj:SetHeight(right:GetHeight())
		obj:SetPoint("RIGHT", right, -30, 0)
		obj:SetPoint('TOP', right)
		obj:SetPoint('BOTTOM', right)
	end
	if TukuiMinimap then
		if p == 11 then
			obj:SetParent(mapleft)
			obj:SetHeight(mapleft:GetHeight())
			obj:SetPoint('TOP', mapleft)
			obj:SetPoint('BOTTOM', mapleft)
		elseif p == 12 then
			obj:SetParent(mapright)
			obj:SetHeight(mapright:GetHeight())
			obj:SetPoint('TOP', mapright)
			obj:SetPoint('BOTTOM', mapright)
		elseif p == 13 and C.panels.minimaptoppanel then
			obj:SetParent(maptop)
			obj:SetHeight(maptop:GetHeight())
			obj:SetPoint('TOP', maptop)
			obj:SetPoint('BOTTOM', maptop)
		end
	end	
end

-- datatext we use in our edit, Tukui Option / data frame name
local dt = {
	armor = "Armor",
	guild = "Guild",
	friends = "Friends",
	avd = "Avoidance",
	wowtime = "Time",
	gold = "Gold",
	fps_ms = "FPS",
	system = "System",
	bags = "Bags",
	dur = "Durability",
	hps_text = "Heal",
	dps_text = "Damage",
	power = "Power",
	haste = "Haste",
	crit = "Crit",
	currency = "Currency",
	hit = "Hit",
	mastery = "Mastery",
	micromenu = "MicroMenu",
	regen = "Regen",
	talent = "Talent",
	calltoarms = "CallToArms",
}


if IsAddOnLoaded("Tukui_ConfigUI") then
	TukuiConfigUILocalization.actionbarallbar = "Active 3 more action bars!"
	TukuiConfigUILocalization.chatoutline = "Active Outline on Chat!"
	
	TukuiConfigUILocalization.panels = "Panels"
	TukuiConfigUILocalization.panelsminimaptoppanel = "Turns on panel above minimap"
	TukuiConfigUILocalization.panelsminimaplocation = "Turns on minimap location"
	TukuiConfigUILocalization.panelsminimapcords = "Turns on minimap cords"
	
	TukuiConfigUILocalization.unitframestoreshlayout = "Change the unitframe layout, 1 or 2"
	
	
	TukuiConfigUILocalization.broker_datatext = "Broker addons"
	TukuiConfigUILocalization.broker_datatextSkada = "Skada"
	TukuiConfigUILocalization.broker_datatextRaidBuffStatus = "Raid Buff Status"
	TukuiConfigUILocalization.broker_datatextCashflow = "Cash Flow"
	TukuiConfigUILocalization.broker_datatextclsaver = "Cobat Log Saver"
	TukuiConfigUILocalization.broker_datatextWIM = "Wow instant messager"
	TukuiConfigUILocalization.broker_datatextAltoholic = "Altoholic"
	TukuiConfigUILocalization.broker_datatextOutfitter = "Out Fitter"
	TukuiConfigUILocalization.broker_datatextDXE = "DXE"
	TukuiConfigUILocalization.broker_datatextAtlasLoot = "AtlasLoot"
	TukuiConfigUILocalization.broker_datatextOmen = "Omen"
	TukuiConfigUILocalization.broker_datatextSpamalyzer = "Spamalyzer"
	TukuiConfigUILocalization.broker_datatextBroker_HudMap = "Hudmap"
	TukuiConfigUILocalization.broker_datatextSkinner = "Skinner"
	TukuiConfigUILocalization.broker_datatextZOMGBuffs = "ZOMG Buffs"
	TukuiConfigUILocalization.broker_datatextBugSack = "Bug Sack"
	TukuiConfigUILocalization.broker_datatextSocialState = "Socal State"
	TukuiConfigUILocalization.broker_datatextBroker_Location = "Location"
	TukuiConfigUILocalization.broker_datatextAanye_XP = "Aanye XP"
	TukuiConfigUILocalization.broker_datatextBroker_GroupHelper = "Group Helper"
	TukuiConfigUILocalization.broker_datatextDecursive = "Decursive"
end


for option, stat in pairs(dt) do
	local t = "TukuiStat"
	local frame = _G[t..stat]
	local text = _G[t..stat.."Text"]

	if frame then
		for opt, result in pairs(C.datatext) do
			if opt == option then
				T.PP(result, text)
			end
		end
	end
end
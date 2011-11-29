local C = {}


-------------------------------------------------------------
-- Adjust your default config here, it will overwrite default
-------------------------------------------------------------

C.general = {
	blizzardreskin = true,
	autoscale = false,
	uiscale = 0.8,
}

C.panels = {
	minimaptoppanel = false,
	minimaplocation = false,
	minimapcords = false,
}

C.unitframes = {
	cdlatency = true,
	targetpowerpvponly = false,
	showtotalhpmp = true,
	healcomm = true,
	charportrait = true,
	cblatency = true,
	xpbar = true,
	toreshlayout = 1,				--chose layout 1 or 2
}

C.actionbar = {
	buttonsize = 20,
	petbuttonsize = 18,
	shortoutsidebar = true,
}

C.chat = {
	background = true,
}

C.namplate = {
	showhealth = true,
	enchancethreat = true,
}

C.datatext = {
	time24 = false,
	localtime = true,
	guild = 12,
	friends = 11,
	gold = 3,
	wowtime = 10,
	power = 0,
	fps_ms = 8,
	system = 9,
}
C.media = {
	["font"] = [=[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]=], -- general font of tukui
	["uffont"] = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]], -- general font of unitframes
}

C.broker_datatext = {
	Skada = 0,					  --This is an example of how to add broker addons. To find the name, type /showldb in game.
	RaidBuffStatus = 0,
	Cashflow = 3,
	clsaver = 0,
	WIM = 7,
	Altoholic = 4,
	Outfitter = 0,
	DXE = 0,
	AtlasLoot = 6,
	Omen = 0,
	Spamalyzer = 1,
	Broker_HudMap = 0,
	Skinner = 0,
	ZOMGBuffs = 5,
	BugSack = 0,
	SocialState = 0,
	Broker_Location = 0,
	Aanye_XP = 0,
	Broker_GroupHelper = 0,
	Decursive = 0,
}

--[[Set the option text
if IsAddOnLoaded("Tukui_ConfigUI") then
	TukuiConfigUILocalization.actionbarallbar = "Active 3 more action bars!"
	TukuiConfigUILocalization.chatoutline = "Active Outline on Chat!"
	
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
end ]]--
-------------------------------------------------------------
-- Stop Editing Config!
-------------------------------------------------------------

-- make it public
TukuiEditedDefaultConfig = C


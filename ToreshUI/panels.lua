local T, C, L = unpack(Tukui)

--TukuiBar2Button:Kill()
--TukuiBar3Button:Kill()
--TukuiBar4Button:Kill()
TukuiBar5ButtonTop:Kill()
TukuiBar5ButtonBottom:Kill()


---------------------------------------------------------------
-- Panels
---------------------------------------------------------------

-- hide Panels we don't need.
local lines = {TukuiInfoLeftLineVertical, TukuiInfoRightLineVertical, TukuiLineToABLeft, TukuiLineToABLeftAlt, TukuiLineToABRight, TukuiLineToABRightAlt, TukuiChatBackgroundRight, TukuiTabsRightBackground, TukuiLineToPetActionBarBackground}
for _, panel in pairs(lines) do
	panel:Hide()
end


local miniMapText = {TukuiMinimapZone, TukuiMinimapZoneText, TukuiMinimapCoord, TukuiMinimapCoordText}
for _, maptext in pairs(miniMapText) do	
	maptext:SetAlpha(1)
	maptext.SetAlpha = T.dummy
end

if C.panels.minimaplocation == false then
	TukuiMinimapZone:Hide()
	TukuiMinimapZoneText:Hide()
end

if C.panels.minimapcords == false then
	TukuiMinimapCoord:Hide()
	TukuiMinimapCoordText:Hide()
end

T.InfoLeftRightWidth = 370

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMRIGHT", UIParent, -5, 5)
TukuiInfoRight:Width(T.InfoLeftRightWidth)
TukuiInfoRight:SetAlpha(0.8)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, 5, 5)
TukuiInfoLeft:Width(T.InfoLeftRightWidth)
TukuiInfoLeft:SetAlpha(0.8)

TukuiBar4Button:ClearAllPoints()
TukuiBar4Button:SetPoint("TOP", CentreInfo, "BOTTOM", 0, T.buttonspacing)

TukuiMinimapStatsLeft:SetAlpha(0.8)
TukuiMinimapStatsRight:SetAlpha(0.8)

--hide left chat background if showen
if C.chat.background then
	TukuiTabsLeftBackground:Kill()
	TukuiChatBackgroundLeft:ClearAllPoints()
	TukuiChatBackgroundLeft:Point("BOTTOM", TukuiInfoLeft, "BOTTOM" ,0 , -4)
	TukuiChatBackgroundLeft:Width(T.InfoLeftRightWidth + 5)
	TukuiChatBackgroundLeft:Height(150)
end

--CentreInfo bar
local p1 = CreateFrame("Frame", "CentreInfo", UIParent)
p1:SetWidth(((T.buttonsize*24) + (T.buttonspacing*30)))
p1:SetHeight(TukuiInfoLeft:GetHeight())
p1:SetFrameLevel(2)
p1:SetFrameStrata("BACKGROUND")
p1:SetTemplate()
p1:SetAlpha(0.8)
p1:SetPoint("BOTTOM", 0, 5)



--Above minimap
if C.panels.minimaptoppanel == true then
	local p2 = CreateFrame ("Frame", "MiniMapTop", UIParent)
	p2:SetWidth(TukuiMinimap:GetWidth())
	p2:SetHeight(TukuiInfoLeft:GetHeight())
	p2:SetFrameLevel(2)
	p2:SetFrameStrata("BACKGROUND")
	p2:SetTemplate()
	p2:SetAlpha(0.8)
	p2:SetPoint("BOTTOMRIGHT", TukuiMinimap, "TOPRIGHT", 0, 1)
end

--Watchframe
TukuiWatchFrameAnchor:Point("TOPRIGHT", UIParent, -5, -220)

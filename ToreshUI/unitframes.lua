local T, C, L = unpack(Tukui)
if C.unitframes.enable ~= true then return end

if C.unitframes.toreshlayout == 2 then
	return end
	
local font1 = C["media"].uffont
local font2 = C["media"].font
local normTex = C["media"].normTex
local glowTex = C["media"].glowTex
local bubbleTex = C["media"].bubbleTex

local backdrop = {
	bgFile = C["media"].blank,
	insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult},
}
---------------------------------------------------------------
-- UnitFrames
---------------------------------------------------------------

--[[ I want to kill the shadow around unitframes on these unit
local unitframes = {
	"Player",
	"Target",
	"TargetTarget",
	"Pet",
	"Focus",
}

for _, object in pairs(unitframes) do
	local t = "Tukui"
	local f = _G[t..object]
	f.shadow:Kill()
end--]]

local player = TukuiPlayer
local target = TukuiTarget
local pet = TukuiPet
local tot = TukuiTargetTarget
local focus = TukuiFocus

--kill the panels of target and player
player.panel:Hide()
target.panel:Hide()
pet.panel:Hide()
tot.panel:Hide()


--move player and target
player:ClearAllPoints()
target:ClearAllPoints()
player:Point("BOTTOM", UIParent, -150, 175)
target:Point("BOTTOM", UIParent, 150, 175)

local unitframes = {"Player", "Target"}
for _, object in pairs(unitframes) do
	local t = "Tukui"
	local f = _G[t..object]

	local castbar = f.Castbar
	local health = f.Health
	local power = f.Power
	local healthBG = f.Health.bg
	local panel = f.panel
	local portrait = f.Portrait
	
	health:Height(29)
	power:Height(8)
	
	local text = power.value
	text:SetFont(C.media.font, 12, "OUTLINE")
	text:SetParent(health)
	text:ClearAllPoints()
	text:SetPoint("BOTTOMLEFT", health, 4, 2)

	local text = health.value
	text:SetFont(C.media.font, 12, "OUTLINE")
	text:SetParent(health)
	text:ClearAllPoints()
	text:SetPoint("BOTTOMRIGHT", health, -4, 2)


	if object == "Player" then
		
	
		player:Height(38)
		player:Width(250)
		
		--player castbar
		if( C["unitframes"].unitcastbar == true ) then
			castbar:ClearAllPoints()
			castbar:SetPoint("TOP", player, "Bottom", 0, -30)
			castbar:SetFrameLevel(4)
			castbar:Height(15)
			castbar:Width(player:GetWidth())
			castbar:CreateBorder()

			castbar.Time = T.SetFontString(castbar, font1, 12, "OUTLINE")
			castbar.Time:Point("RIGHT", castbar, "RIGHT", 2, 0)

			castbar.Text = T.SetFontString(castbar, font1, 12, "OUTLINE")
			castbar.Text:Point("LEFT", castbar, "LEFT", -2, 0)
			
			if C["unitframes"].cbicons == true then
				castbar.button:ClearAllPoints()
				castbar.button:SetPoint( "RIGHT", castbar, "LEFT", -T.buttonspacing, 0 )
				castbar.button:Size( 30, 30 )
			end
		end
		
	elseif object == "Target" then
		
		target:Height(38)
		target:Width(250)
		
		-- change the name font on target!
		target.Name:SetFont(C.media.font, 12, "OUTLINE")
		target.Name:SetParent(health)
		target.Name:ClearAllPoints()
		target.Name:SetPoint("TOPLEFT", 4, -2)
		target.Name.ClearAllPoints = T.dummy
		target.Name.SetPoint = T.dummy
		
		--target castbar
		if( C["unitframes"].unitcastbar == true ) then
			castbar:ClearAllPoints()
			castbar:SetPoint("TOP", target, "Bottom", 0, -30)
			castbar:SetFrameLevel(4)
			castbar:Height(15)
			castbar:Width(target:GetWidth())
			castbar:CreateBorder()

			castbar.Time = T.SetFontString(castbar, font1, 12, "OUTLINE")
			castbar.Time:Point("RIGHT", castbar, "RIGHT", 2, 0)

			castbar.Text = T.SetFontString(castbar, font1, 12, "OUTLINE")
			castbar.Text:Point("LEFT", castbar, "LEFT", -2, 0)
			
			if C["unitframes"].cbicons == true then
				castbar.button:ClearAllPoints()
				castbar.button:SetPoint( "LEFT", castbar, "RIGHT", T.buttonspacing, 0 )
				castbar.button:Size( 30, 30 )
			end
		end
	end 


	
end


--pet frame
pet:ClearAllPoints()
pet:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -T.buttonspacing)

pet:Height(20)
pet.Health:Height(15)
pet.Power:Height(5)

pet.Castbar:Kill()

--change text on pet
pet.Name:SetFont(C.media.font, 12, "OUTLINE")
pet.Name:SetParent(TukuiPet.Health)
pet.Name:ClearAllPoints()
pet.Name:SetPoint("CENTER", 0, 0)
pet.Name.ClearAllPoints = T.dummy
pet.Name.SetPoint = T.dummy

--Target of Target
tot:ClearAllPoints()
tot:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -T.buttonspacing)
tot:Height(15)
tot.Health:Height(15)

--Focus
focus:ClearAllPoints()
focus:SetPoint("TOPLEFT", TukuiTarget, "TOPRIGHT", 30, 0)

TukuiFocusTarget:Kill()

--change text on TargetTarget
tot.Name:SetFont(C.media.font, 12, "OUTLINE")
tot.Name:SetParent(TukuiTargetTarget.Health)
tot.Name:ClearAllPoints()
tot.Name:SetPoint("CENTER", 0, 0 )
tot.Name.ClearAllPoints = T.dummy
tot.Name.SetPoint = T.dummy



if C.unitframes.charportrait == true then
	TukuiPlayer_Portrait:ClearAllPoints()
	TukuiPlayer_Portrait:SetAllPoints(TukuiPlayer.Health)
	TukuiPlayer_Portrait:SetAlpha(0.3)
	TukuiTarget_Portrait:ClearAllPoints()
	TukuiTarget_Portrait:SetAllPoints(TukuiTarget.Health)
	TukuiTarget_Portrait:SetAlpha(0.3)
	TukuiTarget_Portrait.SetAlpha = T.dummy
	TukuiPlayer.Health:SetPoint("TOPLEFT", 0,0)
	TukuiPlayer.Health:SetPoint("TOPRIGHT")
	TukuiTarget.Health:SetPoint("TOPRIGHT", 0,0)
	TukuiTarget.Health:SetPoint("TOPLEFT")
end


if(T.level ~= MAX_PLAYER_LEVEL) and (C.unitframes.xpbar) then
	player.Experience:Width(5)
	player.Experience:Height(TukuiMinimap:GetHeight() - 4)
	player.Experience:ClearAllPoints()
	player.Experience:Point("LEFT", TukuiMinimap, "RIGHT", T.buttonspacing, 0)
	player.Experience:SetOrientation("Vertical")
	player.Experience.Rested:SetOrientation("Vertical")
	player.Experience:SetFrameLevel(12)
	player.Experience:SetAlpha(1)
	player.Experience:HookScript("OnLeave", function(player) player:SetAlpha(1) end)
	player.Experience:CreateBorder()
	player.Resting:SetTexture(nil)
end

if(T.level == MAX_PLAYER_LEVEL) and (C.unitframes.xpbar) then
	player.Reputation:Width(5)
	player.Reputation:Height(TukuiMinimap:GetHeight() - 4)
	player.Reputation:ClearAllPoints()
	player.Reputation:Point("LEFT", TukuiMinimap, "RIGHT", T.buttonspacing, 0)
	player.Reputation:SetOrientation("Vertical")
	player.Reputation:SetFrameLevel(10)
	player.Reputation:SetAlpha(1)
	player.Reputation:HookScript("OnLeave", function(player) player:SetAlpha(1) end)
	player.Reputation:CreateBorder()
end


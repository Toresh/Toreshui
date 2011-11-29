local T, C, L = unpack(Tukui)
if C.unitframes.enable ~= true then return end

if C.unitframes.toreshlayout == 1 then
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

local player = TukuiPlayer
local target = TukuiTarget
local pet = TukuiPet
local tot = TukuiTargetTarget
local focus = TukuiFocus
local focustarget = TukuiFocusTarget



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
	
	health:Height(23)
	power:SetHeight(14)
	local text = power.value
	text:SetFont(C.media.font, 12, "OUTLINE")
	text:SetParent(health)
	text:ClearAllPoints()
	text:SetPoint("RIGHT", power, -2, -.5)

	local text = health.value
	text:SetFont(C.media.font, 12, "OUTLINE")
	text:SetParent(health)
	text:ClearAllPoints()
	text:SetPoint("BOTTOMRIGHT", health, -2, 2)
	
	panel:SetHeight(17)
	panel:ClearAllPoints()
	if object == "Player" then
		panel:SetPoint("TOPRIGHT", player, "TOPRIGHT", 0, 0)
		
		health:SetParent(player)
		health:SetPoint("TOPLEFT", 34, -18)
		health:SetPoint("TOPRIGHT")
		portrait:ClearAllPoints()
		portrait:SetPoint("TOPRIGHT", panel, "TOPLEFT", -1, -1)
		
		
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:Point("LEFT", panel, "LEFT", 2, 0)
		Name:SetJustifyH("LEFT")
		Name:SetFont(font1, 12)

		player:Tag(Name, '[Tukui:diffcolor][level] [Tukui:getnamecolor][Tukui:namelong] [shortclassification]')
		
	elseif object == "Target" then
		panel:SetPoint("TOPLEFT", target, "TOPLEFT", 0, 0)
		
		health:SetParent(target)
		health:ClearAllPoints()
		health:SetPoint("TOPRIGHT", -34, -18)
		health:SetPoint("TOPLEFT")
		--health.SetPoint = T.dummy
		portrait:ClearAllPoints()
		portrait:SetPoint("TOPLEFT", panel, "TOPRIGHT", 1, -1)
		
		
		
		target.Name:Kill()
		local Name = health:CreateFontString(nil, "OVERLAY")
		Name:Point("RIGHT", panel, "RIGHT", -2, 0)
		Name:SetJustifyH("LEFT")
		Name:SetFont(font1, 12)

		target:Tag(Name, '[Tukui:diffcolor][level] [Tukui:getnamecolor][Tukui:namelong] [shortclassification]')
	end
	
	
end


--Pet
pet.panel:ClearAllPoints()
pet.panel:SetPoint("TOP", pet, "TOP", 0, 0)
pet.Health:SetPoint("TOPLEFT", 0, -18)
pet.Health:SetPoint("TOPRIGHT")
pet:ClearAllPoints()
pet:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -T.buttonspacing)

--Target of target
tot.panel:ClearAllPoints()
tot.panel:SetPoint("TOP", tot, "TOP", 0, 0)
tot.Health:SetPoint("TOPLEFT", 0, -18)
tot.Health:SetPoint("TOPRIGHT")
tot:ClearAllPoints()
tot:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -T.buttonspacing)

--Focus
focus:ClearAllPoints()
focus:SetPoint("TOPLEFT", TukuiTarget, "TOPRIGHT", 30, 0)


--Focus Target
focustarget:Kill()


if T.level ~= MAX_PLAYER_LEVEL then
	player.Experience:Kill()
end

if T.level == MAX_PLAYER_LEVEL then
	player.Reputation:Kill()
end
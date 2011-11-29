local T, C, L = unpack(Tukui)

if not C.actionbar.enable == true then return end

---------------------------------------------------------------
-- Action Bars
---------------------------------------------------------------
TukuiBar1:ClearAllPoints()
TukuiBar1:SetPoint("BOTTOM", CentreInfo, "TOP" , 0, T.buttonspacing)

TukuiBar4:ClearAllPoints()
TukuiBar4:SetPoint("BOTTOMLEFT", TukuiBar1, 0, 0)

--Move pet bar
TukuiPetBar:SetWidth((T.petbuttonsize*10) + (T.buttonspacing*11))
TukuiPetBar:SetHeight((T.petbuttonsize) + (T.buttonspacing*2))
local bar = TukuiPetBar
local link = TukuiLineToPetActionBarBackground
bar:SetAlpha(1)
link:SetAlpha(.8)
	
bar:RegisterEvent("PLAYER_LOGIN")
bar:RegisterEvent("PLAYER_CONTROL_LOST")
bar:RegisterEvent("PLAYER_CONTROL_GAINED")
bar:RegisterEvent("PLAYER_ENTERING_WORLD")
bar:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED")
bar:RegisterEvent("PET_BAR_UPDATE")
bar:RegisterEvent("PET_BAR_UPDATE_USABLE")
bar:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
bar:RegisterEvent("PET_BAR_HIDE")
bar:RegisterEvent("UNIT_PET")
bar:RegisterEvent("UNIT_FLAGS")
bar:RegisterEvent("UNIT_AURA")
bar:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_LOGIN" then	
		-- bug reported by Affli on t12 BETA
		PetActionBarFrame.showgrid = 1 -- hack to never hide pet button. :X
		-- move the pet bar
		if TukuiBar2:IsShown() then
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("BOTTOMLEFT", TukuiBar2, "TOPLEFT", 0, T.buttonspacing)
		elseif TukuiBar4:IsShown() then
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("BOTTOMLEFT", TukuiBar4, "TOPLEFT", 0, T.buttonspacing)
		else
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPLEFT", 0, T.buttonspacing)
		end
	
		local button		
		for i = 1, 10 do
			button = _G["PetActionButton"..i]
			button:ClearAllPoints()
			button:SetParent(TukuiPetBar)

			button:SetSize(T.petbuttonsize, T.petbuttonsize)
			if i == 1 then
				button:SetPoint("TOPLEFT", T.buttonspacing,-T.buttonspacing)
			else
				button:SetPoint("LEFT", _G["PetActionButton"..(i - 1)], "RIGHT", T.buttonspacing, 0)
			end
			button:Show()
			self:SetAttribute("addchild", button)
		end
		RegisterStateDriver(self, "visibility", "[pet,novehicleui,nobonusbar:5] show; hide")
		hooksecurefunc("PetActionBar_Update", T.TukuiPetBarUpdate)
	elseif event == "PET_BAR_UPDATE" or event == "UNIT_PET" and arg1 == "player" 
	or event == "PLAYER_CONTROL_LOST" or event == "PLAYER_CONTROL_GAINED" or event == "PLAYER_FARSIGHT_FOCUS_CHANGED" or event == "UNIT_FLAGS"
	or arg1 == "pet" and (event == "UNIT_AURA") then
		T.TukuiPetBarUpdate()
	elseif event == "PET_BAR_UPDATE_COOLDOWN" then
		PetActionBar_UpdateCooldowns()
	else
		T.StylePet()
	end
end)

if C.actionbar.shortoutsidebar == true then
	MultiBarBottomLeftButton7:Hide()
	MultiBarBottomLeftButton8:Hide()
	MultiBarBottomLeftButton9:Hide()
	MultiBarBottomLeftButton1:Hide()
	MultiBarBottomLeftButton2:Hide()
	MultiBarBottomLeftButton3:Hide()
end
TukuiBar5:Hide()
--ShapeShift!

TukuiShiftBar:ClearAllPoints()
TukuiShiftBar:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPRIGHT", -((T.buttonsize *4)+(T.buttonspacing*7)), -20)

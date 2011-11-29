local T, C, L = unpack(Tukui)

---Stolen from Sinaris
-- API stuff
--local S, C, L = unpack( Tukui )

local function Animate( self, x, y, duration )
	self.anim = self:CreateAnimationGroup( "Move_In" )
	self.anim.in1 = self.anim:CreateAnimation( "Translation" )
	self.anim.in1:SetDuration( 0 )
	self.anim.in1:SetOrder( 1 )
	self.anim.in2 = self.anim:CreateAnimation( "Translation" )
	self.anim.in2:SetDuration( duration )
	self.anim.in2:SetOrder( 2 )
	self.anim.in2:SetSmoothing( "OUT" )
	self.anim.out1 = self:CreateAnimationGroup( "Move_Out" )
	self.anim.out2 = self.anim.out1:CreateAnimation( "Translation" )
	self.anim.out2:SetDuration( duration )
	self.anim.out2:SetOrder( 1 )
	self.anim.out2:SetSmoothing( "IN" )
	self.anim.in1:SetOffset( T.Scale( x ), T.Scale( y ) )
	self.anim.in2:SetOffset( T.Scale( -x ), T.Scale( -y ) )
	self.anim.out2:SetOffset( T.Scale( x ), T.Scale( y ) )
	self.anim.out1:SetScript( "OnFinished", function() self:Hide() end )
end

local function CreateBorder( self )
	if( self:GetFrameStrata() == "BACKGROUND" ) then self:SetFrameStrata( "LOW" ) end

	local border = CreateFrame( "Frame", nil, self )
	border:SetPoint( "TOPLEFT", self, "TOPLEFT", T.Scale( -2 ), T.Scale( 2 ) )
	border:SetPoint( "BOTTOMRIGHT", self, "BOTTOMRIGHT", T.Scale( 2 ), T.Scale( -2 ) )
	border:SetTemplate( "Default" )
	border:CreateShadow( "Default" )
	border:SetFrameLevel( self:GetFrameLevel() )
end

local function FadeIn( frame )
	UIFrameFadeIn( frame, .4, frame:GetAlpha(), 1 )
end

local function FadeOut( frame )
	UIFrameFadeOut( frame, .8, frame:GetAlpha(), 0 )
end

local function SlideIn( self )
	if not self.anim then Animate( self ) end

	self.anim.out1:Stop()
	self:Show()
	self.anim:Play()
end

local function SlideOut( self )
	if( self.anim ) then self.anim:Finish() end

	self.anim:Stop()
	self.anim.out1:Play()
end

local function addapi( object )
	local mt = getmetatable( object ).__index
	if not object.Animate then mt.Animate = Animate end
	if not object.CreateBorder then mt.CreateBorder = CreateBorder end
	if not object.FadeIn then mt.FadeIn = FadeIn end
	if not object.FadeOut then mt.FadeOut = FadeOut end
	if not object.SlideIn then mt.SlideIn = SlideIn end
	if not object.SlideOut then mt.SlideOut = SlideOut end
end

local handled = { ["Frame"] = true }
local object = CreateFrame( "Frame" )
addapi( object )
addapi( object:CreateTexture() )
addapi( object:CreateFontString() )

object = EnumerateFrames()
while object do
	if not handled[object:GetObjectType()] then
		addapi( object )
		handled[object:GetObjectType()] = true
	end

	object = EnumerateFrames( object )
end
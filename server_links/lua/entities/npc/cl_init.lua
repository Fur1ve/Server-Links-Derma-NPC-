

include('shared.lua')

function ENT:Draw()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 1700 ) then return end

self:DrawModel()

if( self:GetPos():Distance( LocalPlayer():GetPos() ) > 600 ) then return end
	
local ang = self:GetAngles()

ang:RotateAroundAxis( self:GetAngles():Right(),270 )
ang:RotateAroundAxis( self:GetAngles():Forward(),90 )

local pos = self:GetPos() + ang:Right() * -85 + ang:Up() * 0 + ang:Forward() * -16

cam.Start3D2D(pos,ang,0.1)

	draw.RoundedBox( 0, 10, 43, 300,75, Color(30,30,30,255) )

	draw.SimpleText( "Server Links", "CloseCaption_Bold", 163, 75, Color(255,255,255), 1, 1 )

cam.End3D2D()

end

local ply = LocalPlayer()

local scrw, scrh = ScrW(),ScrH()

local function myMenu()
	local Frame = vgui.Create("DFrame")
	Frame:SetSize(500 ,500)
Frame:SetTitle("")
Frame:SetPos(0,0)
Frame:SetVisible( true )
Frame:SetDraggable( false )
Frame:ShowCloseButton( false )
Frame:MakePopup()
Frame:Center()
Frame:SetBackgroundBlur(true)
Frame.Paint = function(self,w,h)

local title = vgui.Create("DLabel", Frame)
title:SetText("Server Links!")
title:SetFont("CloseCaption_Bold")
title:SetPos(180, 12)
title:SetSize(100,100)
title:SizeToContents()



draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color(23, 23, 23, 255) )
			draw.RoundedBox( 0, 0, 0, self:GetWide(), 50, Color(33, 33, 33, 255 ) )
end



local closeButton = vgui.Create('DButton', Frame)
		closeButton:SetFont('marlett')
		closeButton:SetText('r')
		closeButton:SetColor(Color(255, 255, 255))
		closeButton:SetSize(15, 15)
		closeButton:SetDrawBackground(false)
		closeButton:SetPos( Frame:GetWide() - 25, 5)
		closeButton.DoClick = function()
			Frame:Remove()
		end


local button1 = vgui.Create("DButton", Frame)
button1:SetSize(250, 100)
button1:SetPos(125, 80)
button1:SetText("Workshop Content")
button1:SetFont("Trebuchet24")
button1:SetTextColor(Color(255,255,255))
button1.Paint = function(self,w,h)

draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color(23, 23, 23, 255) )
			draw.RoundedBox( 0, 0, 0, self:GetWide(), 250, Color(33, 33, 33, 255) )

end 


local button2 = vgui.Create("DButton", Frame)
button2:SetSize(250, 100)
button2:SetPos(125, 200)
button2:SetText("Discord Server")
button2:SetFont("Trebuchet24")
button2:SetTextColor(Color(255,255,255))
button2.Paint = function(self,w,h)

draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color(23, 23, 23, 255) )
			draw.RoundedBox( 0, 0, 0, self:GetWide(), 250, Color(33, 33, 33, 255) )

end 



local button3 = vgui.Create("DButton", Frame)
button3:SetSize(250, 100)
button3:SetPos(125, 320)
button3:SetText("Donate Link")
button3:SetFont("Trebuchet24")
button3:SetTextColor(Color(255,255,255))
button3.Paint = function(self,w,h)

draw.RoundedBox( 0, 0, 0, self:GetWide(), self:GetTall(), Color(23, 23, 23, 255) )
			draw.RoundedBox( 0, 0, 0, self:GetWide(), 250, Color(33, 33, 33, 255) )

end 

--BELOW ARE WHAT THE BUTTONS WILL DO 

button1.DoClick = function()
gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=2295978762") -- CHANGE THAT STEAM LINK TO YOUR WORKSHOP CONTENT
EmitSound( Sound( "garrysmod/save_load1.wav" ), Entity(1):GetPos(), 1, CHAN_AUTO, 1, 75, 0, 100 ) -- GET RID OF THIS LINE IF YOU DONT WANT A SOUND WHEN BUTTON IS CLICKED
end

-- DISCORD SERVER vvv

button2.DoClick = function()
gui.OpenURL("https://discord.gg/gmod") -- CHANGE THE DISCORD LINK TO YOUR DISCORD LINK
EmitSound( Sound( "garrysmod/save_load1.wav" ), Entity(1):GetPos(), 1, CHAN_AUTO, 1, 75, 0, 100 ) -- GET RID OF THIS LINE IF YOU DONT WANT A SOUND WHEN BUTTON IS CLICKED
end

-- DONATION LINK vvv

button3.DoClick = function()
gui.OpenURL("https://google.com") -- CHANGE THE GOOGLE LINK TO YOUR DONATION LINK!
EmitSound( Sound( "garrysmod/save_load1.wav" ), Entity(1):GetPos(), 1, CHAN_AUTO, 1, 75, 0, 100 ) -- GET RID OF THIS LINE IF YOU DONT WANT A SOUND WHEN BUTTON IS CLICKED
end

--END OF CONFIG

end
 usermessage.Hook("Server Links",myMenu) -- Menu Hook

concommand.Add("links", myMenu)


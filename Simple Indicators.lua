local y_offset = gui.Slider(gui.Reference("Visuals","Local","Helper"), "simple.indicators.y.ind.offset", "Simple Indicators Y Offset", -70, -450, 450)
local screenX, screenY = draw.GetScreenSize()
local half_screenY = screenY / 2
local button_held = input.IsButtonDown
local font = draw.CreateFont("Tahoma", 20, 700)


callbacks.Register("Draw", function()
local hc = gui.GetValue("rbot.accuracy.weapon.asniper.hitchance")    
local mindmg = gui.GetValue("rbot.accuracy.weapon.asniper.mindmg")   
local fakewalkkey = gui.GetValue("rbot.accuracy.movement.fakewalkkey")
local fakeduckkey = gui.GetValue("rbot.antiaim.extra.fakecrouchkey")
	
	draw.SetFont(font)
	
	if entities.GetLocalPlayer() then
	

    if (gui.GetValue("rbot.antiaim.advanced.autodir") == true) then
        draw.Color(0,128,0,255)
        draw.TextShadow(16, half_screenY+15+y_offset:GetValue(), "FreeStand")
	else
        draw.Color(128,0,0,255)
		draw.TextShadow(16, half_screenY+15+y_offset:GetValue(), "FreeStand")
    end

	if (gui.GetValue("misc.fakelag.enable") == true) then
        draw.Color(0,128,0,255)
        draw.TextShadow(16, half_screenY+35+y_offset:GetValue(), "Fakelag")
	else
        draw.Color(128,0,0,255)
		draw.TextShadow(16, half_screenY+35+y_offset:GetValue(), "Fakelag")
    end

    if (gui.GetValue("rbot.master") == true) and (gui.GetValue("rbot.aim.key") == 0) then
        draw.Color(0,128,0,255)
        draw.TextShadow(16, half_screenY+55+y_offset:GetValue(), "AutoFire")
	else
        draw.Color(128,0,0,255)
		draw.TextShadow(16, half_screenY+55+y_offset:GetValue(), "AutoFire")
    end

	if (gui.GetValue("rbot.accuracy.weapon.asniper.hitchance") ~= nil) then  
        draw.Color(0,128,0,255)
		draw.TextShadow(16, half_screenY+75+y_offset:GetValue(), "HC % is")
        draw.Color(0,0,128,255)
		draw.TextShadow(88, half_screenY+75+y_offset:GetValue(), ''..hc)
	else
		draw.Color(0,0,128,255)
		draw.TextShadow(16, half_screenY+95+y_offset:GetValue(), "No Toggleble Gun")	
	end
	
	if (gui.GetValue("rbot.accuracy.weapon.asniper.mindmg") ~= nil) then  
        draw.Color(0,128,0,255)
		draw.TextShadow(16, half_screenY+95+y_offset:GetValue(), "MinDMG" )
	    draw.Color(0,0,128,255)
		draw.TextShadow(88, half_screenY+95+y_offset:GetValue(), ''..mindmg )
	else
		draw.Color(0,0,128,255)
		draw.TextShadow(16, half_screenY+95+y_offset:GetValue(), "No Toggleble Gun")
	end
if fakewalkkey:getValue() ~= true return end
	if button_held(fakewalkkey) == true then
		
		draw.Color(0,128,0,255)
		draw.TextShadow(16, half_screenY+115+y_offset:GetValue(), "Fakewalking" )
	else
	    draw.Color(128,0,0,255)
		draw.TextShadow(16, half_screenY+115+y_offset:GetValue(), "Fakewalking" )
return end
	if fakeduckkey:getValue() ~= true return end
	if button_held(fakeduckkey) == true then
		
		draw.Color(0,128,0,255)
		draw.TextShadow(16, half_screenY+135+y_offset:GetValue(), "Fakeduckin" )
	else
	    draw.Color(128,0,0,255)
		draw.TextShadow(16, half_screenY+135+y_offset:GetValue(), "Fakeduckin" )
	return
end
end

end)
repeat wait() until game:IsLoaded()
--old-antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	warn("anti-afk")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
--variables
local player = game.Players.LocalPlayer
local mission = player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
local menuplace = 4616652839
local ember = 4601350214
local forestplace = 5447073001
local rainplace = 5084678830
local trainingplace = 5431071837
local akatsukiplace = 5431069982
local worldxplace = 5943874201
local warplace = 5824792748
local villageplace = game:GetService("Workspace"):FindFirstChild("rank")
--local warplace = game:GetService("Workspace"):FindFirstChild("warmode")
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/getgenv().speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

--UI Lib Loading

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/main/library.lua"))()
local scorpion = library.new("Scorpion Hub | SlayerViper#3097 /SL", 5013109572)

--Themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),
TextColor = Color3.fromRGB(255, 255, 255)
}

--First page
local page = scorpion:addPage("Main", 5012544693)

--Player page

local PlayerP = scorpion:addPage("Player", 5012544693)
local Humanoid = PlayerP:addSection("Humanoid")
local InfModeS = PlayerP:addSection("Inf Mode")

local walkspeedb
local s1
local sdefault = 50

local jp1
local jpdefault = 30

Humanoid:addToggle("Walkspeed", nil, function(bool)
	walkspeedb = bool
	
	if walkspeedb == true then
			_G.walkspeedb = bool;
			_G.walkspeedd = s1;

			local mt = getrawmetatable(game)
			local old = mt.__newindex
			setreadonly(mt, false)

			mt.__newindex = newcclosure(function(t,k,v)
   			pcall(function()
        		if t == game:GetService("Players").LocalPlayer.Character.Humanoid and k == "WalkSpeed" and _G.walkspeedb then
          		  v = _G.walkspeedd;
       		 end
   		 	end)
    		return old(t,k,v)
		end)
		
		else
			_G.walkspeedb = false;
			_G.walkspeedd = sdefault;

			local mt = getrawmetatable(game)
			local old = mt.__newindex
			setreadonly(mt, false)

			mt.__newindex = newcclosure(function(t,k,v)
   			pcall(function()
        		if t == game:GetService("Players").LocalPlayer.Character.Humanoid and k == "WalkSpeed" and _G.walkspeedb then
          		  v = _G.walkspeedd;
       		 end
   		 	end)
    		return old(t,k,v)
		end)
				
	end

end)
	
local jumppowerb
Humanoid:addToggle("Jumppower", nil, function(bool)
	jumppowerb = bool
	
	if jumppowerb == true then
			_G.jumppowerb = bool;
			_G.jumppowerr = jp1;

			local mt = getrawmetatable(game)
			local old = mt.__newindex
			setreadonly(mt, false)

			mt.__newindex = newcclosure(function(t,k,v)
   			pcall(function()
        		if t == game:GetService("Players").LocalPlayer.Character.Humanoid and k == "JumpPower" and _G.jumppowerb then
          		  v = _G.jumppowerr;
       		 end
   		 	end)
    		return old(t,k,v)
		end)
		
		else
			_G.jumppowerb = false;
			_G.jumppowerr = jpdefault;

			local mt = getrawmetatable(game)
			local old = mt.__newindex
			setreadonly(mt, false)

			mt.__newindex = newcclosure(function(t,k,v)
   			pcall(function()
        		if t == game:GetService("Players").LocalPlayer.Character.Humanoid and k == "JumpPower" and _G.jumppowerb then
          		  v = _G.jumppowerr;
       		 end
   		 	end)
    		return old(t,k,v)
		end)
				
	end
	
end)
	
	Humanoid:addTextbox("Walkspeed",50,function(speed)
		print("Selected: " .. speed)
		s1 = speed
	end)

	Humanoid:addTextbox("Jumppower",30,function(jumppower)
		print("Selected: " .. jumppower)
	    jp1 = jumppower
	end)

	local infmodeb
	InfModeS:addToggle("Inf Mode", nil, function(bool)
		infmodeb = bool
		
		if infmodeb == true then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/scorpionhub/infmode-open", true))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/scorpionhub/infmode-close", true))()
		end
	end)

--Two page
local page2 = scorpion:addPage("Autofarm", 5012544693)
local Farm = page2:addSection("Mission Farm")
local Scroll = page2:addSection("Scroll Farm")
local autofarmspd
getgenv().speed = 500


	local autofarm
	Farm:addToggle("AutoFarm", nil, function(bool)
		autofarm = bool
	end)
	
	
    Farm:addSliderS("AutoFarm Speed", 500, 100, 1000, function(autofarmspeed)
		autofarmspd = autofarmspeed
		getgenv().speed = autofarmspd
	end)
	
  	local RANKUP
    Farm:addToggle("AutoRank", nil, function(bool)
		RANKUP = bool
    end)
    
    	local jinfarm
    Scroll:addToggle("Jin Farm", nil, function(bool)
		jinfarm = bool
    end)

    Scroll:addToggle("Scroll Farm", nil, function(bool)
		scrollfarm = bool
    end)
	
	local gift
    Scroll:addToggle("Farm Gift Box", nil, function(bool)
		gift = bool
    end)
    

--Warmode Page
if game.PlaceId == warplace then
local warmodepage = scorpion:addPage("War Farm", 5012544693)
local warfarm = warmodepage:addSection("Warmode")

local war
    warfarm:addToggle("Warmode", nil, function(bool)
	   war = bool
	end)
	
    local reset
    warfarm:addToggle("Reset round 21", nil, function(bool)
        reset = bool
    end)
end

--Three page
local page3 = scorpion:addPage("Quests Maker", 5012544693)
local d = page3:addSection("Quests Maker")

    local RushL
	d:addToggle("Rush", nil, function(bool)
		RushL = bool
		
		for i = 1,300 do
			if RushL == true then
				game.Players.LocalPlayer.Character.combat.update:FireServer("rushw")
				wait(.25)
			end
		end
	end)

	local JumpsL
	d:addToggle("Jumps", nil, function(bool)
		JumpsL = bool
		
		for v = 1,300 do
			if JumpsL == true then
				game.Players.LocalPlayer.Character.combat.update:FireServer("takemovement2")
				wait(.25)
			end
		end
	end)
	
	local ChakraL
	d:addToggle("Chakra Charges", nil, function(bool)
		ChakraL = bool
		
		for i = 1,500 do
			if ChakraL == true then
				game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
				wait(.1)
				game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
				wait(.5)
			end
		end
	end)

	local PunchL
	d:addToggle("Punches", nil, function(bool)
		PunchL = bool
		
		for i = 1,999 do
			if PunchL == true then
				game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1",true)
				wait(.3)
			end
		end
	end)
	
    d:addButton("TP TrainLog",function()
        local player = game.Players.LocalPlayer
		toTarget(player.Character.HumanoidRootPart.Position,workspace.npc.logtraining:FindFirstChild("HumanoidRootPart").Position,CFrame.new(game:GetService("Workspace").npc.logtraining:FindFirstChild("HumanoidRootPart").Position))
	end)

	game:GetService('RunService').Stepped:connect(function()
		if autofarm or gift then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)
	local green = "http://www.roblox.com/asset/?id=5459241648"
	local red = "http://www.roblox.com/asset/?id=5459241799"
	local candy = "http://www.roblox.com/asset/?id=6078390771"
	spawn(function()
		while wait() do
			if autofarm then
				if  player.currentmission.Value == nil then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if player.currentmission.Value == nil and v.Name == "" and v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible  then
								local TALK = v:FindFirstChild("Talk")
								local lvl = player.statz.lvl.lvl.Value
								if lvl <= 699 then
									if player.currentmission.Value == nil  and v.Talk:FindFirstChild("typ").Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								elseif lvl >= 700 then
									if player.currentmission.Value == nil and TALK.typ.Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green or v.Head.givemission.color.Image == red then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								end
							end
						end)
					end
				else
					for i,v in pairs(workspace.npc:GetChildren()) do
						pcall(function()
						    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
								repeat wait(.5)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
									v.Humanoid.Health = 0
								until v.Humanoid.Health == 0 or not autofarm or player.currentmission.Value == nil
							end
						end)
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if gift then
				local spins = player.statz.spins.Value
				if spins < 500 then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if mission.Visible == false and v.ClassName == "Model" and v:FindFirstChild("Head"):FindFirstChild("givemission").Enabled and v:FindFirstChild("CLIENTTALK") and v:FindFirstChild("Talk") and string.find(v.Talk.talk1.Value, "Happy holidays, here is 1 FREE spin!") and v.Talk:FindFirstChild("typ").Value == "halloweenevent" and v.Head.givemission.color.Image == gift then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-5,0)))
									v.CLIENTTALK:FireServer()
									wait(.2)
									v.CLIENTTALK:FireServer("accept")
								until v:FindFirstChild("Head").givemission.Enabled == false or not gift
							end
						end)
					end
				else
					print("max spins reached 500")
				end
			end
		end
	end)
	local function SCROLLFARM()
		for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
				end)
				scrollA:FireServer(game.Players.LocalPlayer)
				fireclickdetector(v.sh.ClickDetector)
			end
		end
	end
	local function SCROLLFARM1()
		for i,v in pairs(game.workspace:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED in workspace")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end

	spawn(function()
		while wait() do
			if scrollfarm then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	
		game:GetService('RunService').Stepped:connect(function()
		if war or war2 then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)

	spawn(function()
		while wait() do
			if war or war2 then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	spawn(function()
		while wait() do
			if war then
				pcall(function()
					refresh:Refresh("War Completed: " .. count)
					refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				end)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						wait(.2)
						pcall(function()
							v.Humanoid.Health = 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(6)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
							v.Humanoid.Health = 0
						end)
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)
	
	spawn(function()
		while wait() do
			if war2 then
				refresh:Refresh("War Completed: " .. count)
				refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						pcall(function()
							repeat wait()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-12,0)))
							wait(.3)
							v.Humanoid.Health = 0
							until v.Humanoid.Health == 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(8)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
							v.Humanoid.Health = 0
						end)
					else
						wait()
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)

	local function JINFARM()
		for i,v in pairs(game:GetService("Workspace").npc:GetChildren()) do
			if v.Name == "npc1" then
				repeat wait()
					pcall(function()
						toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
						player.Character.combat.update:FireServer("mouse1", true)
						wait(.1)
						v.Humanoid.HealthChanged:Connect(function()
    						v.Humanoid.Health = 0
    					end)
					end)
				until v.Humanoid.Health == 0 or not jinfarm
			end
		end
	end
	spawn(function()
		while wait() do
			if jinfarm then
				JINFARM()
			end
		end
	end)
	spawn(function()
		while wait() do
			if RANKUP and player.statz.lvl:FindFirstChild("lvl").Value == 1000 then
				repeat wait()
					game.Players.LocalPlayer.startevent:FireServer("rankup")
				until player.statz.lvl:FindFirstChild("lvl").Value == 1 or not RANKUP
			end
		end
	end)
	
--Four page
if game.PlaceId == menuplace then
local inf = scorpion:addPage("KG Spin", 5012544693)
local spin = inf:addSection("Infinity Spin")

	--main menu
	local kgs = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
		if v:FindFirstChild("KG") then
			table.insert(kgs, v.Name)
		end
	end
	
	local b
	local kgslot
	local kgvalue
	spin:addDropdown("KG SLOT",{"kg1", "kg2", "kg3", "kg4"},function(kgS)
		b = kgS
		kgslot = game.Players.LocalPlayer.statz.main:FindFirstChild(b)
		kgvalue = kgslot.Value
		print(kgslot)
		print(kgvalue)
	end)
	
	local a1
	spin:addDropdown("KG Select",kgs,function(KG1)
		print("Selected: " .. KG1)
		a1 = KG1
	end)
	local a2
	spin:addDropdown("KG Select",kgs,function(KG2)
		print("Selected: " .. KG2)
		a2 = KG2
	end)
	local a3
	spin:addDropdown("KG Select",kgs,function(KG3)
		print("Selected: " .. KG3)
		a3 = KG3
	end)
	local a4
	spin:addDropdown("KG Select",kgs,function(KG4)
		print("Selected: " .. KG4)
		a4 = KG4
	end)
	local a5
	spin:addDropdown("KG Select",kgs,function(KG5)
		print("Selected: " .. KG5)
		a5 = KG5
	end)
	spin:addButton("Start Spin KG",function()
		kgslot.ChildAdded:Connect(function(yes)
            if yes.Name == "dontspin" then
                wait(.1)
                yes:Destroy()
            end
		end)
    
		local spins = game.Players.LocalPlayer.statz.spins.Value
		local des = game.Players.LocalPlayer.statz.spins
        spawn(function()
            for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
            	if v:FindFirstChild("KG") then
                    local a = Instance.new("StringValue")
                    a.Name = v.Name
                    a.Parent = game.Players.LocalPlayer.statz.genkailevel
            	end
            end
        end)
        
		spawn(function()
		    while wait() do
		        if spins > 0 then
            		spins = game.Players.LocalPlayer.statz.spins.Value
            		kgvalue = kgslot.Value
            		print("Rolled: " .. kgvalue)
            		if kgvalue ~= a1 and kgvalue ~= a2 and kgvalue ~= a3 and kgvalue ~= a4 and kgvalue ~= a5 then
            		    kgvalue = kgslot.Value
            			game.Players.LocalPlayer.startevent:FireServer("spin", b)
            			wait(.2)
            			kgvalue = kgslot.Value
            		else
            		    print("You have got: " .. kgvalue)
            		end
                else
                    player.statz.spins:Destroy()
                    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
		        end
		    end
		end)
	end)

	spin:addButton("Reset Spin NOW",function()
        player.statz.spins:Destroy()
        game:GetService('TeleportService'):Teleport(game.PlaceId, player)	 
    end)
	
	local currentelement = inf:addSection("currentkg coming soon")
end

--Five Page
if game.PlaceId == menuplace then
local inf = scorpion:addPage("Element Spin", 5012544693)
local spin = inf:addSection("Infinity Spin")

	--main menu
	local element = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
		if v:FindFirstChild("ELEMENT") then
			table.insert(element, v.Name)
		end
	end
	
	local b
	local elot
	local evalue
	spin:addDropdown("ELEMENT SLOT",{"element1", "element2", "element3", "element4"},function(elem3nt)
		b = elem3nt
		eslot = game.Players.LocalPlayer.statz.main:FindFirstChild(b)
		evalue = eslot.Value
		print(eslot)
		print(evalue)
	end)
	local a1
	spin:addDropdown("Element Select",element,function(element1)
		print("Selected: " .. element1)
		a1 = element1
	end)
	local a2
	spin:addDropdown("Element Select",element,function(element2)
		print("Selected: " .. element2)
		a2 = element2
	end)
	local a3
	spin:addDropdown("Element Select",element,function(element3)
		print("Selected: " .. element3)
		a3 = element3
	end)
	local a4
	spin:addDropdown("Element Select",element,function(element4)
		print("Selected: " .. element4)
		a4 = element4
	end)
	local a5
	spin:addDropdown("Element Select",element,function(element5)
		print("Selected: " .. element5)
		a5 = element5
	end)
	spin:addButton("Start Spin Element",function()
		eslot.ChildAdded:Connect(function(yes)
            if yes.Name == "dontspin" then
                wait(.1)
                yes:Destroy()
            end
		end)
    
		local spins = game.Players.LocalPlayer.statz.spins.Value
		local des = game.Players.LocalPlayer.statz.spins
        spawn(function()
            for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
            	if v:FindFirstChild("ELEMENT") then
                    local a = Instance.new("StringValue")
                    a.Name = v.Name
                    a.Parent = game.Players.LocalPlayer.statz.genkailevel
            	end
            end
        end)
        
		spawn(function()
		    while wait() do
		        if spins > 0 then
            		spins = game.Players.LocalPlayer.statz.spins.Value
            		evalue = eslot.Value
            		print("Rolled: " .. evalue)
            		if evalue ~= a1 and evalue ~= a2 and evalue ~= a3 and evalue ~= a4 and evalue ~= a5 then
            		    evalue = eslot.Value
            			game.Players.LocalPlayer.startevent:FireServer("spin", b)
            			wait(.2)
            			evalue = eslot.Value
            		else
            		    print("You have got: " .. evalue)
            		end
                else
                    player.statz.spins:Destroy()
                    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
		        end
		    end
		end)
	end)

	spin:addButton("Reset Spin NOW",function()
        player.statz.spins:Destroy()
        game:GetService('TeleportService'):Teleport(game.PlaceId, player)	 
    end)
	
	--[[
	spin:addButton("baban",function()
		spin:updateButton("baban", "annen")
		
		spin:updateTextV2("Button","CurrentElement","Current Element: ",evalue)
		
		wait(3)
		spin:updateButton("annen", "baban")
		
		spin:updateTextV2("Button","CurrentElement","Current Element: ",evalue)
	end)
	
	spin:addText("CurrentElement","Current Element: ",evalue)
	
	spawn(function()
		while wait() do
		
		local playerslots1 = game.Players.LocalPlayer.statz.main.element1.Value
	    local playerslots2 = game.Players.LocalPlayer.statz.main.element2.Value
	    local playerslots3 = game.Players.LocalPlayer.statz.main.element3.Value
	    local playerslots4 = game.Players.LocalPlayer.statz.main.element4.Value
            	
            	evalue = eslot.Value
            	
            	if evalue ~= a1 and evalue ~= a2 and evalue ~= a3 and evalue ~= a4 and evalue ~= a5 then
            		evalue = eslot.Value
            		for _,g in pairs(game.CoreGui:GetDescendants()) do
                        if g.Name == "currentelement" then 
                            g.Container.Title.Text = "Current Elements1:"
			                 wait(5)
			                 g.Container.Title.Text = "Current Elements2:",playerslots1,playerslots2
                        end
                    end
            		wait(.2)
            		evalue = eslot.Value
            	else
            		print("You have got: " .. evalue)
             	end
		    end
		end)
	--]]
end


--Six page
local page5 = scorpion:addPage("Discord", 5012544693)
local Discord = page5:addSection("SlayerShop")

Discord:addButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/q8ppJ8D")
	scorpion:Notify("Scorpion Hub", "Link Copied!")
end)
    
-- Settings page
local settings = scorpion:addPage("Settings", 5012544693)
local colors = settings:addSection("Colors")
local setting = settings:addSection("Settings")
local ServerS = settings:addSection("Server")
local privateserver = player.PlayerGui.Main.private.Text
	
setting:addKeybind("Show/Hide Settings", Enum.KeyCode.Backquote, function()
print("Activated Keybind")
scorpion:toggle()
end, function()
print("Changed Keybind")
end)

setting:addButton("Destroy GUI",function()
    game.CoreGui["Scorpion Hub | SlayerViper#3097"]:Destroy() 
end)

ServerS:addButton("Rejoin Server",function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
end)

ServerS:addButton("Rejoin Private Server",function()
    player.startevent:FireServer("teleporttoprivate", privateserver)
end)

--[[
setting:addTextbox("Notification", "Default", function(value, focusLost)

	if focusLost then
		scorpion:Notify("Title", value)
	end
end)
--]]

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
scorpion:setTheme(theme, color3)
end)
end

-- load
scorpion:SelectPage(scorpion.pages[1], true) -- no default for more freedom
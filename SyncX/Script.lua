--[[
function C(W)
spawn(function ()
while getgenv().C do
for i, v in pairs(game:GetService("Workspace").Maps[W].Enemies:GetChildren())
do local args = {[1] = v.Name} 
game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer(unpack(args)) end wait() end end)
spawn(function ()
while getgenv().C do 
game:GetService("ReplicatedStorage").Remotes.RE_ClickPower:FireServer()
wait() 
end 
end)
end

function H(E)
    spawn(function ()
        while getgenv().H do
local args = {
[1] = "Hatch",
[2] = E,
[3] = {}
}
game:GetService("ReplicatedStorage").Remotes.RE_Draw:FireServer(unpack(args)) wait()
        end
    end)
end

local LastE = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == 'RE_TakeDamage' then
        LastE = Args[1]
end
	return namecall(self, ...) 
end)
]]
local cnfrm = false
local mt = getrawmetatable(game);
setreadonly(mt,false)
local oldNamecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "RE_TakeDamage" and tostring(method) == "FireServer" and cnfrm == true then
		      Args[2] = true
		    return self.FireServer(self, unpack(Args))
		end
                return oldNamecall(self, ...)
            end)

local chest = {"Draw001","Draw002","Draw003","Draw004","Draw005","Draw006","Draw007","Draw008","Draw009","Draw0010","Draw011","Draw012","Draw013","Draw014","Draw015","Draw016","Draw017","Draw018","Draw019","Draw020"}
local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local speaker = game.Players.LocalPlayer
local LocalPlayer = speaker.Character


local function Children(a,func)
for i, v in pairs(a:GetChildren()) do
    func(v)
end
end

local function ClickInterest(part)
firetouchinterest(part, LocalPlayer.PrimaryPart, 0)
wait(0.01)
firetouchinterest(part, LocalPlayer.PrimaryPart, 1)
end

local function TblString(a,str)
for i,v in next, a:GetChildren() do
      str(v)
    end
end

local function MakeHitbox(w)
TblString(workspace.Maps[w].Enemies,function(v)
    v.HumanoidRootPart.Size = Vector3.new(50,50,50)
    v.HumanoidRootPart.Transparency = 1
    v.HumanoidRootPart.CanCollide = false
 end)
end

local zone = {}
local workspace = game:GetService("Workspace")
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
local egg = {}
local chl = {}
local asshole = {}

OrionLib:AddTable(workspace.Maps,zone)
OrionLib:AddTable(workspace.Ninja.NPC,chl)
OrionLib:AddTable(Workspace[speaker].Pets,asshole)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

local S1 = T2:AddSection({
Name = "CHEST"
})

local S2 = T2:AddSection({
Name = "PET"
})

local T3 = Window:MakeTab({
Name = "Challenge",
Icon = "rbxassetid://",
PremiumOnly = false
})

local npcs = {}

--[[
for _,npc in pairs(game:GetService("Workspace").Maps:GetChildren()) do
    table.insert(npcs, npc.Name)
end
--]]
-- :FindFirstChild("")

local BatchSkills = false

function AttackEnemy()
game:GetService("ReplicatedStorage")["Remotes"]["RE_TakeDamage"]:FireServer(LastE,BatchSkills)
end
--[[
local Select1 = T1:AddDropdown({
Name = "Select world",
Default = zone[1],
Options = zone,
Callback = function(ass)
    _G.World = ass
end})

T1:AddButton({
  Name = "Refresh Selection",
  Callback = function()
      zone = {}
      Select1:Refresh({"Refreshing.."},true)
      wait(0.1)
      OrionLib:AddTable(workspace.Maps,zone)
      wait(0.1)
      Select1:Refresh(zone,true)
      Select1:Set(zone[1])
  end    
})
]]

T1:AddToggle({
Name = "Use Skills",
Default = false,
Callback = function(bool)
cnfrm = bool
end})

T1:AddToggle({
Name = "Farm Power",
Default = false,
Callback = function(bool)
    _G.Energy = bool
    while wait() do
        if _G.Energy == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_ClickPower:FireServer()
     end
end})

--[[T1:AddToggle({
Name = "Auto Attack Enemy [The last enemy you dealt damage to]",
Default = false,
Callback = function(bool)
    _G.Atk = bool
    while wait() do
        if _G.Atk == false then break end
           AttackEnemy()
     end
end})]]

T1:AddToggle({
Name = "Farm Win",
Default = false,
Callback = function(bool)
    _G.Win = bool
    while wait() do
        if _G.Win == false then break end
           --game:GetService("ReplicatedStorage").Remotes.RF_Winner:InvokeServer(_G.World)
            ClickInterest(workspace.Maps[_G.World].Chest.HitBox)
     end
end})

T1:AddToggle({
Name = "Auto Spin",
Default = false,
Callback = function(bool)
    _G.Spin = bool
    while wait() do
        if _G.Spin == false then break end
           game:GetService("ReplicatedStorage").Remotes.RF_Spin:InvokeServer()
     end
end})

T1:AddToggle({
Name = "Auto rebirth",
Default = false,
Callback = function(bool)
    _G.Re = bool
    while wait() do
        if _G.Re == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_Rebirth:FireServer()
     end
end})

T1:AddToggle({
Name = "Auto Claim Achievement",
Default = false,
Callback = function(bool)
    _G.Ac = bool
    while wait() do
        if _G.Ac == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve001")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve002")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve003")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve004")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve005")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve006")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve007")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve008")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve009")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve010")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve011")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve012")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve013")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve014")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve015")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve016")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve017")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve018")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve019")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve020")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve021")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve022")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve023")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve024")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve025")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve026")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve027")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve028")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve029")
           game:GetService("ReplicatedStorage").Remotes.RE_AddAchieve:FireServer("Achieve030")
     end
end})

T1:AddToggle({
Name = "Auto Claim Gifts",
Default = false,
Callback = function(bool)
_G._Gifts = bool
            while wait() do
                if _G._Gifts == false then break end
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift001")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift002")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift003")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift004")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift005")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift006")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift007")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift008")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift009")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift010")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift011")
                game:GetService("ReplicatedStorage")["Remotes"]["Re_ClaimOnline"]:FireServer("OnlineGift012")
            end
end})

T1:AddToggle({
Name = "Auto Claim Quest",
Default = false,
Callback = function(bool)
    _G.Qst = bool
    while wait() do
        if _G.Qst == false then break end
           game:GetService("ReplicatedStorage")["Remotes"]["Re_TaskClaimed"]:FireServer()
     end
end})

T1:AddToggle({
Name = "Auto Claim Candy",
Default = false,
Callback = function(bool)
    _G.Candys = bool
    while wait() do
        if _G.Candys == false then break end
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift001")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift002")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift003")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift004")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift005")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift006")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift007")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift008")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift009")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift010")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift011")
           game:GetService("ReplicatedStorage")["Remotes"]["Hollywood"]["Re_Online"]:FireServer("OnlineGift012")
     end
end})

--OrionLib:AddTable(workspace.Maps,zone)

--OrionLib:AddTable(game:GetService("ReplicatedStorage").Models.Eggs,egg)

Children(workspace.Maps,function(v)
        OrionLib:AddTable(v.Eggs,egg)
end)

local Select2 = S1:AddDropdown({
Name = "Select chest",
Default = egg[1],
Options = egg,
Callback = function(ass)
    _G.draw = ass
end})

S1:AddButton({
  Name = "Refresh Selection",
  Callback = function()
      egg = {}
      Select2:Refresh({"Refreshing.."},true)
      wait(0.1)
      Children(workspace.Maps,function(v)
        OrionLib:AddTable(v.Eggs,egg)
      end)
      wait(0.1)
      Select2:Refresh(egg,true)
      Select2:Set(egg[1])
  end    
})

S1:AddToggle({
Name = "Auto Hatch",
Default = false,
Callback = function(bool)
    _G.DrawOpen = bool
    while wait() do
      if _G.DrawOpen == false then break end
      game:GetService("ReplicatedStorage").Remotes.RE_Draw:FireServer("Hatch",_G.draw,{})
    end
end})

local Select4 = S2:AddDropdown({
Name = "Select Pet ID",
Default = asshole[1],
Options = asshole,
Callback = function(ass)
    _G._Fucking_Pets = ass
end})

S2:AddButton({
  Name = "Refresh Pet Selection",
  Callback = function()
      asshole = {}
      Select4:Refresh({"Refreshing.."},true)
      wait(0.1)
      OrionLib:AddTable(Workspace[speaker.Name].Pets,asshole)
      wait(0.1)
      Select4:Refresh(asshole,true)
      Select4:Set(asshole[1])
  end    
})

S2:AddButton({
Name = "FUSE [SHINY]",
Callback = function()
      game:GetService("ReplicatedStorage")["Remotes"]["RE_PetFuse"]:FireServer("Shiny",{_G._Fucking_Pets,_G._Fucking_Pets,_G._Fucking_Pets,_G._Fucking_Pets,_G._Fucking_Pets})
  end    
})

S2:AddToggle({
Name = "Auto Equip Best",
Default = false,
Callback = function(bool)
    _G.BPet = bool
    while wait() do
        if _G.BPet == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_EquipBest:FireServer(true)
     end
end})

local Select3 = T3:AddDropdown({
Name = "Select Challenger",
Default = chl[1],
Options = chl,
Callback = function(ass)
    _G.chler = ass
end})

T3:AddButton({
  Name = "Refresh Selection",
  Callback = function()
      chl = {}
      Select3:Refresh({"Refreshing.."},true)
      wait(0.1)
      OrionLib:AddTable(workspace.Ninja.NPC,chl)
      wait(0.1)
      Select3:Refresh(chl,true)
      Select3:Set(chl[1])
  end    
})

T3:AddToggle({
Name = "Use Skill",
Default = false,
Callback = function(bool)
 _G._ShitSkill = bool
end})

T3:AddToggle({
Name = "Auto Attack",
Default = false,
Callback = function(bool)
    _G.AtkChl = bool
    while wait() do
      if _G.AtkChl == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,_G.chler)
    end
end})

T3:AddToggle({
Name = "Auto Attack All",
Default = false,
Callback = function(bool)
    _G.AtkChl2 = bool
    while wait() do
      if _G.AtkChl2 == false then break end
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[1])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[2])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[3])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[4])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[5])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[6])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[7])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[8])
      game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeDamage"]:FireServer(_G._ShitSkill,chl[9])
    end
end})

T3:AddToggle({
Name = "Auto Claim Ticket Challenge",
Default = false,
Callback = function(bool)
    _G.CTK = bool
    while wait() do
        if _G.CTK == false then break end
           game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ClaimTicket"]:FireServer()
     end
end})

T3:AddToggle({
Name = "Auto Start Challenge",
Default = false,
Callback = function(bool)
    _G.SC = bool
    while wait() do
        if _G.SC == false then break end
           game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_ChallengeRequest"]:FireServer()
     end
end})

T3:AddToggle({
Name = "Auto Hatch Skill",
Default = false,
Callback = function(bool)
    _G.SK = bool
    while wait() do
        if _G.SK == false then break end
           game:GetService("ReplicatedStorage")["Remotes"]["Ninja"]["Re_HatchSkill"]:FireServer("SkillDraw001")
     end
end})


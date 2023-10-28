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
end]]
local chest = {"Draw001","Draw002","Draw003","Draw004","Draw005","Draw006","Draw007","Draw008","Draw009","Draw0010","Draw011","Draw012","Draw013","Draw014","Draw015","Draw016","Draw017","Draw018","Draw019","Draw020"}

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local function Children(a,func)
for i, v in pairs(a:GetChildren()) do
    func(v)
end
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
local test = {}

OrionLib:AddTable(workspace.Maps,zone)

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

local npcs = {}

--[[
for _,npc in pairs(game:GetService("Workspace").Maps:GetChildren()) do
    table.insert(npcs, npc.Name)
end
--]]
-- :FindFirstChild("")

function AttackEnemy(w)
Children(workspace.Maps[w].Enemies,function(v)
game:GetService("ReplicatedStorage")["Remotes"]["RE_TakeDamage"]:FireServer(v.Name,false)
end)
end

local Select1 = T1:AddDropdown({
Name = "Select world",
Default = "World001",
Options = zone,
Callback = function(ass)
    _G.World = ass
end})

S2:AddButton({
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

T1:AddToggle({
Name = "Aura",
Default = false,
Callback = function(bool)
    _G.Atk = bool
    while wait() do
        if _G.Atk == false then break end
           --AttackEnemy(_G.World)
            MakeHitbox(_G.World)
     end
end})

T1:AddToggle({
Name = "Farm Win",
Default = false,
Callback = function(bool)
    _G.Win = bool
    while wait() do
        if _G.Win == false then break end
           --game:GetService("ReplicatedStorage").Remotes.RF_Winner:InvokeServer(_G.World)
            OrionLib:Teleport(workspace.Maps[_G.World].Chest.HitBox)
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

T2:AddDropdown({
Name = "Select chest",
Default = "Draw001",
Options = chest,
Callback = function(ass)
    _G.draw = ass
end})

T2:AddToggle({
Name = "Auto Hatch",
Default = false,
Callback = function(bool)
    _G.DrawOpen = bool
    while wait() do
      if _G.DrawOpen == false then break end
      game:GetService("ReplicatedStorage").Remotes.RE_Draw:FireServer("Hatch",_G.draw,{})
    end
end})

T2:AddToggle({
Name = "Auto Equip Best",
Default = false,
Callback = function(bool)
    _G.BPet = bool
    while wait() do
        if _G.BPet == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_EquipBest:FireServer(true)
     end
end})

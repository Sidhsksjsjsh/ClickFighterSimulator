local library = loadstring(game:HttpGet("https://pastebin.com/raw/Uub92rmN"))()


local Window = library:AddWindow("Sync X - Cheating Tool",
    {
        main_color = Color3.fromRGB(170, 0, 0),
        min_size = Vector2.new(373, 433),
        toggle_key = Enum.KeyCode.RightShift,
    })

local T1 = Window:AddTab("Farm")
local T2 = Window:AddTab("Draw")

local npcs = {}

--[[
for _,npc in pairs(game:GetService("Workspace").Maps:GetChildren()) do
    table.insert(npcs, npc.Name)
end
--]]
-- :FindFirstChild("")

function tp(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos.CFrame)
end

function AttackEnemy(world)
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc001")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc002")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc003")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc004")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc005")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc006")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc007")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc008")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc009")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc010")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc011")
    game:GetService("ReplicatedStorage").Remotes.RE_TakeDamage:FireServer("Npc012")
end

local dimension = T1:AddDropdown("Select World", function(object)
    _G.World = object
end)

dimension:Add("World001")
dimension:Add("World002")
dimension:Add("World003")
dimension:Add("World004")

T1:AddSwitch("Auto Farm Power", function(bool)
    _G.Energy = bool
    while wait() do
        if _G.Energy == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_ClickPower:FireServer()
     end
end)

T1:AddSwitch("Auto Attack", function(bool)
    _G.Atk = bool
    while wait() do
        if _G.Atk == false then break end
           AttackEnemy(_G.World)
           tp(game:GetService("Workspace").Maps[_G.World].Chest.HitBox)
     end
end)

T1:AddSwitch("Auto Farm Win", function(bool)
    _G.Win = bool
    while wait() do
        if _G.Win == false then break end
           game:GetService("ReplicatedStorage").Remotes.RF_Winner:InvokeServer(_G.World)
     end
end)

T1:AddSwitch("Auto Spin", function(bool)
    _G.Spin = bool
    while wait() do
        if _G.Spin == false then break end
           game:GetService("ReplicatedStorage").Remotes.RF_Spin:InvokeServer()
     end
end)

T1:AddSwitch("Auto Rebirth", function(bool)
    _G.Re = bool
    while wait() do
        if _G.Re == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_Rebirth:FireServer()
     end
end)

T1:AddSwitch("Auto Claim Achievement", function(bool)
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
end)

local draw = T2:AddDropdown("Select Chest", function(object)
    _G.draw = object
end)

draw:Add("Draw001")
draw:Add("Draw002")
draw:Add("Draw003")
draw:Add("Draw004")
draw:Add("Draw005")

T2:AddSwitch("Auto draw", function(bool)
    _G.DrawOpen = bool
    while wait() do
      if _G.DrawOpen == false then break end
      local args = {
            [1] = "Hatch",
            [2] = _G.draw,
            [3] = {}
      }

       game:GetService("ReplicatedStorage").Remotes.RE_Draw:FireServer(unpack(args))
    end
end)

T2:AddSwitch("Auto Equip best", function(bool)
    _G.BPet = bool
    while wait() do
        if _G.BPet == false then break end
           game:GetService("ReplicatedStorage").Remotes.RE_EquipBest:FireServer(true)
     end
end)

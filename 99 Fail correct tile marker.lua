local m = game.Players.LocalPlayer:GetMouse()
local uis = game:GetService("UserInputService")
local bruh = {}

m.Button1Down:Connect(function()
    if (uis:IsKeyDown(Enum.KeyCode.LeftControl) and string.find(m.Target.Name, "Tile")) then
        m.Target.BrickColor = BrickColor.new("Forest green")
        table.insert(bruh, m.Target)
    elseif uis:IsKeyDown(Enum.KeyCode.RightControl) then
        for _,v in next, bruh do
            v.Color = Color3.fromRGB(198, 237, 255)
            v = nil
        end
    elseif uis:IsKeyDown(Enum.KeyCode.Backspace) then
        m.Target.Color = Color3.fromRGB(198, 237, 255)
    end
end)
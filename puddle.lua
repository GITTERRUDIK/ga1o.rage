-- LocalScript (place in StarterPlayerScripts)

local Lighting = game:GetService("Lighting")

-- Create a ColorCorrectionEffect
local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = Lighting
colorCorrection.Enabled = true

-- Set properties to invert colors
colorCorrection.Contrast = -1 -- Inverts colors
colorCorrection.Brightness = 0
colorCorrection.Saturation = 0
colorCorrection.TintColor = Color3.fromRGB(255, 255, 255) -- Neutral tint

-- LocalScript (place in StarterPlayerScripts)

local Lighting = game:GetService("Lighting")

-- Create a ColorCorrectionEffect
local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Parent = Lighting
colorCorrection.Enabled = true

-- Set the ColorCorrectionEffect to invert colors
colorCorrection.Contrast = 0
colorCorrection.Brightness = 0
colorCorrection.Saturation = 0
colorCorrection.TintColor = Color3.fromRGB(255, 255, 255) -- Neutral tint

-- Apply an inverted color curve using a custom ramp
colorCorrection.Color = Color3.fromRGB(255, 255, 255) -- Base color
colorCorrection.Contrast = -1 -- Inverts the colors

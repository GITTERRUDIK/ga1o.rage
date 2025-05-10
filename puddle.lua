local player = game:GetService("Players").LocalPlayer
local humanoid = player:WaitForChild("Humanoid")
local runService = game:GetService("RunService")

local lastPuddleTime = 0
local puddleInterval = 0.3 -- seconds between puddles
local puddleLifetime = 3 -- how long a puddle lasts

-- Create puddle part
local function createPuddle(position)
	local puddle = Instance.new("Part")
	puddle.Size = Vector3.new(2, 0.1, 2)
	puddle.Anchored = true
	puddle.CanCollide = false
	puddle.Position = position - Vector3.new(0, 2.5, 0) -- under foot
	puddle.Transparency = 0.3
	puddle.Material = Enum.Material.SmoothPlastic
	puddle.Color = Color3.fromRGB(60, 60, 255)
	puddle.Name = "Puddle"

	-- Optional: add a decal or texture here if desired

	puddle.Parent = workspace

	-- Fade out
	coroutine.wrap(function()
		local fadeTime = 1
		wait(puddleLifetime - fadeTime)
		for i = 1, 10 do
			puddle.Transparency = puddle.Transparency + 0.07
			wait(fadeTime / 10)
		end
		puddle:Destroy()
	end)()
end

-- Detect movement and drop puddles
runService.RenderStepped:Connect(function()
	if humanoid.MoveDirection.Magnitude > 0.1 then
		if tick() - lastPuddleTime >= puddleInterval then
			local rootPart = character:FindFirstChild("HumanoidRootPart")
			if rootPart then
				createPuddle(rootPart.Position)
				lastPuddleTime = tick()
			end
		end
	end
end)

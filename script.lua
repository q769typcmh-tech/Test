--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

pcall(function()
	if not game:IsLoaded() then
		game.Loaded:Wait();
	end;
end);
task.wait(.35);
local G = getgenv or function()
		return _G;
	end;
local B = game:GetService("Players");
local u = game:GetService("UserInputService");
local o = game:GetService("RunService");
local w = game:GetService("Lighting");
local h = game:GetService("Stats");
local c = game:GetService("HttpService");
local X = game:GetService("ReplicatedStorage");
local C = game:GetService("VirtualInputManager");
local i = workspace.CurrentCamera;
local z = B.LocalPlayer or B.PlayerAdded:Wait();
local N = z:WaitForChild("PlayerGui", 60);
if not N then
	warn("[Moon] PlayerGui timeout");
	return;
end;
local P = z:GetMouse();
pcall(function()
	local G = N:FindFirstChild("MoonHubUI");
	if G then
		G:Destroy();
	end;
	local B = N:FindFirstChild("MoonCursorUI");
	if B then
		B:Destroy();
	end;
end);
task.wait(.05);
local function L(G, B)
	pcall(function()
		if writefile then
			writefile(G, B);
		end;
	end);
end;
local function r(G)
	local B, u = pcall(function()
			if isfile and (isfile(G) and readfile) then
				return readfile(G);
			end;
		end);
	return B and u or nil;
end;
pcall(function()
	if makefolder then
		makefolder("MoonHub");
		makefolder("MoonHub/Configs");
	end;
end);
(G()).MoonHubState = (G()).MoonHubState or {};
local f = (G()).MoonHubState;
local s = {
		Aimbot = false,
		AimKey = "MB2",
		AimMode = "Hold",
		AimFOV = 150,
		AimSmooth = .95,
		ShowFOV = false,
		WallCheck = true,
		TeamCheck = true,
		Prediction = true,
		PredictAmount = .12,
		Triggerbot = false,
		TriggerFOV = 55,
		TriggerDelay = .06,
		CustomFOV = false,
		FOVValue = 90,
		NoRecoil = true,
		Speed = false,
		SpeedValue = 24,
		Noclip = false,
		AntiBow = true,
		StreamProof = false,
		SpoofName = "Player",
		ShowVerified = true,
		StaffDetect = false,
		StaffLeave = false,
		ESP = false,
		ShowBoxes = true,
		BoxStyle = "Corner",
		ShowNames = true,
		ShowDistance = true,
		ShowHealth = true,
		ShowHeadDot = true,
		RGBESP = false,
		ESPColorR = 170,
		ESPColorG = 0,
		ESPColorB = 255,
		Hitbox = false,
		HitboxPart = "Head",
		HitboxSize = 3,
		Radar = false,
		RadarSize = 140,
		RadarRange = 200,
		CursorName = "Off",
		CursorSize = 32,
		DeviceSpoof = false,
		DeviceMode = "Console",
		DeviceSpoofDelay = 1.5,
		ShowPerf = true,
		Potato = false,
		MobileAim = false,
		MobileSmooth = .9,
		MobileFOV = 160,
		MobileShowFOV = true,
		ConfigName = "default",
	};
for G, B in pairs(s) do
	if f[G] == nil then
		f[G] = B;
	end;
end;
if type(f.CursorSize) ~= "number" then
	f.CursorSize = 32;
end;
if type(f.AimSmooth) ~= "number" then
	f.AimSmooth = .95;
end;
if type(f.FOVValue) ~= "number" then
	f.FOVValue = 90;
end;
if type(f.TriggerDelay) ~= "number" then
	f.TriggerDelay = .06;
end;
if type(f.TriggerFOV) ~= "number" then
	f.TriggerFOV = 55;
end;
if f.HitboxPart ~= "Head" and f.HitboxPart ~= "Torso" then
	f.HitboxPart = "Head";
end;
if f.NoRecoil == nil then
	f.NoRecoil = true;
end;
local function n()
	local G = (tostring(f.ConfigName or "default")):gsub("[^%w%-%_]", "");
	if G == "" then
		G = "default";
	end;
	f.ConfigName = G;
	L("MoonHub/Configs/" .. (G .. ".json"), c:JSONEncode(f));
	L("MoonHub/Jailbird.json", c:JSONEncode(f));
end;
local function p()
	local G = (tostring(f.ConfigName or "default")):gsub("[^%w%-%_]", "");
	local B = r("MoonHub/Configs/" .. (G .. ".json")) or r("MoonHub/Jailbird.json");
	if B then
		pcall(function()
			local G = c:JSONDecode(B);
			if type(G) == "table" then
				for G, B in pairs(G) do
					f[G] = B;
				end;
			end;
		end);
	end;
	if f.HitboxPart ~= "Head" and f.HitboxPart ~= "Torso" then
		f.HitboxPart = "Head";
	end;
	if f.NoRecoil == nil then
		f.NoRecoil = true;
	end;
end;
pcall(p);
local Z = false;
pcall(function()
	if Drawing and Drawing.new then
		local G = Drawing.new("Text");
		G.Visible = false;
		G:Remove();
		Z = true;
	end;
end);
local D = u.TouchEnabled and not u.KeyboardEnabled;
pcall(function()
	if u.TouchEnabled then
		D = true;
	end;
end);
local Q = Color3.fromRGB(138, 99, 255);
local O = Color3.fromRGB(12, 12, 16);
local H = Color3.fromRGB(18, 18, 24);
local V = Color3.fromRGB(20, 20, 28);
local W = Color3.fromRGB(235, 235, 245);
local g = Color3.fromRGB(160, 160, 180);
local M = Enum.Font.Gotham;
local function U()
	if f.RGBESP then
		return Color3.fromHSV(((tick() * .4)) % 1, 1, 1);
	end;
	return Color3.fromRGB(math.clamp(tonumber(f.ESPColorR) or 170, 0, 255), math.clamp(tonumber(f.ESPColorG) or 0, 0, 255), math.clamp(tonumber(f.ESPColorB) or 255, 0, 255));
end;
local function b()
	pcall(function()
		u.MouseBehavior = Enum.MouseBehavior.Default;
		u.MouseIconEnabled = true;
	end);
end;
local k = {
		{ Name = "Off", Id = nil },
		{ Name = "Game Crosshair", Id = "GAME" },
		{ Name = "Star Wars", Id = "5462831" },
		{ Name = "Snowflake", Id = "11780968239" },
		{ Name = "Red Dot", Id = "412284862" },
		{ Name = "Diamond", Id = "61210994" },
		{ Name = "Hello Kitty", Id = "10973237327" },
		{ Name = "Eye", Id = "12534101433" },
	};
local K = {};
for G, B in ipairs(k) do
	K[G] = B.Name;
end;
local v = Instance.new("ScreenGui");
v.Name = "MoonCursorUI";
v.ResetOnSpawn = false;
v.IgnoreGuiInset = true;
v.DisplayOrder = 10000;
v.Parent = N;
local a = Instance.new("ImageLabel");
a.BackgroundTransparency = 1;
a.AnchorPoint = Vector2.new(.5, .5);
a.Size = UDim2.new(0, 32, 0, 32);
a.Visible = false;
a.ZIndex = 100;
a.Parent = v;
local function S(G)
	local B = N:FindFirstChild("Crosshair");
	if not B then
		return;
	end;
	pcall(function()
		if B:IsA("ScreenGui") then
			B.Enabled = G;
		end;
		B.Visible = G;
		for B, u in ipairs(B:GetDescendants()) do
			if u:IsA("GuiObject") then
				u.Visible = G;
			end;
		end;
	end);
end;
local function l(G)
	G = G or f.CursorName or "Off";
	f.CursorName = G;
	local B = k[1];
	for u, o in ipairs(k) do
		if o.Name == G then
			B = o;
			break;
		end;
	end;
	S(false);
	a.Visible = false;
	local o = math.clamp(tonumber(f.CursorSize) or 32, 8, 128);
	a.Size = UDim2.new(0, o, 0, o);
	if not B.Id or B.Name == "Off" then
		pcall(function()
			P.Icon = "";
			u.MouseIconEnabled = true;
		end);
		return;
	end;
	if B.Id == "GAME" then
		S(true);
		pcall(function()
			P.Icon = "rbxassetid://0";
			u.MouseIconEnabled = true;
		end);
		return;
	end;
	pcall(function()
		u.MouseIconEnabled = false;
		P.Icon = "rbxassetid://0";
		a.Image = "rbxassetid://" .. tostring(B.Id);
		a.Visible = true;
	end);
end;
local R = 70;
pcall(function()
	R = i.FieldOfView;
end);
local function t()
	if not f.CustomFOV then
		return;
	end;
	local G = math.clamp(tonumber(f.FOVValue) or 90, 40, 120);
	pcall(function()
		if math.abs(i.FieldOfView - G) > .5 then
			i.FieldOfView = G;
		end;
	end);
end;
o.RenderStepped:Connect(function()
	if f.CustomFOV then
		t();
	end;
end);
local function T(G)
	if not G then
		return nil;
	end;
	local B, u = pcall(function()
			return G.Character;
		end);
	return B and u or nil;
end;
local function x(G)
	local B = T(G);
	if not B then
		return false;
	end;
	local u = B:FindFirstChildOfClass("Humanoid");
	return u ~= nil and u.Health > 0;
end;
local function J(G)
	if not G or G == z then
		return false;
	end;
	if not f.TeamCheck then
		return true;
	end;
	local B, u = z.Team, G.Team;
	if B and u then
		return B ~= u;
	end;
	return true;
end;
local m = {
		"box",
		"crate",
		"barrel",
		"dumpster",
		"trash",
		"container",
		"door",
		"window",
		"gate",
		"fence",
		"pillar",
		"wall",
		"car",
		"truck",
		"van",
	};
local function e(G)
	if not G or not G:IsA("BasePart") then
		return false;
	end;
	local B = string.lower(G.Name or "");
	local u = string.lower(G:GetFullName() or "");
	for G = 1, #m, 1 do
		if string.find(B, m[G], 1, true) or string.find(u, m[G], 1, true) then
			return true;
		end;
	end;
	return false;
end;
local function A(G)
	if not G or not G:IsA("BasePart") then
		return true;
	end;
	if e(G) then
		return false;
	end;
	if G.CanCollide == false and G.Transparency >= .3 then
		return true;
	end;
	if G.Transparency >= .75 then
		return true;
	end;
	if string.find(string.lower(G.Name or ""), "glass", 1, true) then
		return true;
	end;
	return false;
end;
local function q(G)
	if not f.WallCheck then
		return true;
	end;
	local B = T(G);
	local u = B and B:FindFirstChild("Head");
	if not u then
		return false;
	end;
	local o = T(z);
	local w = i.CFrame.Position + i.CFrame.LookVector * 1.2;
	local h = u.Position;
	local c = h - w;
	local X = c.Magnitude;
	if X < 2 then
		return true;
	end;
	local C = { B, i };
	if o then
		table.insert(C, o);
	end;
	local N = RaycastParams.new();
	N.FilterType = Enum.RaycastFilterType.Exclude;
	N.FilterDescendantsInstances = C;
	N.IgnoreWater = true;
	local P, L, r = 0, w, c.Unit;
	for G = 1, 8, 1 do
		local u = X - P;
		if u <= .1 then
			return true;
		end;
		local o = workspace:Raycast(L, r * u, N);
		if not o then
			return true;
		end;
		if o.Instance and o.Instance:IsDescendantOf(B) then
			return true;
		end;
		if A(o.Instance) then
			table.insert(C, o.Instance);
			N.FilterDescendantsInstances = C;
			local G = ((o.Position - L)).Magnitude;
			L = o.Position + r * .12;
			P = (P + G) + .12;
		else
			return false;
		end;
	end;
	return false;
end;
local function j(G, B)
	if not f.Prediction or not G then
		return G.Position;
	end;
	local u = B and ((B:FindFirstChild("HumanoidRootPart") or B:FindFirstChild("Torso")));
	local o = Vector3.zero;
	if u then
		pcall(function()
			o = u.AssemblyLinearVelocity;
		end);
	end;
	return G.Position + o * ((tonumber(f.PredictAmount) or .12));
end;
local function y(G, u)
	local o, w, h = nil, nil, G;
	local c = i.ViewportSize / 2;
	for G, B in ipairs(B:GetPlayers()) do
		if B ~= z and (J(B) and x(B)) then
			local G = T(B);
			local X = G and G:FindFirstChild("Head");
			if X then
				local C = j(X, G);
				local z, N = i:WorldToViewportPoint(C);
				if N and z.Z > 0 then
					local G = ((Vector2.new(z.X, z.Y) - c)).Magnitude;
					if G < h and (((not u) or q(B))) then
						h = G;
						o = B;
						w = C;
					end;
				end;
			end;
		end;
	end;
	return o, w;
end;
local Y = {};
local function F(G)
	return G and ((G:FindFirstChild("UpperTorso") or G:FindFirstChild("Torso")));
end;
local function E(G)
	if not G then
		return;
	end;
	local B = Y[G];
	if B then
		pcall(function()
			G.Size = B;
		end);
		Y[G] = nil;
	end;
end;
local function I()
	for G, B in pairs(Y) do
		E(G);
	end;
	Y = {};
end;
local function d(G, B)
	if not G or not G:IsA("BasePart") then
		return;
	end;
	if Y[G] == nil then
		Y[G] = G.Size;
	end;
	local u = math.clamp(tonumber(B) or 3, 1.2, 12);
	pcall(function()
		G.Size = Vector3.new(u, u, u);
		G.Massless = true;
		G.CanCollide = false;
	end);
end;
local function GQ()
	if not f.Hitbox then
		I();
		return;
	end;
	local G = f.HitboxPart;
	local u = tonumber(f.HitboxSize) or 3;
	for B, o in ipairs(B:GetPlayers()) do
		if o ~= z and (J(o) and x(o)) then
			local B = T(o);
			if B then
				local o = B:FindFirstChild("Head");
				local w = F(B);
				if G == "Head" then
					if o then
						d(o, u);
					end;
					if w then
						E(w);
					end;
				else
					if w then
						d(w, u);
					end;
					if o then
						E(o);
					end;
				end;
			end;
		end;
	end;
end;
local BQ = false;
u.InputBegan:Connect(function(G, B)
	if not B and G.UserInputType == Enum.UserInputType.MouseButton1 then
		BQ = true;
	end;
end);
u.InputEnded:Connect(function(G)
	if G.UserInputType == Enum.UserInputType.MouseButton1 then
		BQ = false;
	end;
end);
local function uQ(G)
	G = string.lower(G);
	return string.find(G, "recoil", 1, true) or string.find(G, "viewkick", 1, true) or string.find(G, "camerakick", 1, true) or string.find(G, "camerashake", 1, true) or string.find(G, "aimpunch", 1, true) or string.find(G, "gunrecoil", 1, true);
end;
local function oQ(G)
	G = string.lower(G);
	return string.find(G, "position", 1, true) or string.find(G, "velocity", 1, true) or string.find(G, "cframe", 1, true) or string.find(G, "walk", 1, true) or string.find(G, "move", 1, true) or string.find(G, "sit", 1, true) or string.find(G, "prone", 1, true) or string.find(G, "humanoid", 1, true) or string.find(G, "root", 1, true) or string.find(G, "jump", 1, true);
end;
local function wQ()
	if type(getgc) ~= "function" then
		return;
	end;
	for G, B in ipairs(getgc(true)) do
		if type(B) == "table" then
			for G, u in pairs(B) do
				local o = tostring(G);
				if uQ(o) and not oQ(o) then
					if type(u) == "number" and u ~= 0 then
						B[G] = 0;
					elseif typeof(u) == "Vector3" and (u.Magnitude > 0 and u.Magnitude < 20) then
						B[G] = Vector3.zero;
					end;
				end;
			end;
		end;
	end;
end;
task.spawn(function()
	while true do
		if f.NoRecoil and BQ then
			local G = T(z);
			if G and G:FindFirstChildOfClass("Tool") then
				pcall(wQ);
				task.wait(.08);
			else
				task.wait(.2);
			end;
		else
			task.wait(.25);
		end;
	end;
end);
o.RenderStepped:Connect(function()
	if not f.NoRecoil or not BQ then
		return;
	end;
	local G = T(z);
	local B = G and G:FindFirstChildOfClass("Humanoid");
	if B and B.CameraOffset.Magnitude > .01 then
		pcall(function()
			B.CameraOffset = Vector3.zero;
		end);
	end;
end);
local hQ = 0;
local function cQ()
	local G = T(z);
	if not G then
		return nil;
	end;
	return G:FindFirstChildOfClass("Tool");
end;
local function XQ()
	local G = cQ();
	if G then
		pcall(function()
			G:Activate();
		end);
		task.defer(function()
			pcall(function()
				if G and G.Parent then
					G:Activate();
				end;
			end);
		end);
	end;
	if not u.TouchEnabled or u.MouseEnabled then
		pcall(function()
			local G = i.ViewportSize;
			local B, u = G.X / 2, G.Y / 2;
			C:SendMouseButtonEvent(B, u, 0, true, game, 1);
			task.wait(.03);
			C:SendMouseButtonEvent(B, u, 0, false, game, 1);
		end);
	end;
	if u.TouchEnabled then
		pcall(function()
			local G = i.ViewportSize;
			local B, u = G.X * .85, G.Y * .75;
			C:SendMouseButtonEvent(B, u, 0, true, game, 1);
			task.wait(.04);
			C:SendMouseButtonEvent(B, u, 0, false, game, 1);
			C:SendMouseButtonEvent(G.X / 2, G.Y / 2, 0, true, game, 1);
			task.wait(.03);
			C:SendMouseButtonEvent(G.X / 2, G.Y / 2, 0, false, game, 1);
		end);
	end;
end;
local function CQ()
	if not f.Triggerbot then
		return;
	end;
	if not cQ() then
		return;
	end;
	local G = tonumber(f.TriggerDelay) or .06;
	if D then
		G = math.max(G, .05);
	end;
	if tick() - hQ < G then
		return;
	end;
	local B = tonumber(f.TriggerFOV) or 55;
	if D then
		B = math.max(B, 50);
	end;
	local u = y(B, f.WallCheck);
	if u then
		hQ = tick();
		XQ();
	end;
end;
local iQ, zQ = {}, {};
local function NQ(G)
	if not Z then
		return nil;
	end;
	local B, u = pcall(function()
			return Drawing.new(G);
		end);
	return B and u or nil;
end;
local function PQ(G)
	local B = iQ[G];
	if B then
		for G, B in pairs(B) do
			if type(B) == "table" then
				for G, B in pairs(B) do
					pcall(function()
						if B and B.Remove then
							B:Remove();
						end;
					end);
				end;
			else
				pcall(function()
					if B and B.Remove then
						B:Remove();
					end;
				end);
			end;
		end;
		iQ[G] = nil;
	end;
	if zQ[G] then
		pcall(function()
			zQ[G]:Destroy();
		end);
		zQ[G] = nil;
	end;
end;
local function LQ()
	for G, B in pairs(iQ) do
		PQ(G);
	end;
	for G, B in pairs(zQ) do
		PQ(G);
	end;
	iQ, zQ = {}, {};
end;
local function rQ(G)
	if iQ[G] then
		return iQ[G];
	end;
	local B = NQ("Square");
	if not B then
		return nil;
	end;
	B.Thickness = 1.5;
	B.Filled = false;
	B.Visible = false;
	local u = {};
	for G = 1, 8, 1 do
		local B = NQ("Line");
		if B then
			B.Thickness = 1.5;
			B.Visible = false;
			u[G] = B;
		end;
	end;
	local o = NQ("Text");
	if o then
		o.Size = 14;
		o.Center = true;
		o.Outline = true;
		o.Font = 2;
		o.Visible = false;
	end;
	local w = NQ("Text");
	if w then
		w.Size = 12;
		w.Center = true;
		w.Outline = true;
		w.Font = 2;
		w.Visible = false;
	end;
	local h = NQ("Square");
	if h then
		h.Filled = false;
		h.Visible = false;
	end;
	local c = NQ("Square");
	if c then
		c.Filled = true;
		c.Visible = false;
	end;
	local X = NQ("Circle");
	if X then
		X.NumSides = 16;
		X.Filled = true;
		X.Visible = false;
	end;
	iQ[G] = {
			Box = B,
			Lines = u,
			Name = o,
			Dist = w,
			HB = h,
			HF = c,
			Dot = X,
		};
	return iQ[G];
end;
local function fQ(G)
	if zQ[G] and zQ[G].Parent then
		return;
	end;
	if zQ[G] then
		pcall(function()
			zQ[G]:Destroy();
		end);
	end;
	local B = T(G);
	if not B then
		return;
	end;
	local u = Instance.new("Highlight");
	u.FillColor = U();
	u.OutlineColor = Color3.new(1, 1, 1);
	u.FillTransparency = .55;
	u.Adornee = B;
	u.Parent = B;
	zQ[G] = u;
end;
local function sQ(G)
	if not G then
		return;
	end;
	if G.Box then
		G.Box.Visible = false;
	end;
	if G.Name then
		G.Name.Visible = false;
	end;
	if G.Dist then
		G.Dist.Visible = false;
	end;
	if G.HB then
		G.HB.Visible = false;
	end;
	if G.HF then
		G.HF.Visible = false;
	end;
	if G.Dot then
		G.Dot.Visible = false;
	end;
	if G.Lines then
		for B = 1, #G.Lines, 1 do
			if G.Lines[B] then
				G.Lines[B].Visible = false;
			end;
		end;
	end;
end;
local function nQ()
	if not f.ESP then
		LQ();
		return;
	end;
	local G = U();
	local u = T(z) and (T(z)):FindFirstChild("HumanoidRootPart");
	local o = {};
	for B, w in ipairs(B:GetPlayers()) do
		if w ~= z and (J(w) and x(w)) then
			o[w] = true;
			local B = T(w);
			local h = B and ((B:FindFirstChild("HumanoidRootPart") or B:FindFirstChild("Torso")));
			local c = B and B:FindFirstChild("Head");
			local X = B and B:FindFirstChildOfClass("Humanoid");
			if not h or not c then
				PQ(w);
			elseif Z then
				local B = rQ(w);
				if B and B.Box then
					local o, C = i:WorldToViewportPoint(h.Position);
					if not C or o.Z < 0 then
						sQ(B);
					else
						local C = i:WorldToViewportPoint(c.Position + Vector3.new(0, 1.1, 0));
						local z = i:WorldToViewportPoint(h.Position - Vector3.new(0, 2.8, 0));
						local N = math.max(math.abs(z.Y - C.Y), 8);
						local P = math.clamp(N / 1.85, 8, 120);
						local L = Vector2.new(P, N);
						local r = Vector2.new(o.X - P / 2, C.Y);
						local s = math.clamp(P * .25, 4, 12);
						local n = f.BoxStyle or "Corner";
						if f.ShowBoxes and ((n == "Full" or n == "Both")) then
							B.Box.Size = L;
							B.Box.Position = r;
							B.Box.Color = G;
							B.Box.Visible = true;
						else
							B.Box.Visible = false;
						end;
						if f.ShowBoxes and (((n == "Corner" or n == "Both")) and (B.Lines and B.Lines[1])) then
							local u = B.Lines;
							u[1].From, u[1].To = r, Vector2.new(r.X, r.Y + s);
							u[2].From, u[2].To = r, Vector2.new(r.X + s, r.Y);
							u[3].From, u[3].To = Vector2.new(r.X + L.X, r.Y), Vector2.new(r.X + L.X, r.Y + s);
							u[4].From, u[4].To = Vector2.new(r.X + L.X, r.Y), Vector2.new((r.X + L.X) - s, r.Y);
							u[5].From, u[5].To = Vector2.new(r.X, r.Y + L.Y), Vector2.new(r.X, (r.Y + L.Y) - s);
							u[6].From, u[6].To = Vector2.new(r.X, r.Y + L.Y), Vector2.new(r.X + s, r.Y + L.Y);
							u[7].From, u[7].To = Vector2.new(r.X + L.X, r.Y + L.Y), Vector2.new(r.X + L.X, (r.Y + L.Y) - s);
							u[8].From, u[8].To = Vector2.new(r.X + L.X, r.Y + L.Y), Vector2.new((r.X + L.X) - s, r.Y + L.Y);
							for B = 1, 8, 1 do
								if u[B] then
									u[B].Color = G;
									u[B].Visible = true;
								end;
							end;
						elseif B.Lines then
							for G = 1, #B.Lines, 1 do
								if B.Lines[G] then
									B.Lines[G].Visible = false;
								end;
							end;
						end;
						if f.ShowNames and B.Name then
							B.Name.Text = w.DisplayName;
							B.Name.Position = Vector2.new(o.X, r.Y - 14);
							B.Name.Color = G;
							B.Name.Visible = true;
						elseif B.Name then
							B.Name.Visible = false;
						end;
						if f.ShowDistance and (B.Dist and u) then
							B.Dist.Text = math.floor(((h.Position - u.Position)).Magnitude) .. "m";
							B.Dist.Position = Vector2.new(o.X, (r.Y + L.Y) + 2);
							B.Dist.Visible = true;
						elseif B.Dist then
							B.Dist.Visible = false;
						end;
						if f.ShowHealth and (X and (B.HB and B.HF)) then
							local G = math.clamp(X.Health / math.max(X.MaxHealth, 1), 0, 1);
							B.HB.Size = Vector2.new(3, L.Y);
							B.HB.Position = Vector2.new(r.X - 6, r.Y);
							B.HB.Visible = true;
							local u = L.Y * G;
							B.HF.Size = Vector2.new(2, u);
							B.HF.Position = Vector2.new(r.X - 5.5, (r.Y + L.Y) - u);
							B.HF.Color = Color3.fromRGB(255 * ((1 - G)), 255 * G, 0);
							B.HF.Visible = true;
						else
							if B.HB then
								B.HB.Visible = false;
							end;
							if B.HF then
								B.HF.Visible = false;
							end;
						end;
						if f.ShowHeadDot and B.Dot then
							local u, o = i:WorldToViewportPoint(c.Position);
							if o then
								B.Dot.Position = Vector2.new(u.X, u.Y);
								B.Dot.Radius = math.clamp(P * .18, 3, 9);
								B.Dot.Color = G;
								B.Dot.Visible = true;
							else
								B.Dot.Visible = false;
							end;
						elseif B.Dot then
							B.Dot.Visible = false;
						end;
					end;
				end;
			else
				fQ(w);
				if zQ[w] then
					pcall(function()
						zQ[w].FillColor = G;
					end);
				end;
			end;
		end;
	end;
	for G, B in pairs(iQ) do
		if not o[G] then
			PQ(G);
		end;
	end;
	for G, B in pairs(zQ) do
		if not o[G] then
			PQ(G);
		end;
	end;
end;
B.PlayerRemoving:Connect(function(G)
	PQ(G);
	local B = T(G);
	if B then
		E(B:FindFirstChild("Head"));
		E(F(B));
	end;
end);
local function pQ(G)
	G.CharacterRemoving:Connect(function()
		PQ(G);
	end);
	G.CharacterAdded:Connect(function()
		task.wait(.25);
		PQ(G);
	end);
end;
B.PlayerAdded:Connect(pQ);
for G, B in ipairs(B:GetPlayers()) do
	pQ(B);
end;
local ZQ;
pcall(function()
	ZQ = (X:WaitForChild("GameEvents", 8)):WaitForChild("DeviceUpdate", 8);
end);
local function DQ()
	if not ZQ then
		pcall(function()
			ZQ = X.GameEvents.DeviceUpdate;
		end);
	end;
	if not ZQ then
		return;
	end;
	local G = f.DeviceMode or "Console";
	pcall(function()
		if G == "Console" then
			ZQ:FireServer();
			pcall(function()
				ZQ:FireServer("Console");
			end);
		elseif G == "Desktop" then
			ZQ:FireServer("Desktop");
		else
			ZQ:FireServer("Mobile");
		end;
	end);
end;
task.spawn(function()
	while true do
		task.wait(math.max(tonumber(f.DeviceSpoofDelay) or 1.5, .4));
		if f.DeviceSpoof then
			DQ();
		end;
	end;
end);
local QQ = false;
local function OQ(G)
	if G == QQ then
		return;
	end;
	QQ = G;
	pcall(function()
		w.GlobalShadows = not G;
		if G then
			w.FogEnd = 9000000000;
			if settings and (settings()).Rendering then
				(settings()).Rendering.QualityLevel = Enum.QualityLevel.Level01;
			end;
			for G, u in ipairs(workspace:GetDescendants()) do
				if u:IsA("BasePart") then
					local G = false;
					for B, o in ipairs(B:GetPlayers()) do
						if o.Character and u:IsDescendantOf(o.Character) then
							G = true;
							break;
						end;
					end;
					if not G then
						u.Material = Enum.Material.SmoothPlastic;
						u.CastShadow = false;
					end;
				elseif u:IsA("ParticleEmitter") or u:IsA("Trail") or u:IsA("Beam") then
					u.Enabled = false;
				end;
			end;
		end;
	end);
end;
local HQ = Instance.new("ScreenGui");
HQ.Name = "MoonHubUI";
HQ.ResetOnSpawn = false;
HQ.IgnoreGuiInset = true;
HQ.DisplayOrder = 999;
HQ.Parent = N;
local VQ = Instance.new("Frame");
VQ.Size = UDim2.new(0, math.min(540, i.ViewportSize.X - 20), 0, math.min(390, i.ViewportSize.Y - 50));
VQ.Position = UDim2.new(.5, -VQ.Size.X.Offset / 2, .5, -VQ.Size.Y.Offset / 2);
VQ.BackgroundColor3 = O;
VQ.BackgroundTransparency = .15;
VQ.BorderSizePixel = 0;
VQ.Parent = HQ;
(Instance.new("UICorner", VQ)).CornerRadius = UDim.new(0, 12);
local WQ = Instance.new("Frame");
WQ.Size = UDim2.new(1, 0, 0, 40);
WQ.BackgroundColor3 = H;
WQ.BorderSizePixel = 0;
WQ.Parent = VQ;
(Instance.new("UICorner", WQ)).CornerRadius = UDim.new(0, 12);
local gQ = Instance.new("TextLabel");
gQ.Size = UDim2.new(1, -40, 1, 0);
gQ.Position = UDim2.new(0, 12, 0, 0);
gQ.BackgroundTransparency = 1;
gQ.Text = "MOON HUB  \194\183  jailbird";
gQ.TextColor3 = W;
gQ.TextSize = 14;
gQ.Font = M;
gQ.TextXAlignment = Enum.TextXAlignment.Left;
gQ.Parent = WQ;
local MQ = Instance.new("TextButton");
MQ.Size = UDim2.new(0, 28, 0, 28);
MQ.Position = UDim2.new(1, -34, .5, -14);
MQ.BackgroundColor3 = Color3.fromRGB(40, 30, 50);
MQ.Text = "X";
MQ.TextColor3 = g;
MQ.Font = M;
MQ.TextSize = 14;
MQ.Parent = WQ;
(Instance.new("UICorner", MQ)).CornerRadius = UDim.new(0, 6);
local UQ = Instance.new("ScrollingFrame");
UQ.Size = UDim2.new(0, 100, 1, -48);
UQ.Position = UDim2.new(0, 8, 0, 44);
UQ.BackgroundColor3 = H;
UQ.BorderSizePixel = 0;
UQ.ScrollBarThickness = 2;
UQ.AutomaticCanvasSize = Enum.AutomaticSize.Y;
UQ.CanvasSize = UDim2.new(0, 0, 0, 0);
UQ.Parent = VQ;
(Instance.new("UICorner", UQ)).CornerRadius = UDim.new(0, 8);
local bQ = Instance.new("UIListLayout");
bQ.Padding = UDim.new(0, 4);
bQ.Parent = UQ;
local kQ = Instance.new("UIPadding");
kQ.PaddingTop = UDim.new(0, 6);
kQ.PaddingLeft = UDim.new(0, 6);
kQ.PaddingRight = UDim.new(0, 6);
kQ.Parent = UQ;
local KQ = Instance.new("Frame");
KQ.Size = UDim2.new(1, -120, 1, -52);
KQ.Position = UDim2.new(0, 114, 0, 46);
KQ.BackgroundTransparency = 1;
KQ.Parent = VQ;
local vQ, aQ = {}, {};
local function SQ(G)
	for B, u in pairs(vQ) do
		u.Visible = (B == G);
	end;
	for B, u in pairs(aQ) do
		u.BackgroundColor3 = (B == G) and Color3.fromRGB(40, 35, 60) or Color3.fromRGB(22, 22, 30);
		u.TextColor3 = (B == G) and Q or g;
	end;
	b();
end;
local function lQ(G)
	local B = Instance.new("ScrollingFrame");
	B.Size = UDim2.new(1, 0, 1, 0);
	B.BackgroundTransparency = 1;
	B.BorderSizePixel = 0;
	B.ScrollBarThickness = 3;
	B.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	B.CanvasSize = UDim2.new(0, 0, 0, 0);
	B.Visible = false;
	B.Parent = KQ;
	local u = Instance.new("UIListLayout");
	u.Padding = UDim.new(0, 5);
	u.SortOrder = Enum.SortOrder.LayoutOrder;
	u.Parent = B;
	local o = Instance.new("UIPadding");
	o.PaddingBottom = UDim.new(0, 10);
	o.Parent = B;
	B:SetAttribute("O", 0);
	vQ[G] = B;
	local w = Instance.new("TextButton");
	w.Size = UDim2.new(1, 0, 0, 28);
	w.BackgroundColor3 = Color3.fromRGB(22, 22, 30);
	w.Text = G;
	w.TextColor3 = g;
	w.TextSize = 12;
	w.Font = M;
	w.Parent = UQ;
	(Instance.new("UICorner", w)).CornerRadius = UDim.new(0, 6);
	w.MouseButton1Click:Connect(function()
		SQ(G);
	end);
	aQ[G] = w;
	return B;
end;
local function RQ(G)
	local B = ((G:GetAttribute("O") or 0)) + 1;
	G:SetAttribute("O", B);
	return B;
end;
local function tQ(G, B)
	local u = Instance.new("TextLabel");
	u.LayoutOrder = RQ(G);
	u.Size = UDim2.new(1, 0, 0, 16);
	u.BackgroundTransparency = 1;
	u.Text = string.upper(B);
	u.TextColor3 = Q;
	u.TextSize = 11;
	u.Font = M;
	u.TextXAlignment = Enum.TextXAlignment.Left;
	u.Parent = G;
end;
local function TQ(G, B, u)
	local o = Instance.new("Frame");
	o.LayoutOrder = RQ(G);
	o.Size = UDim2.new(1, 0, 0, 32);
	o.BackgroundColor3 = V;
	o.BorderSizePixel = 0;
	o.Parent = G;
	(Instance.new("UICorner", o)).CornerRadius = UDim.new(0, 8);
	local w = Instance.new("TextLabel");
	w.Size = UDim2.new(1, -55, 1, 0);
	w.Position = UDim2.new(0, 10, 0, 0);
	w.BackgroundTransparency = 1;
	w.Text = B;
	w.TextColor3 = W;
	w.TextSize = 12;
	w.Font = M;
	w.TextXAlignment = Enum.TextXAlignment.Left;
	w.Parent = o;
	local h = Instance.new("TextButton");
	h.Size = UDim2.new(0, 40, 0, 18);
	h.Position = UDim2.new(1, -48, .5, -9);
	h.BackgroundColor3 = f[u] and Q or Color3.fromRGB(45, 45, 58);
	h.Text = "";
	h.Parent = o;
	(Instance.new("UICorner", h)).CornerRadius = UDim.new(1, 0);
	local c = Instance.new("Frame");
	c.Size = UDim2.new(0, 14, 0, 14);
	c.Position = f[u] and UDim2.new(1, -16, .5, -7) or UDim2.new(0, 2, .5, -7);
	c.BackgroundColor3 = Color3.new(1, 1, 1);
	c.BorderSizePixel = 0;
	c.Parent = h;
	(Instance.new("UICorner", c)).CornerRadius = UDim.new(1, 0);
	h.MouseButton1Click:Connect(function()
		f[u] = not f[u];
		local G = f[u];
		h.BackgroundColor3 = G and Q or Color3.fromRGB(45, 45, 58);
		c.Position = G and UDim2.new(1, -16, .5, -7) or UDim2.new(0, 2, .5, -7);
		if u == "ESP" then
			LQ();
		end;
		if u == "Hitbox" and not G then
			I();
		end;
		if u == "DeviceSpoof" and G then
			DQ();
		end;
		if u == "Potato" then
			OQ(G);
		end;
		if u == "CustomFOV" then
			if G then
				t();
			else
				pcall(function()
					i.FieldOfView = R;
				end);
			end;
		end;
		if u == "MobileAim" and G then
			f.Aimbot = true;
		end;
		n();
		b();
	end);
end;
local function xQ(G, B, o, w, h, c)
	local X = Instance.new("Frame");
	X.LayoutOrder = RQ(G);
	X.Size = UDim2.new(1, 0, 0, 46);
	X.BackgroundColor3 = V;
	X.BorderSizePixel = 0;
	X.Parent = G;
	(Instance.new("UICorner", X)).CornerRadius = UDim.new(0, 8);
	local C = Instance.new("TextLabel");
	C.Size = UDim2.new(.65, 0, 0, 16);
	C.Position = UDim2.new(0, 10, 0, 4);
	C.BackgroundTransparency = 1;
	C.Text = B;
	C.TextColor3 = W;
	C.TextSize = 11;
	C.Font = M;
	C.TextXAlignment = Enum.TextXAlignment.Left;
	C.Parent = X;
	local i = Instance.new("TextLabel");
	i.Size = UDim2.new(.3, -8, 0, 16);
	i.Position = UDim2.new(.7, 0, 0, 4);
	i.BackgroundTransparency = 1;
	i.Text = tostring(f[o]);
	i.TextColor3 = Q;
	i.TextSize = 11;
	i.Font = M;
	i.TextXAlignment = Enum.TextXAlignment.Right;
	i.Parent = X;
	local z = Instance.new("TextButton");
	z.Size = UDim2.new(1, -20, 0, 8);
	z.Position = UDim2.new(0, 10, 0, 26);
	z.BackgroundColor3 = Color3.fromRGB(40, 40, 55);
	z.Text = "";
	z.Parent = X;
	(Instance.new("UICorner", z)).CornerRadius = UDim.new(1, 0);
	local N = Instance.new("Frame");
	N.Size = UDim2.new(math.clamp(((f[o] - w)) / math.max(h - w, .001), 0, 1), 0, 1, 0);
	N.BackgroundColor3 = Q;
	N.BorderSizePixel = 0;
	N.Parent = z;
	(Instance.new("UICorner", N)).CornerRadius = UDim.new(1, 0);
	local function P(G)
		local B = math.clamp(((G - z.AbsolutePosition.X)) / math.max(z.AbsoluteSize.X, 1), 0, 1);
		local u = w + B * ((h - w));
		u = math.floor(u / c + .5) * c;
		u = math.clamp(u, w, h);
		f[o] = u;
		N.Size = UDim2.new(((u - w)) / math.max(h - w, .001), 0, 1, 0);
		i.Text = tostring(u);
		if o == "CursorSize" then
			a.Size = UDim2.new(0, u, 0, u);
		end;
		if o == "FOVValue" and f.CustomFOV then
			t();
		end;
		n();
	end;
	z.MouseButton1Down:Connect(function()
		local G, B;
		G = u.InputChanged:Connect(function(G)
				if G.UserInputType == Enum.UserInputType.MouseMovement or G.UserInputType == Enum.UserInputType.Touch then
					P(G.Position.X);
				end;
			end);
		B = u.InputEnded:Connect(function(u)
				if u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch then
					if G then
						G:Disconnect();
					end;
					if B then
						B:Disconnect();
					end;
				end;
			end);
		P((u:GetMouseLocation()).X);
	end);
end;
local function JQ(G, B, u, o)
	local w = Instance.new("Frame");
	w.LayoutOrder = RQ(G);
	w.Size = UDim2.new(1, 0, 0, 32);
	w.BackgroundColor3 = V;
	w.BorderSizePixel = 0;
	w.Parent = G;
	(Instance.new("UICorner", w)).CornerRadius = UDim.new(0, 8);
	local h = Instance.new("TextLabel");
	h.Size = UDim2.new(.4, 0, 1, 0);
	h.Position = UDim2.new(0, 10, 0, 0);
	h.BackgroundTransparency = 1;
	h.Text = B;
	h.TextColor3 = W;
	h.TextSize = 12;
	h.Font = M;
	h.TextXAlignment = Enum.TextXAlignment.Left;
	h.Parent = w;
	local c = 1;
	for G, B in ipairs(o) do
		if B == f[u] then
			c = G;
		end;
	end;
	local X = Instance.new("TextButton");
	X.Size = UDim2.new(.55, -12, 0, 22);
	X.Position = UDim2.new(.45, 0, .5, -11);
	X.BackgroundColor3 = Color3.fromRGB(35, 32, 48);
	X.Text = tostring(f[u]);
	X.TextColor3 = Q;
	X.TextSize = 11;
	X.Font = M;
	X.Parent = w;
	(Instance.new("UICorner", X)).CornerRadius = UDim.new(0, 6);
	X.MouseButton1Click:Connect(function()
		c = c % #o + 1;
		f[u] = o[c];
		X.Text = o[c];
		if u == "CursorName" then
			l(f.CursorName);
		end;
		if u == "DeviceMode" and f.DeviceSpoof then
			DQ();
		end;
		if u == "HitboxPart" then
			I();
		end;
		n();
		b();
	end);
end;
local function mQ(G, B, u, o)
	local w = Instance.new("Frame");
	w.LayoutOrder = RQ(G);
	w.Size = UDim2.new(1, 0, 0, 52);
	w.BackgroundColor3 = V;
	w.BorderSizePixel = 0;
	w.Parent = G;
	(Instance.new("UICorner", w)).CornerRadius = UDim.new(0, 8);
	local h = Instance.new("TextLabel");
	h.Size = UDim2.new(1, -16, 0, 14);
	h.Position = UDim2.new(0, 10, 0, 4);
	h.BackgroundTransparency = 1;
	h.Text = B;
	h.TextColor3 = g;
	h.TextSize = 11;
	h.Font = M;
	h.TextXAlignment = Enum.TextXAlignment.Left;
	h.Parent = w;
	local c = Instance.new("TextBox");
	c.Size = UDim2.new(1, -20, 0, 22);
	c.Position = UDim2.new(0, 10, 0, 22);
	c.BackgroundColor3 = Color3.fromRGB(14, 14, 20);
	c.BorderSizePixel = 0;
	c.Text = tostring(f[u] or o or "");
	c.PlaceholderText = o or "";
	c.TextColor3 = W;
	c.TextSize = 12;
	c.Font = M;
	c.ClearTextOnFocus = false;
	c.Parent = w;
	(Instance.new("UICorner", c)).CornerRadius = UDim.new(0, 6);
	c.FocusLost:Connect(function()
		local G = c.Text;
		if not G or G == "" then
			G = o or "default";
			c.Text = G;
		end;
		f[u] = G;
		n();
	end);
end;
local function eQ(G, B, u)
	local o = Instance.new("TextButton");
	o.LayoutOrder = RQ(G);
	o.Size = UDim2.new(1, 0, 0, 30);
	o.BackgroundColor3 = Color3.fromRGB(35, 30, 55);
	o.Text = B;
	o.TextColor3 = Q;
	o.TextSize = 12;
	o.Font = M;
	o.Parent = G;
	(Instance.new("UICorner", o)).CornerRadius = UDim.new(0, 8);
	o.MouseButton1Click:Connect(function()
		u();
		b();
	end);
end;
local AQ = lQ("Combat");
local qQ = lQ("Player");
local jQ = lQ("Stream");
local yQ = lQ("Staff");
local YQ = lQ("Mobile");
local FQ = lQ("Visuals");
local EQ = lQ("Config");
tQ(AQ, "Aimbot");
TQ(AQ, "Aimbot", "Aimbot");
JQ(AQ, "Key", "AimKey", {
	"MB1",
	"MB2",
	"E",
	"Q",
	"F",
});
JQ(AQ, "Mode", "AimMode", { "Hold", "Toggle", "Always" });
xQ(AQ, "FOV", "AimFOV", 40, 350, 1);
xQ(AQ, "Smooth", "AimSmooth", .1, 1, .05);
TQ(AQ, "Show FOV", "ShowFOV");
TQ(AQ, "Wall Check", "WallCheck");
TQ(AQ, "Team Check", "TeamCheck");
TQ(AQ, "Prediction", "Prediction");
xQ(AQ, "Predict", "PredictAmount", 0, .35, .01);
tQ(AQ, "Triggerbot (PC + Mobile)");
TQ(AQ, "Triggerbot", "Triggerbot");
xQ(AQ, "Trigger FOV", "TriggerFOV", 15, 150, 1);
xQ(AQ, "Trigger Delay", "TriggerDelay", .03, .25, .01);
tQ(AQ, "No Recoil");
TQ(AQ, "No Recoil (safe)", "NoRecoil");
tQ(AQ, "Camera FOV");
TQ(AQ, "Custom FOV", "CustomFOV");
xQ(AQ, "FOV Value", "FOVValue", 40, 120, 1);
tQ(AQ, "Hitbox Expand");
TQ(AQ, "Hitbox Expand", "Hitbox");
JQ(AQ, "Part", "HitboxPart", { "Head", "Torso" });
xQ(AQ, "Size", "HitboxSize", 1.5, 10, .5);
tQ(qQ, "Move");
TQ(qQ, "Speed", "Speed");
xQ(qQ, "Speed Value", "SpeedValue", 16, 80, 1);
TQ(qQ, "Noclip", "Noclip");
TQ(qQ, "Anti-Bow", "AntiBow");
tQ(qQ, "Device");
TQ(qQ, "Device Spoof", "DeviceSpoof");
JQ(qQ, "Mode", "DeviceMode", { "Console", "Desktop", "Mobile" });
xQ(qQ, "Delay", "DeviceSpoofDelay", .5, 5, .1);
eQ(qQ, "Apply Device", DQ);
tQ(jQ, "Stream");
TQ(jQ, "Stream Proof", "StreamProof");
mQ(jQ, "Name", "SpoofName", "Player");
TQ(jQ, "Verified", "ShowVerified");
tQ(yQ, "Staff");
TQ(yQ, "Detect", "StaffDetect");
TQ(yQ, "Leave", "StaffLeave");
tQ(YQ, "Mobile Aim");
TQ(YQ, "Mobile Aim ON", "MobileAim");
xQ(YQ, "Smooth", "MobileSmooth", .1, 1, .05);
xQ(YQ, "FOV", "MobileFOV", 40, 350, 1);
TQ(YQ, "Show FOV", "MobileShowFOV");
tQ(FQ, "ESP");
TQ(FQ, "ESP Enabled", "ESP");
TQ(FQ, "Boxes", "ShowBoxes");
JQ(FQ, "Box Style", "BoxStyle", { "Corner", "Full", "Both" });
TQ(FQ, "Names", "ShowNames");
TQ(FQ, "Distance", "ShowDistance");
TQ(FQ, "Health", "ShowHealth");
TQ(FQ, "Head Dot", "ShowHeadDot");
eQ(FQ, "Force Refresh ESP", LQ);
tQ(FQ, "ESP Color");
TQ(FQ, "RGB ESP", "RGBESP");
xQ(FQ, "Red", "ESPColorR", 0, 255, 1);
xQ(FQ, "Green", "ESPColorG", 0, 255, 1);
xQ(FQ, "Blue", "ESPColorB", 0, 255, 1);
tQ(FQ, "Radar");
TQ(FQ, "Radar", "Radar");
xQ(FQ, "Radar Size", "RadarSize", 80, 220, 5);
xQ(FQ, "Radar Range", "RadarRange", 50, 400, 10);
tQ(FQ, "Cursor");
JQ(FQ, "Cursor", "CursorName", K);
xQ(FQ, "Cursor Size", "CursorSize", 8, 128, 1);
for G, B in ipairs(k) do
	eQ(FQ, B.Name, function()
		l(B.Name);
		n();
	end);
end;
tQ(EQ, "Config");
mQ(EQ, "Name", "ConfigName", "default");
eQ(EQ, "Save", n);
eQ(EQ, "Load", function()
	p();
end);
TQ(EQ, "FPS + MS", "ShowPerf");
TQ(EQ, "Potato", "Potato");
SQ("Combat");
local IQ, dQ, GG;
WQ.InputBegan:Connect(function(G)
	if G.UserInputType == Enum.UserInputType.MouseButton1 or G.UserInputType == Enum.UserInputType.Touch then
		IQ = true;
		dQ = G.Position;
		GG = VQ.Position;
	end;
end);
WQ.InputEnded:Connect(function(G)
	if G.UserInputType == Enum.UserInputType.MouseButton1 or G.UserInputType == Enum.UserInputType.Touch then
		IQ = false;
	end;
end);
u.InputChanged:Connect(function(G)
	if IQ and ((G.UserInputType == Enum.UserInputType.MouseMovement or G.UserInputType == Enum.UserInputType.Touch)) then
		local B = G.Position - dQ;
		VQ.Position = UDim2.new(GG.X.Scale, GG.X.Offset + B.X, GG.Y.Scale, GG.Y.Offset + B.Y);
	end;
end);
MQ.MouseButton1Click:Connect(function()
	VQ.Visible = false;
end);
u.InputBegan:Connect(function(G)
	if G.KeyCode == Enum.KeyCode.RightControl or G.KeyCode == Enum.KeyCode.LeftControl then
		VQ.Visible = not VQ.Visible;
		b();
	end;
end);
local BG = {
		MB1 = Enum.UserInputType.MouseButton1,
		MB2 = Enum.UserInputType.MouseButton2,
		E = Enum.KeyCode.E,
		Q = Enum.KeyCode.Q,
		F = Enum.KeyCode.F,
	};
local uG = false;
local oG;
u.InputBegan:Connect(function(G, B)
	if B or not f.Aimbot or f.MobileAim then
		return;
	end;
	local u = BG[f.AimKey] or Enum.UserInputType.MouseButton2;
	if G.UserInputType == u or G.KeyCode == u then
		if f.AimMode == "Hold" then
			uG = true;
		elseif f.AimMode == "Toggle" then
			uG = not uG;
		end;
	end;
end);
u.InputEnded:Connect(function(G)
	local B = BG[f.AimKey] or Enum.UserInputType.MouseButton2;
	if f.AimMode == "Hold" and ((G.UserInputType == B or G.KeyCode == B)) then
		uG = false;
	end;
end);
local function wG(G)
	if oG then
		oG:Disconnect();
		oG = nil;
	end;
	if not G then
		local G = T(z);
		if G then
			for G, B in ipairs(G:GetDescendants()) do
				if B:IsA("BasePart") then
					B.CanCollide = true;
				end;
			end;
		end;
		return;
	end;
	oG = o.Stepped:Connect(function()
			local G = T(z);
			if not G then
				return;
			end;
			for G, B in ipairs(G:GetDescendants()) do
				if B:IsA("BasePart") then
					B.CanCollide = false;
				end;
			end;
		end);
end;
task.spawn(function()
	while true do
		task.wait(.2);
		if f.AntiBow then
			pcall(function()
				local G = T(z);
				if not G then
					return;
				end;
				local B = G:FindFirstChild("HumanoidRootPart");
				local u = G:FindFirstChildOfClass("Humanoid");
				if not B or not u or u.Health <= 0 then
					return;
				end;
				local o = u:GetState();
				if o == Enum.HumanoidStateType.Jumping or o == Enum.HumanoidStateType.Freefall then
					return;
				end;
				if B.CFrame.UpVector:Dot(Vector3.yAxis) >= .92 then
					return;
				end;
				local w, h = B.CFrame:ToOrientation();
				B.CFrame = CFrame.new(B.Position) * CFrame.Angles(0, h, 0);
			end);
		end;
	end;
end);
task.spawn(function()
	while true do
		task.wait(.5);
		if f.StreamProof then
			local G = f.ShowVerified and (tostring(f.SpoofName) .. " \238\128\128") or tostring(f.SpoofName);
			pcall(function()
				z.DisplayName = G;
			end);
		end;
	end;
end);
local hG = 33054943;
local cG = {};
task.spawn(function()
	while true do
		task.wait(2);
		if f.StaffDetect then
			for G, B in ipairs(B:GetPlayers()) do
				if B ~= z then
					local G, u = pcall(function()
							return B:GetRankInGroup(hG);
						end);
					if G and (type(u) == "number" and u >= 51) then
						if not cG[B.UserId] then
							cG[B.UserId] = true;
							if f.StaffLeave then
								pcall(function()
									z:Kick("Staff");
								end);
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
local XG, CG, iG;
local function zG()
	if not Z or XG then
		return;
	end;
	XG = NQ("Circle");
	if XG then
		XG.Filled = true;
		XG.Color = Color3.fromRGB(10, 10, 14);
		XG.Transparency = .35;
		XG.NumSides = 48;
		XG.Visible = false;
	end;
	CG = NQ("Circle");
	if CG then
		CG.Filled = false;
		CG.Thickness = 1.5;
		CG.Color = Q;
		CG.NumSides = 48;
		CG.Visible = false;
	end;
	iG = {};
end;
local NG = NQ("Circle");
if NG then
	NG.Thickness = 1;
	NG.NumSides = 40;
	NG.Filled = false;
	NG.Color = Color3.new(1, 1, 1);
	NG.Visible = false;
end;
local PG = NQ("Text");
if PG then
	PG.Size = 15;
	PG.Outline = true;
	PG.Font = 2;
	PG.Visible = false;
end;
local LG, rG, fG, sG = 0, tick(), 0, 0;
o.Heartbeat:Connect(function()
	local G = T(z);
	if G then
		local B = G:FindFirstChildOfClass("Humanoid");
		if f.Speed and (B and B.Health > 0) then
			B.WalkSpeed = f.SpeedValue or 24;
		end;
		if f.Noclip then
			if not oG then
				wG(true);
			end;
		elseif oG then
			wG(false);
		end;
	end;
	OQ(f.Potato == true);
	pcall(CQ);
end);
o.RenderStepped:Connect(function()
	LG = LG + 1;
	if tick() - rG >= 1 then
		fG = LG;
		LG = 0;
		rG = tick();
	end;
	if a.Visible then
		local G = u:GetMouseLocation();
		a.Position = UDim2.new(0, G.X, 0, G.Y);
	end;
	pcall(nQ);
	sG = sG + 1;
	if sG >= 2 then
		sG = 0;
		pcall(GQ);
	end;
	if f.ShowPerf and PG then
		local G = 0;
		pcall(function()
			G = math.floor(h.Network.ServerStatsItem["Data Ping"]:GetValue());
		end);
		PG.Text = "FPS " .. (fG .. ("  MS " .. G));
		PG.Position = Vector2.new(i.ViewportSize.X - 150, 10);
		PG.Color = Q;
		PG.Visible = true;
	elseif PG then
		PG.Visible = false;
	end;
	local G, o = false, f.AimFOV or 150;
	if f.MobileAim then
		G = f.MobileShowFOV;
		o = f.MobileFOV or 160;
	else
		G = f.ShowFOV and f.Aimbot;
		o = f.AimFOV or 150;
	end;
	if NG then
		NG.Position = i.ViewportSize / 2;
		NG.Radius = o;
		NG.Visible = G;
		if f.RGBESP then
			NG.Color = U();
		end;
	end;
	local w, c, X = false, f.AimSmooth or .95, f.AimFOV or 150;
	if f.MobileAim then
		w = true;
		c = f.MobileSmooth or .9;
		X = f.MobileFOV or 160;
	elseif f.Aimbot then
		w = uG or f.AimMode == "Always";
		c = f.AimSmooth or .95;
		X = f.AimFOV or 150;
	end;
	if w then
		local G, B = y(X, true);
		if B then
			if c >= .98 then
				i.CFrame = CFrame.new(i.CFrame.Position, B);
			else
				i.CFrame = i.CFrame:Lerp(CFrame.new(i.CFrame.Position, B), math.clamp(c, .1, 1));
			end;
		end;
	end;
	if f.Radar and Z then
		zG();
		local G = tonumber(f.RadarSize) or 140;
		local u = tonumber(f.RadarRange) or 200;
		local o = G / 2;
		local w = Vector2.new(20 + o, 20 + o);
		local h = U();
		if XG then
			XG.Position = w;
			XG.Radius = o;
			XG.Visible = true;
		end;
		if CG then
			CG.Position = w;
			CG.Radius = o;
			CG.Visible = true;
		end;
		local c = T(z) and (T(z)):FindFirstChild("HumanoidRootPart");
		local X = math.atan2(i.CFrame.LookVector.X, i.CFrame.LookVector.Z);
		local C = {};
		if c then
			for G, B in ipairs(B:GetPlayers()) do
				if B ~= z and (J(B) and x(B)) then
					local G = T(B) and (T(B)):FindFirstChild("HumanoidRootPart");
					if G then
						local i = G.Position - c.Position;
						if i.Magnitude <= u then
							local G = i.X * math.cos(X) - i.Z * math.sin(X);
							local c = i.X * math.sin(X) + i.Z * math.cos(X);
							local z = o / u;
							local N, P = G * z, -c * z;
							if not iG[B] then
								local G = NQ("Circle");
								if G then
									G.Filled = true;
									G.NumSides = 10;
									G.Radius = 3;
									iG[B] = G;
								end;
							end;
							local L = iG[B];
							if L then
								L.Position = Vector2.new(w.X + N, w.Y + P);
								L.Color = h;
								L.Visible = true;
							end;
							C[B] = true;
						end;
					end;
				end;
			end;
		end;
		for G, B in pairs(iG) do
			if not C[G] then
				pcall(function()
					if B then
						B.Visible = false;
					end;
				end);
			end;
		end;
	else
		if XG then
			XG.Visible = false;
		end;
		if CG then
			CG.Visible = false;
		end;
		if iG then
			for G, B in pairs(iG) do
				pcall(function()
					if B then
						B.Visible = false;
					end;
				end);
			end;
		end;
	end;
end);
task.spawn(function()
	while true do
		task.wait(15);
		n();
	end;
end);
if f.CursorName and f.CursorName ~= "Off" then
	l(f.CursorName);
end;
if f.CustomFOV then
	t();
end;
print("[Moon Hub] Your version + RGB ESP + Hitbox + Safe No Recoil");

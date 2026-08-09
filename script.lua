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
task.wait(.4);
local w = getgenv or function()
		return _G;
	end;
local c = game:GetService("Players");
local m = game:GetService("UserInputService");
local D = game:GetService("RunService");
local y = game:GetService("Lighting");
local j = game:GetService("Stats");
local M = game:GetService("HttpService");
local K = game:GetService("ReplicatedStorage");
local z = game:GetService("VirtualInputManager");
local n = workspace.CurrentCamera;
local g = c.LocalPlayer or c.PlayerAdded:Wait();
local o = g:WaitForChild("PlayerGui", 60);
if not o then
	warn("[Moon] PlayerGui timeout");
	return;
end;
pcall(function()
	local w = o:FindFirstChild("MoonHubUI");
	if w then
		w:Destroy();
	end;
	local c = o:FindFirstChild("MoonCursorUI");
	if c then
		c:Destroy();
	end;
end);
task.wait(.05);
local T;
pcall(function()
	T = g:GetMouse();
end);
local function a(w, c)
	pcall(function()
		if writefile then
			writefile(w, c);
		end;
	end);
end;
local function r(w)
	local c, m = pcall(function()
			if isfile and (isfile(w) and readfile) then
				return readfile(w);
			end;
		end);
	return c and m or nil;
end;
pcall(function()
	if makefolder then
		makefolder("MoonHub");
		makefolder("MoonHub/Configs");
	end;
end);
(w()).MoonHubState = (w()).MoonHubState or {};
local J = (w()).MoonHubState;
local l = {
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
		KillAura = false,
		KillAuraRange = 90,
		KillAuraBehind = 3.2,
		CustomFOV = false,
		FOVValue = 90,
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
for w, c in pairs(l) do
	if J[w] == nil then
		J[w] = c;
	end;
end;
J.NoRecoil = nil;
J.NoJumpCooldown = nil;
J.KillAuraDelay = nil;
if type(J.CursorSize) ~= "number" then
	J.CursorSize = 32;
end;
if type(J.AimSmooth) ~= "number" then
	J.AimSmooth = .95;
end;
if type(J.FOVValue) ~= "number" then
	J.FOVValue = 90;
end;
if type(J.TriggerDelay) ~= "number" then
	J.TriggerDelay = .06;
end;
if type(J.TriggerFOV) ~= "number" then
	J.TriggerFOV = 55;
end;
if J.HitboxPart ~= "Head" and J.HitboxPart ~= "Torso" then
	J.HitboxPart = "Head";
end;
if type(J.KillAuraRange) ~= "number" then
	J.KillAuraRange = 90;
end;
if type(J.KillAuraBehind) ~= "number" then
	J.KillAuraBehind = 3.2;
end;
local function N()
	local w = (tostring(J.ConfigName or "default")):gsub("[^%w%-%_]", "");
	if w == "" then
		w = "default";
	end;
	J.ConfigName = w;
	J.NoRecoil = nil;
	J.NoJumpCooldown = nil;
	J.KillAuraDelay = nil;
	a("MoonHub/Configs/" .. (w .. ".json"), M:JSONEncode(J));
	a("MoonHub/Jailbird.json", M:JSONEncode(J));
end;
local function H()
	local w = (tostring(J.ConfigName or "default")):gsub("[^%w%-%_]", "");
	local c = r("MoonHub/Configs/" .. (w .. ".json")) or r("MoonHub/Jailbird.json");
	if c then
		pcall(function()
			local w = M:JSONDecode(c);
			if type(w) == "table" then
				for w, c in pairs(w) do
					J[w] = c;
				end;
			end;
		end);
	end;
	J.NoRecoil = nil;
	J.NoJumpCooldown = nil;
	J.KillAuraDelay = nil;
	if J.HitboxPart ~= "Head" and J.HitboxPart ~= "Torso" then
		J.HitboxPart = "Head";
	end;
end;
pcall(H);
local O = false;
local B = nil;
pcall(function()
	if Drawing and type(Drawing.new) == "function" then
		B = Drawing;
		local w = Drawing.new("Text");
		w.Visible = false;
		pcall(function()
			w:Remove();
		end);
		O = true;
	end;
end);
if not O then
	pcall(function()
		if (w()).Drawing and type((w()).Drawing.new) == "function" then
			B = (w()).Drawing;
			local c = B.new("Text");
			c.Visible = false;
			pcall(function()
				c:Remove();
			end);
			O = true;
		end;
	end);
end;
local E = Color3.fromRGB(138, 99, 255);
local X = Color3.fromRGB(12, 12, 16);
local R = Color3.fromRGB(18, 18, 24);
local h = Color3.fromRGB(20, 20, 28);
local C = Color3.fromRGB(235, 235, 245);
local f = Color3.fromRGB(160, 160, 180);
local U = Enum.Font.Gotham;
local function s()
	if J.RGBESP then
		return Color3.fromHSV(((tick() * .4)) % 1, 1, 1);
	end;
	return Color3.fromRGB(math.clamp(tonumber(J.ESPColorR) or 170, 0, 255), math.clamp(tonumber(J.ESPColorG) or 0, 0, 255), math.clamp(tonumber(J.ESPColorB) or 255, 0, 255));
end;
local function A()
	pcall(function()
		m.MouseBehavior = Enum.MouseBehavior.Default;
		m.MouseIconEnabled = true;
	end);
end;
local Y = {
		{ Name = "Off", Id = nil },
		{ Name = "Game Crosshair", Id = "GAME" },
		{ Name = "Star Wars", Id = "5462831" },
		{ Name = "Snowflake", Id = "11780968239" },
		{ Name = "Red Dot", Id = "412284862" },
		{ Name = "Diamond", Id = "61210994" },
		{ Name = "Hello Kitty", Id = "10973237327" },
		{ Name = "Eye", Id = "12534101433" },
	};
local G = {};
for w, c in ipairs(Y) do
	G[w] = c.Name;
end;
local Q = Instance.new("ScreenGui");
Q.Name = "MoonCursorUI";
Q.ResetOnSpawn = false;
Q.IgnoreGuiInset = true;
Q.DisplayOrder = 10000;
Q.Parent = o;
local S = Instance.new("ImageLabel");
S.BackgroundTransparency = 1;
S.AnchorPoint = Vector2.new(.5, .5);
S.Size = UDim2.new(0, 32, 0, 32);
S.Visible = false;
S.ZIndex = 100;
S.Parent = Q;
local function v(w)
	local c = o:FindFirstChild("Crosshair");
	if not c then
		return;
	end;
	pcall(function()
		if c:IsA("ScreenGui") then
			c.Enabled = w;
		end;
		c.Visible = w;
		for c, m in ipairs(c:GetDescendants()) do
			if m:IsA("GuiObject") then
				m.Visible = w;
			end;
		end;
	end);
end;
local function F(w)
	w = w or J.CursorName or "Off";
	J.CursorName = w;
	local c = Y[1];
	for m, D in ipairs(Y) do
		if D.Name == w then
			c = D;
			break;
		end;
	end;
	v(false);
	S.Visible = false;
	local D = math.clamp(tonumber(J.CursorSize) or 32, 8, 128);
	S.Size = UDim2.new(0, D, 0, D);
	if not c.Id or c.Name == "Off" then
		pcall(function()
			if T then
				T.Icon = "";
			end;
			m.MouseIconEnabled = true;
		end);
		return;
	end;
	if c.Id == "GAME" then
		v(true);
		pcall(function()
			if T then
				T.Icon = "rbxassetid://0";
			end;
			m.MouseIconEnabled = true;
		end);
		return;
	end;
	pcall(function()
		m.MouseIconEnabled = false;
		if T then
			T.Icon = "rbxassetid://0";
		end;
		S.Image = "rbxassetid://" .. tostring(c.Id);
		S.Visible = true;
	end);
end;
local V = 70;
pcall(function()
	V = n.FieldOfView;
end);
local function p()
	if not J.CustomFOV then
		return;
	end;
	local w = math.clamp(tonumber(J.FOVValue) or 90, 40, 120);
	pcall(function()
		if math.abs(n.FieldOfView - w) > .5 then
			n.FieldOfView = w;
		end;
	end);
end;
D.RenderStepped:Connect(function()
	if J.CustomFOV then
		p();
	end;
end);
local function i(w)
	if not w then
		return nil;
	end;
	local c, m = pcall(function()
			return w.Character;
		end);
	return c and m or nil;
end;
local function Z(w)
	local c = i(w);
	if not c then
		return false;
	end;
	local m = c:FindFirstChildOfClass("Humanoid");
	return m ~= nil and m.Health > 0;
end;
local function L(w)
	if not w or w == g then
		return false;
	end;
	if not J.TeamCheck then
		return true;
	end;
	local c, m = g.Team, w.Team;
	if c and m then
		return c ~= m;
	end;
	return true;
end;
local x = {
		"box",
		"crate",
		"barrel",
		"dumpster",
		"trash",
		"container",
		"shipping",
		"wall",
		"pillar",
		"fence",
		"gate",
		"car",
		"truck",
		"van",
		"generator",
		"cabinet",
		"shelf",
		"locker",
		"desk",
		"table",
		"couch",
		"bench",
		"stairs",
		"ladder",
		"ramp",
		"pipe",
		"vent",
		"sandbag",
		"pallet",
		"forklift",
	};
local function e(w, c)
	for m = 1, #c, 1 do
		if string.find(w, c[m], 1, true) then
			return true;
		end;
	end;
	return false;
end;
local function I(w)
	if not w or not w:IsA("BasePart") then
		return true;
	end;
	local c = string.lower(w.Name or "");
	local m = string.lower(w:GetFullName() or "");
	local D = string.lower(tostring(w.Material));
	if string.find(c, "glass", 1, true) or string.find(D, "glass", 1, true) then
		return true;
	end;
	if w.Transparency >= .7 then
		return true;
	end;
	if string.find(c, "door", 1, true) or string.find(m, "door", 1, true) then
		if string.find(c, "wood", 1, true) or string.find(m, "wood", 1, true) then
			return false;
		end;
		return true;
	end;
	if string.find(c, "window", 1, true) then
		return true;
	end;
	if w.CanCollide == false and w.Transparency >= .25 then
		return true;
	end;
	if e(c, x) or e(m, x) then
		return false;
	end;
	return false;
end;
local function q(w)
	if not J.WallCheck then
		return true;
	end;
	local c = i(w);
	local m = c and c:FindFirstChild("Head");
	if not m then
		return false;
	end;
	local D = i(g);
	local y = n.CFrame.Position + n.CFrame.LookVector * .8;
	local j = m.Position;
	local M = j - y;
	local K = M.Magnitude;
	if K < 1.5 then
		return true;
	end;
	local z = { n };
	if D then
		table.insert(z, D);
	end;
	if c then
		table.insert(z, c);
	end;
	local o = RaycastParams.new();
	o.FilterType = Enum.RaycastFilterType.Exclude;
	o.FilterDescendantsInstances = z;
	o.IgnoreWater = true;
	local T, a, r = 0, y, M.Unit;
	for w = 1, 12, 1 do
		local m = K - T;
		if m <= .15 then
			return true;
		end;
		local D = workspace:Raycast(a, r * m, o);
		if not D then
			return true;
		end;
		if D.Instance and (c and D.Instance:IsDescendantOf(c)) then
			return true;
		end;
		if I(D.Instance) then
			table.insert(z, D.Instance);
			o.FilterDescendantsInstances = z;
			local w = ((D.Position - a)).Magnitude;
			a = D.Position + r * .15;
			T = (T + w) + .15;
		else
			return false;
		end;
	end;
	return false;
end;
local function b(w, c)
	if not J.Prediction or not w then
		return w.Position;
	end;
	local m = c and ((c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso")));
	local D = Vector3.zero;
	if m then
		pcall(function()
			D = m.AssemblyLinearVelocity;
		end);
	end;
	return w.Position + D * ((tonumber(J.PredictAmount) or .12));
end;
local function u(w, m)
	local D, y, j = nil, nil, w;
	local M = n.ViewportSize / 2;
	for w, c in ipairs(c:GetPlayers()) do
		if c ~= g and (L(c) and Z(c)) then
			local w = i(c);
			local K = w and w:FindFirstChild("Head");
			if K then
				local z = b(K, w);
				local g, o = n:WorldToViewportPoint(z);
				if o and g.Z > 0 then
					local w = ((Vector2.new(g.X, g.Y) - M)).Magnitude;
					if w < j and (((not m) or q(c))) then
						j = w;
						D = c;
						y = z;
					end;
				end;
			end;
		end;
	end;
	return D, y;
end;
local P = {};
local function k(w)
	return w and ((w:FindFirstChild("UpperTorso") or w:FindFirstChild("Torso")));
end;
local function t(w)
	if not w then
		return;
	end;
	local c = P[w];
	if c then
		pcall(function()
			w.Size = c;
		end);
		P[w] = nil;
	end;
end;
local function W()
	for w, c in pairs(P) do
		t(w);
	end;
	P = {};
end;
local function d(w, c)
	if not w or not w:IsA("BasePart") then
		return;
	end;
	if P[w] == nil then
		P[w] = w.Size;
	end;
	local m = math.clamp(tonumber(c) or 3, 1.2, 12);
	pcall(function()
		w.Size = Vector3.new(m, m, m);
		w.Massless = true;
		w.CanCollide = false;
	end);
end;
local function wp()
	if not J.Hitbox then
		W();
		return;
	end;
	local w = J.HitboxPart;
	local m = tonumber(J.HitboxSize) or 3;
	for c, D in ipairs(c:GetPlayers()) do
		if D ~= g and (L(D) and Z(D)) then
			local c = i(D);
			if c then
				local D = c:FindFirstChild("Head");
				local y = k(c);
				if w == "Head" then
					if D then
						d(D, m);
					end;
					if y then
						t(y);
					end;
				else
					if y then
						d(y, m);
					end;
					if D then
						t(D);
					end;
				end;
			end;
		end;
	end;
end;
local cp = 0;
local function mp()
	local w = i(g);
	if not w then
		return nil;
	end;
	return w:FindFirstChildOfClass("Tool");
end;
local function Dp()
	local w = mp();
	if w then
		pcall(function()
			w:Activate();
		end);
		task.defer(function()
			pcall(function()
				if w and w.Parent then
					w:Activate();
				end;
			end);
		end);
	end;
	pcall(function()
		local w = n.ViewportSize;
		local c, m = w.X / 2, w.Y / 2;
		z:SendMouseButtonEvent(c, m, 0, true, game, 1);
		task.wait(.02);
		z:SendMouseButtonEvent(c, m, 0, false, game, 1);
	end);
end;
local function yp()
	if not J.Triggerbot then
		return;
	end;
	if not mp() then
		return;
	end;
	local w = tonumber(J.TriggerDelay) or .06;
	if tick() - cp < w then
		return;
	end;
	local c = tonumber(J.TriggerFOV) or 55;
	local m = u(c, J.WallCheck);
	if m then
		cp = tick();
		Dp();
	end;
end;
local jp = nil;
local function Mp(w)
	local m = i(g);
	local D = m and m:FindFirstChild("HumanoidRootPart");
	if not D then
		return nil;
	end;
	local y = tonumber(J.KillAuraRange) or 90;
	local j, M = nil, y;
	for c, m in ipairs(c:GetPlayers()) do
		if m ~= g and (m ~= w and (L(m) and Z(m))) then
			local w = i(m);
			local c = w and w:FindFirstChild("HumanoidRootPart");
			local y = w and w:FindFirstChild("Head");
			if c and y then
				local w = ((c.Position - D.Position)).Magnitude;
				if w < M then
					M = w;
					j = m;
				end;
			end;
		end;
	end;
	return j;
end;
local function Kp(w)
	local c = i(g);
	local m = c and c:FindFirstChild("HumanoidRootPart");
	local D = i(w);
	local y = D and D:FindFirstChild("HumanoidRootPart");
	local j = D and D:FindFirstChild("Head");
	if not m or not y or not j then
		return false;
	end;
	local M = tonumber(J.KillAuraBehind) or 3.2;
	local K = y.CFrame.LookVector;
	local z = (y.Position - K * M) + Vector3.new(0, 1.4, 0);
	pcall(function()
		m.CFrame = CFrame.new(z, j.Position);
	end);
	pcall(function()
		n.CFrame = CFrame.new(n.CFrame.Position, j.Position);
	end);
	return true;
end;
local function zp()
	if not J.KillAura then
		jp = nil;
		return;
	end;
	local w = i(g);
	local c = w and w:FindFirstChildOfClass("Humanoid");
	if not c or c.Health <= 0 then
		jp = nil;
		return;
	end;
	if not jp or not Z(jp) or not L(jp) then
		jp = Mp(jp);
	end;
	if not jp then
		return;
	end;
	if Kp(jp) then
		Dp();
	else
		jp = nil;
	end;
end;
local np = {};
local function gp(w)
	if not O or not B then
		return nil;
	end;
	local c, m = pcall(function()
			return B.new(w);
		end);
	if c and m then
		return m;
	end;
	return nil;
end;
local function op(w)
	if not w then
		return;
	end;
	pcall(function()
		if w.Remove then
			w:Remove();
		elseif w.Destroy then
			w:Destroy();
		else
			w.Visible = false;
		end;
	end);
end;
local function Tp(w)
	local c = np[w];
	if not c then
		return;
	end;
	for w, c in pairs(c) do
		if type(c) == "table" then
			for w, c in pairs(c) do
				op(c);
			end;
		else
			op(c);
		end;
	end;
	np[w] = nil;
end;
local function ap()
	for w in pairs(np) do
		Tp(w);
	end;
	np = {};
end;
local function rp(w)
	if np[w] then
		return np[w];
	end;
	if not O then
		return nil;
	end;
	local c = gp("Square");
	if not c then
		return nil;
	end;
	pcall(function()
		c.Thickness = 1.5;
		c.Filled = false;
		c.Visible = false;
	end);
	local m = {};
	for w = 1, 8, 1 do
		local c = gp("Line");
		if c then
			pcall(function()
				c.Thickness = 1.5;
				c.Visible = false;
			end);
			m[w] = c;
		end;
	end;
	local D = gp("Text");
	if D then
		pcall(function()
			D.Size = 14;
			D.Center = true;
			D.Outline = true;
			D.Font = 2;
			D.Visible = false;
		end);
	end;
	local y = gp("Text");
	if y then
		pcall(function()
			y.Size = 12;
			y.Center = true;
			y.Outline = true;
			y.Font = 2;
			y.Visible = false;
		end);
	end;
	local j = gp("Square");
	if j then
		pcall(function()
			j.Filled = false;
			j.Visible = false;
		end);
	end;
	local M = gp("Square");
	if M then
		pcall(function()
			M.Filled = true;
			M.Visible = false;
		end);
	end;
	local K = gp("Circle");
	if K then
		pcall(function()
			K.NumSides = 16;
			K.Filled = true;
			K.Visible = false;
		end);
	end;
	np[w] = {
			Box = c,
			Lines = m,
			Name = D,
			Dist = y,
			HB = j,
			HF = M,
			Dot = K,
		};
	return np[w];
end;
local function Jp(w)
	if not w then
		return;
	end;
	pcall(function()
		if w.Box then
			w.Box.Visible = false;
		end;
		if w.Name then
			w.Name.Visible = false;
		end;
		if w.Dist then
			w.Dist.Visible = false;
		end;
		if w.HB then
			w.HB.Visible = false;
		end;
		if w.HF then
			w.HF.Visible = false;
		end;
		if w.Dot then
			w.Dot.Visible = false;
		end;
		if w.Lines then
			for c = 1, #w.Lines, 1 do
				if w.Lines[c] then
					w.Lines[c].Visible = false;
				end;
			end;
		end;
	end);
end;
local function lp()
	if not J.ESP then
		ap();
		return;
	end;
	if not O then
		return;
	end;
	local w = s();
	local m = i(g) and (i(g)):FindFirstChild("HumanoidRootPart");
	local D = {};
	for c, y in ipairs(c:GetPlayers()) do
		if y ~= g and (L(y) and Z(y)) then
			D[y] = true;
			local c = i(y);
			local j = c and ((c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso")));
			local M = c and c:FindFirstChild("Head");
			local K = c and c:FindFirstChildOfClass("Humanoid");
			if not j or not M then
				Tp(y);
			else
				local c = rp(y);
				if c and c.Box then
					local D, z, g = pcall(function()
							local w, c = n:WorldToViewportPoint(j.Position);
							return w, c;
						end);
					if not D or not g or not z or z.Z < 0 then
						Jp(c);
					else
						local D = n:WorldToViewportPoint(M.Position + Vector3.new(0, 1.1, 0));
						local g = n:WorldToViewportPoint(j.Position - Vector3.new(0, 2.8, 0));
						local o = math.max(math.abs(g.Y - D.Y), 8);
						local T = math.clamp(o / 1.85, 8, 120);
						local a = Vector2.new(T, o);
						local r = Vector2.new(z.X - T / 2, D.Y);
						local l = math.clamp(T * .25, 4, 12);
						local N = J.BoxStyle or "Corner";
						pcall(function()
							if J.ShowBoxes and ((N == "Full" or N == "Both")) then
								c.Box.Size = a;
								c.Box.Position = r;
								c.Box.Color = w;
								c.Box.Visible = true;
							else
								c.Box.Visible = false;
							end;
						end);
						pcall(function()
							if J.ShowBoxes and (((N == "Corner" or N == "Both")) and (c.Lines and c.Lines[1])) then
								local m = c.Lines;
								m[1].From, m[1].To = r, Vector2.new(r.X, r.Y + l);
								m[2].From, m[2].To = r, Vector2.new(r.X + l, r.Y);
								m[3].From, m[3].To = Vector2.new(r.X + a.X, r.Y), Vector2.new(r.X + a.X, r.Y + l);
								m[4].From, m[4].To = Vector2.new(r.X + a.X, r.Y), Vector2.new((r.X + a.X) - l, r.Y);
								m[5].From, m[5].To = Vector2.new(r.X, r.Y + a.Y), Vector2.new(r.X, (r.Y + a.Y) - l);
								m[6].From, m[6].To = Vector2.new(r.X, r.Y + a.Y), Vector2.new(r.X + l, r.Y + a.Y);
								m[7].From, m[7].To = Vector2.new(r.X + a.X, r.Y + a.Y), Vector2.new(r.X + a.X, (r.Y + a.Y) - l);
								m[8].From, m[8].To = Vector2.new(r.X + a.X, r.Y + a.Y), Vector2.new((r.X + a.X) - l, r.Y + a.Y);
								for c = 1, 8, 1 do
									if m[c] then
										m[c].Color = w;
										m[c].Visible = true;
									end;
								end;
							elseif c.Lines then
								for w = 1, #c.Lines, 1 do
									if c.Lines[w] then
										c.Lines[w].Visible = false;
									end;
								end;
							end;
						end);
						pcall(function()
							if J.ShowNames and c.Name then
								c.Name.Text = y.DisplayName;
								c.Name.Position = Vector2.new(z.X, r.Y - 14);
								c.Name.Color = w;
								c.Name.Visible = true;
							elseif c.Name then
								c.Name.Visible = false;
							end;
						end);
						pcall(function()
							if J.ShowDistance and (c.Dist and m) then
								c.Dist.Text = math.floor(((j.Position - m.Position)).Magnitude) .. "m";
								c.Dist.Position = Vector2.new(z.X, (r.Y + a.Y) + 2);
								c.Dist.Visible = true;
							elseif c.Dist then
								c.Dist.Visible = false;
							end;
						end);
						pcall(function()
							if J.ShowHealth and (K and (c.HB and c.HF)) then
								local w = math.clamp(K.Health / math.max(K.MaxHealth, 1), 0, 1);
								c.HB.Size = Vector2.new(3, a.Y);
								c.HB.Position = Vector2.new(r.X - 6, r.Y);
								c.HB.Visible = true;
								local m = a.Y * w;
								c.HF.Size = Vector2.new(2, m);
								c.HF.Position = Vector2.new(r.X - 5.5, (r.Y + a.Y) - m);
								c.HF.Color = Color3.fromRGB(255 * ((1 - w)), 255 * w, 0);
								c.HF.Visible = true;
							else
								if c.HB then
									c.HB.Visible = false;
								end;
								if c.HF then
									c.HF.Visible = false;
								end;
							end;
						end);
						pcall(function()
							if J.ShowHeadDot and c.Dot then
								local m, D = n:WorldToViewportPoint(M.Position);
								if D then
									c.Dot.Position = Vector2.new(m.X, m.Y);
									c.Dot.Radius = math.clamp(T * .18, 3, 9);
									c.Dot.Color = w;
									c.Dot.Visible = true;
								else
									c.Dot.Visible = false;
								end;
							elseif c.Dot then
								c.Dot.Visible = false;
							end;
						end);
					end;
				end;
			end;
		end;
	end;
	for w in pairs(np) do
		if not D[w] then
			Tp(w);
		end;
	end;
end;
c.PlayerRemoving:Connect(function(w)
	Tp(w);
	if jp == w then
		jp = nil;
	end;
	local c = i(w);
	if c then
		t(c:FindFirstChild("Head"));
		t(k(c));
	end;
end);
local function Np(w)
	w.CharacterRemoving:Connect(function()
		Tp(w);
	end);
	w.CharacterAdded:Connect(function()
		task.wait(.3);
		Tp(w);
	end);
end;
c.PlayerAdded:Connect(Np);
for w, c in ipairs(c:GetPlayers()) do
	Np(c);
end;
local Hp;
pcall(function()
	Hp = (K:WaitForChild("GameEvents", 8)):WaitForChild("DeviceUpdate", 8);
end);
local function Op()
	if not Hp then
		pcall(function()
			Hp = K.GameEvents.DeviceUpdate;
		end);
	end;
	if not Hp then
		return;
	end;
	local w = J.DeviceMode or "Console";
	pcall(function()
		if w == "Console" then
			Hp:FireServer();
			pcall(function()
				Hp:FireServer("Console");
			end);
		elseif w == "Desktop" then
			Hp:FireServer("Desktop");
		else
			Hp:FireServer("Mobile");
		end;
	end);
end;
task.spawn(function()
	while true do
		task.wait(math.max(tonumber(J.DeviceSpoofDelay) or 1.5, .4));
		if J.DeviceSpoof then
			Op();
		end;
	end;
end);
local Bp = false;
local function Ep(w)
	if w == Bp then
		return;
	end;
	Bp = w;
	pcall(function()
		y.GlobalShadows = not w;
		if w then
			y.FogEnd = 9000000000;
			if settings and (settings()).Rendering then
				(settings()).Rendering.QualityLevel = Enum.QualityLevel.Level01;
			end;
			for w, m in ipairs(workspace:GetDescendants()) do
				if m:IsA("BasePart") then
					local w = false;
					for c, D in ipairs(c:GetPlayers()) do
						if D.Character and m:IsDescendantOf(D.Character) then
							w = true;
							break;
						end;
					end;
					if not w then
						m.Material = Enum.Material.SmoothPlastic;
						m.CastShadow = false;
					end;
				elseif m:IsA("ParticleEmitter") or m:IsA("Trail") or m:IsA("Beam") then
					m.Enabled = false;
				end;
			end;
		end;
	end);
end;
local Xp = Instance.new("ScreenGui");
Xp.Name = "MoonHubUI";
Xp.ResetOnSpawn = false;
Xp.IgnoreGuiInset = true;
Xp.DisplayOrder = 999;
Xp.Parent = o;
local Rp = Instance.new("Frame");
Rp.Size = UDim2.new(0, math.min(540, n.ViewportSize.X - 20), 0, math.min(400, n.ViewportSize.Y - 50));
Rp.Position = UDim2.new(.5, -Rp.Size.X.Offset / 2, .5, -Rp.Size.Y.Offset / 2);
Rp.BackgroundColor3 = X;
Rp.BackgroundTransparency = .15;
Rp.BorderSizePixel = 0;
Rp.Parent = Xp;
(Instance.new("UICorner", Rp)).CornerRadius = UDim.new(0, 12);
local hp = Instance.new("Frame");
hp.Size = UDim2.new(1, 0, 0, 40);
hp.BackgroundColor3 = R;
hp.BorderSizePixel = 0;
hp.Parent = Rp;
(Instance.new("UICorner", hp)).CornerRadius = UDim.new(0, 12);
local Cp = Instance.new("TextLabel");
Cp.Size = UDim2.new(1, -40, 1, 0);
Cp.Position = UDim2.new(0, 12, 0, 0);
Cp.BackgroundTransparency = 1;
Cp.Text = "MOON HUB  \194\183  jailbird";
Cp.TextColor3 = C;
Cp.TextSize = 14;
Cp.Font = U;
Cp.TextXAlignment = Enum.TextXAlignment.Left;
Cp.Parent = hp;
local fp = Instance.new("TextButton");
fp.Size = UDim2.new(0, 28, 0, 28);
fp.Position = UDim2.new(1, -34, .5, -14);
fp.BackgroundColor3 = Color3.fromRGB(40, 30, 50);
fp.Text = "X";
fp.TextColor3 = f;
fp.Font = U;
fp.TextSize = 14;
fp.Parent = hp;
(Instance.new("UICorner", fp)).CornerRadius = UDim.new(0, 6);
local Up = Instance.new("ScrollingFrame");
Up.Size = UDim2.new(0, 100, 1, -48);
Up.Position = UDim2.new(0, 8, 0, 44);
Up.BackgroundColor3 = R;
Up.BorderSizePixel = 0;
Up.ScrollBarThickness = 2;
Up.AutomaticCanvasSize = Enum.AutomaticSize.Y;
Up.CanvasSize = UDim2.new(0, 0, 0, 0);
Up.Parent = Rp;
(Instance.new("UICorner", Up)).CornerRadius = UDim.new(0, 8);
local sp = Instance.new("UIListLayout");
sp.Padding = UDim.new(0, 4);
sp.Parent = Up;
local Ap = Instance.new("UIPadding");
Ap.PaddingTop = UDim.new(0, 6);
Ap.PaddingLeft = UDim.new(0, 6);
Ap.PaddingRight = UDim.new(0, 6);
Ap.Parent = Up;
local Yp = Instance.new("Frame");
Yp.Size = UDim2.new(1, -120, 1, -52);
Yp.Position = UDim2.new(0, 114, 0, 46);
Yp.BackgroundTransparency = 1;
Yp.Parent = Rp;
local Gp, Qp = {}, {};
local function Sp(w)
	for c, m in pairs(Gp) do
		m.Visible = (c == w);
	end;
	for c, m in pairs(Qp) do
		m.BackgroundColor3 = (c == w) and Color3.fromRGB(40, 35, 60) or Color3.fromRGB(22, 22, 30);
		m.TextColor3 = (c == w) and E or f;
	end;
	A();
end;
local function vp(w)
	local c = Instance.new("ScrollingFrame");
	c.Size = UDim2.new(1, 0, 1, 0);
	c.BackgroundTransparency = 1;
	c.BorderSizePixel = 0;
	c.ScrollBarThickness = 3;
	c.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	c.CanvasSize = UDim2.new(0, 0, 0, 0);
	c.Visible = false;
	c.Parent = Yp;
	local m = Instance.new("UIListLayout");
	m.Padding = UDim.new(0, 5);
	m.SortOrder = Enum.SortOrder.LayoutOrder;
	m.Parent = c;
	local D = Instance.new("UIPadding");
	D.PaddingBottom = UDim.new(0, 10);
	D.Parent = c;
	c:SetAttribute("O", 0);
	Gp[w] = c;
	local y = Instance.new("TextButton");
	y.Size = UDim2.new(1, 0, 0, 28);
	y.BackgroundColor3 = Color3.fromRGB(22, 22, 30);
	y.Text = w;
	y.TextColor3 = f;
	y.TextSize = 12;
	y.Font = U;
	y.Parent = Up;
	(Instance.new("UICorner", y)).CornerRadius = UDim.new(0, 6);
	y.MouseButton1Click:Connect(function()
		Sp(w);
	end);
	Qp[w] = y;
	return c;
end;
local function Fp(w)
	local c = ((w:GetAttribute("O") or 0)) + 1;
	w:SetAttribute("O", c);
	return c;
end;
local function Vp(w, c)
	local m = Instance.new("TextLabel");
	m.LayoutOrder = Fp(w);
	m.Size = UDim2.new(1, 0, 0, 16);
	m.BackgroundTransparency = 1;
	m.Text = string.upper(c);
	m.TextColor3 = E;
	m.TextSize = 11;
	m.Font = U;
	m.TextXAlignment = Enum.TextXAlignment.Left;
	m.Parent = w;
end;
local function pp(w, c, m)
	local D = Instance.new("Frame");
	D.LayoutOrder = Fp(w);
	D.Size = UDim2.new(1, 0, 0, 32);
	D.BackgroundColor3 = h;
	D.BorderSizePixel = 0;
	D.Parent = w;
	(Instance.new("UICorner", D)).CornerRadius = UDim.new(0, 8);
	local y = Instance.new("TextLabel");
	y.Size = UDim2.new(1, -55, 1, 0);
	y.Position = UDim2.new(0, 10, 0, 0);
	y.BackgroundTransparency = 1;
	y.Text = c;
	y.TextColor3 = C;
	y.TextSize = 12;
	y.Font = U;
	y.TextXAlignment = Enum.TextXAlignment.Left;
	y.Parent = D;
	local j = Instance.new("TextButton");
	j.Size = UDim2.new(0, 40, 0, 18);
	j.Position = UDim2.new(1, -48, .5, -9);
	j.BackgroundColor3 = J[m] and E or Color3.fromRGB(45, 45, 58);
	j.Text = "";
	j.Parent = D;
	(Instance.new("UICorner", j)).CornerRadius = UDim.new(1, 0);
	local M = Instance.new("Frame");
	M.Size = UDim2.new(0, 14, 0, 14);
	M.Position = J[m] and UDim2.new(1, -16, .5, -7) or UDim2.new(0, 2, .5, -7);
	M.BackgroundColor3 = Color3.new(1, 1, 1);
	M.BorderSizePixel = 0;
	M.Parent = j;
	(Instance.new("UICorner", M)).CornerRadius = UDim.new(1, 0);
	j.MouseButton1Click:Connect(function()
		J[m] = not J[m];
		local w = J[m];
		j.BackgroundColor3 = w and E or Color3.fromRGB(45, 45, 58);
		M.Position = w and UDim2.new(1, -16, .5, -7) or UDim2.new(0, 2, .5, -7);
		if m == "ESP" then
			ap();
		end;
		if m == "Hitbox" and not w then
			W();
		end;
		if m == "DeviceSpoof" and w then
			Op();
		end;
		if m == "Potato" then
			Ep(w);
		end;
		if m == "CustomFOV" then
			if w then
				p();
			else
				pcall(function()
					n.FieldOfView = V;
				end);
			end;
		end;
		if m == "MobileAim" and w then
			J.Aimbot = true;
		end;
		if m == "KillAura" and not w then
			jp = nil;
		end;
		N();
		A();
	end);
end;
local function ip(w, c, D, y, j, M)
	local K = Instance.new("Frame");
	K.LayoutOrder = Fp(w);
	K.Size = UDim2.new(1, 0, 0, 46);
	K.BackgroundColor3 = h;
	K.BorderSizePixel = 0;
	K.Parent = w;
	(Instance.new("UICorner", K)).CornerRadius = UDim.new(0, 8);
	local z = Instance.new("TextLabel");
	z.Size = UDim2.new(.65, 0, 0, 16);
	z.Position = UDim2.new(0, 10, 0, 4);
	z.BackgroundTransparency = 1;
	z.Text = c;
	z.TextColor3 = C;
	z.TextSize = 11;
	z.Font = U;
	z.TextXAlignment = Enum.TextXAlignment.Left;
	z.Parent = K;
	local n = Instance.new("TextLabel");
	n.Size = UDim2.new(.3, -8, 0, 16);
	n.Position = UDim2.new(.7, 0, 0, 4);
	n.BackgroundTransparency = 1;
	n.Text = tostring(J[D]);
	n.TextColor3 = E;
	n.TextSize = 11;
	n.Font = U;
	n.TextXAlignment = Enum.TextXAlignment.Right;
	n.Parent = K;
	local g = Instance.new("TextButton");
	g.Size = UDim2.new(1, -20, 0, 8);
	g.Position = UDim2.new(0, 10, 0, 26);
	g.BackgroundColor3 = Color3.fromRGB(40, 40, 55);
	g.Text = "";
	g.Parent = K;
	(Instance.new("UICorner", g)).CornerRadius = UDim.new(1, 0);
	local o = Instance.new("Frame");
	o.Size = UDim2.new(math.clamp(((J[D] - y)) / math.max(j - y, .001), 0, 1), 0, 1, 0);
	o.BackgroundColor3 = E;
	o.BorderSizePixel = 0;
	o.Parent = g;
	(Instance.new("UICorner", o)).CornerRadius = UDim.new(1, 0);
	local function T(w)
		local c = math.clamp(((w - g.AbsolutePosition.X)) / math.max(g.AbsoluteSize.X, 1), 0, 1);
		local m = y + c * ((j - y));
		m = math.floor(m / M + .5) * M;
		m = math.clamp(m, y, j);
		J[D] = m;
		o.Size = UDim2.new(((m - y)) / math.max(j - y, .001), 0, 1, 0);
		n.Text = tostring(m);
		if D == "CursorSize" then
			S.Size = UDim2.new(0, m, 0, m);
		end;
		if D == "FOVValue" and J.CustomFOV then
			p();
		end;
		N();
	end;
	g.MouseButton1Down:Connect(function()
		local w, c;
		w = m.InputChanged:Connect(function(w)
				if w.UserInputType == Enum.UserInputType.MouseMovement or w.UserInputType == Enum.UserInputType.Touch then
					T(w.Position.X);
				end;
			end);
		c = m.InputEnded:Connect(function(m)
				if m.UserInputType == Enum.UserInputType.MouseButton1 or m.UserInputType == Enum.UserInputType.Touch then
					if w then
						w:Disconnect();
					end;
					if c then
						c:Disconnect();
					end;
				end;
			end);
		T((m:GetMouseLocation()).X);
	end);
end;
local function Zp(w, c, m, D)
	local y = Instance.new("Frame");
	y.LayoutOrder = Fp(w);
	y.Size = UDim2.new(1, 0, 0, 32);
	y.BackgroundColor3 = h;
	y.BorderSizePixel = 0;
	y.Parent = w;
	(Instance.new("UICorner", y)).CornerRadius = UDim.new(0, 8);
	local j = Instance.new("TextLabel");
	j.Size = UDim2.new(.4, 0, 1, 0);
	j.Position = UDim2.new(0, 10, 0, 0);
	j.BackgroundTransparency = 1;
	j.Text = c;
	j.TextColor3 = C;
	j.TextSize = 12;
	j.Font = U;
	j.TextXAlignment = Enum.TextXAlignment.Left;
	j.Parent = y;
	local M = 1;
	for w, c in ipairs(D) do
		if c == J[m] then
			M = w;
		end;
	end;
	local K = Instance.new("TextButton");
	K.Size = UDim2.new(.55, -12, 0, 22);
	K.Position = UDim2.new(.45, 0, .5, -11);
	K.BackgroundColor3 = Color3.fromRGB(35, 32, 48);
	K.Text = tostring(J[m]);
	K.TextColor3 = E;
	K.TextSize = 11;
	K.Font = U;
	K.Parent = y;
	(Instance.new("UICorner", K)).CornerRadius = UDim.new(0, 6);
	K.MouseButton1Click:Connect(function()
		M = M % #D + 1;
		J[m] = D[M];
		K.Text = D[M];
		if m == "CursorName" then
			F(J.CursorName);
		end;
		if m == "DeviceMode" and J.DeviceSpoof then
			Op();
		end;
		if m == "HitboxPart" then
			W();
		end;
		N();
		A();
	end);
end;
local function Lp(w, c, m, D)
	local y = Instance.new("Frame");
	y.LayoutOrder = Fp(w);
	y.Size = UDim2.new(1, 0, 0, 52);
	y.BackgroundColor3 = h;
	y.BorderSizePixel = 0;
	y.Parent = w;
	(Instance.new("UICorner", y)).CornerRadius = UDim.new(0, 8);
	local j = Instance.new("TextLabel");
	j.Size = UDim2.new(1, -16, 0, 14);
	j.Position = UDim2.new(0, 10, 0, 4);
	j.BackgroundTransparency = 1;
	j.Text = c;
	j.TextColor3 = f;
	j.TextSize = 11;
	j.Font = U;
	j.TextXAlignment = Enum.TextXAlignment.Left;
	j.Parent = y;
	local M = Instance.new("TextBox");
	M.Size = UDim2.new(1, -20, 0, 22);
	M.Position = UDim2.new(0, 10, 0, 22);
	M.BackgroundColor3 = Color3.fromRGB(14, 14, 20);
	M.BorderSizePixel = 0;
	M.Text = tostring(J[m] or D or "");
	M.PlaceholderText = D or "";
	M.TextColor3 = C;
	M.TextSize = 12;
	M.Font = U;
	M.ClearTextOnFocus = false;
	M.Parent = y;
	(Instance.new("UICorner", M)).CornerRadius = UDim.new(0, 6);
	M.FocusLost:Connect(function()
		local w = M.Text;
		if not w or w == "" then
			w = D or "default";
			M.Text = w;
		end;
		J[m] = w;
		N();
	end);
end;
local function xp(w, c, m)
	local D = Instance.new("TextButton");
	D.LayoutOrder = Fp(w);
	D.Size = UDim2.new(1, 0, 0, 30);
	D.BackgroundColor3 = Color3.fromRGB(35, 30, 55);
	D.Text = c;
	D.TextColor3 = E;
	D.TextSize = 12;
	D.Font = U;
	D.Parent = w;
	(Instance.new("UICorner", D)).CornerRadius = UDim.new(0, 8);
	D.MouseButton1Click:Connect(function()
		m();
		A();
	end);
end;
local ep = vp("Combat");
local Ip = vp("Player");
local qp = vp("Stream");
local bp = vp("Staff");
local up = vp("Mobile");
local Pp = vp("Visuals");
local kp = vp("Config");
Vp(ep, "Aimbot");
pp(ep, "Aimbot", "Aimbot");
Zp(ep, "Key", "AimKey", {
	"MB1",
	"MB2",
	"E",
	"Q",
	"F",
});
Zp(ep, "Mode", "AimMode", { "Hold", "Toggle", "Always" });
ip(ep, "FOV", "AimFOV", 40, 350, 1);
ip(ep, "Smooth", "AimSmooth", .1, 1, .05);
pp(ep, "Show FOV", "ShowFOV");
pp(ep, "Wall Check", "WallCheck");
pp(ep, "Team Check", "TeamCheck");
pp(ep, "Prediction", "Prediction");
ip(ep, "Predict", "PredictAmount", 0, .35, .01);
Vp(ep, "Triggerbot");
pp(ep, "Triggerbot", "Triggerbot");
ip(ep, "Trigger FOV", "TriggerFOV", 15, 150, 1);
ip(ep, "Trigger Delay", "TriggerDelay", .03, .25, .01);
Vp(ep, "Kill Aura");
pp(ep, "Kill Aura", "KillAura");
ip(ep, "Range", "KillAuraRange", 20, 200, 5);
ip(ep, "Behind Dist", "KillAuraBehind", 1.5, 8, .1);
Vp(ep, "Camera FOV");
pp(ep, "Custom FOV", "CustomFOV");
ip(ep, "FOV Value", "FOVValue", 40, 120, 1);
Vp(ep, "Hitbox Expand");
pp(ep, "Hitbox Expand", "Hitbox");
Zp(ep, "Part", "HitboxPart", { "Head", "Torso" });
ip(ep, "Size", "HitboxSize", 1.5, 10, .5);
Vp(Ip, "Move");
pp(Ip, "Speed", "Speed");
ip(Ip, "Speed Value", "SpeedValue", 16, 80, 1);
pp(Ip, "Noclip", "Noclip");
pp(Ip, "Anti-Bow", "AntiBow");
Vp(Ip, "Device");
pp(Ip, "Device Spoof", "DeviceSpoof");
Zp(Ip, "Mode", "DeviceMode", { "Console", "Desktop", "Mobile" });
ip(Ip, "Delay", "DeviceSpoofDelay", .5, 5, .1);
xp(Ip, "Apply Device", Op);
Vp(qp, "Stream");
pp(qp, "Stream Proof", "StreamProof");
Lp(qp, "Name", "SpoofName", "Player");
pp(qp, "Verified", "ShowVerified");
Vp(bp, "Staff");
pp(bp, "Detect", "StaffDetect");
pp(bp, "Leave", "StaffLeave");
Vp(up, "Mobile Aim");
pp(up, "Mobile Aim ON", "MobileAim");
ip(up, "Smooth", "MobileSmooth", .1, 1, .05);
ip(up, "FOV", "MobileFOV", 40, 350, 1);
pp(up, "Show FOV", "MobileShowFOV");
Vp(Pp, "ESP");
pp(Pp, "ESP Enabled", "ESP");
pp(Pp, "Boxes", "ShowBoxes");
Zp(Pp, "Box Style", "BoxStyle", { "Corner", "Full", "Both" });
pp(Pp, "Names", "ShowNames");
pp(Pp, "Distance", "ShowDistance");
pp(Pp, "Health", "ShowHealth");
pp(Pp, "Head Dot", "ShowHeadDot");
xp(Pp, "Force Refresh ESP", ap);
Vp(Pp, "ESP Color");
pp(Pp, "RGB ESP", "RGBESP");
ip(Pp, "Red", "ESPColorR", 0, 255, 1);
ip(Pp, "Green", "ESPColorG", 0, 255, 1);
ip(Pp, "Blue", "ESPColorB", 0, 255, 1);
Vp(Pp, "Radar");
pp(Pp, "Radar", "Radar");
ip(Pp, "Radar Size", "RadarSize", 80, 220, 5);
ip(Pp, "Radar Range", "RadarRange", 50, 400, 10);
Vp(Pp, "Cursor");
Zp(Pp, "Cursor", "CursorName", G);
ip(Pp, "Cursor Size", "CursorSize", 8, 128, 1);
for w, c in ipairs(Y) do
	xp(Pp, c.Name, function()
		F(c.Name);
		N();
	end);
end;
Vp(kp, "Config");
Lp(kp, "Name", "ConfigName", "default");
xp(kp, "Save", N);
xp(kp, "Load", function()
	H();
end);
pp(kp, "FPS + MS", "ShowPerf");
pp(kp, "Potato", "Potato");
Sp("Combat");
local tp, Wp, dp;
hp.InputBegan:Connect(function(w)
	if w.UserInputType == Enum.UserInputType.MouseButton1 or w.UserInputType == Enum.UserInputType.Touch then
		tp = true;
		Wp = w.Position;
		dp = Rp.Position;
	end;
end);
hp.InputEnded:Connect(function(w)
	if w.UserInputType == Enum.UserInputType.MouseButton1 or w.UserInputType == Enum.UserInputType.Touch then
		tp = false;
	end;
end);
m.InputChanged:Connect(function(w)
	if tp and ((w.UserInputType == Enum.UserInputType.MouseMovement or w.UserInputType == Enum.UserInputType.Touch)) then
		local c = w.Position - Wp;
		Rp.Position = UDim2.new(dp.X.Scale, dp.X.Offset + c.X, dp.Y.Scale, dp.Y.Offset + c.Y);
	end;
end);
fp.MouseButton1Click:Connect(function()
	Rp.Visible = false;
end);
m.InputBegan:Connect(function(w)
	if w.KeyCode == Enum.KeyCode.RightControl or w.KeyCode == Enum.KeyCode.LeftControl then
		Rp.Visible = not Rp.Visible;
		A();
	end;
end);
local w0 = {
		MB1 = Enum.UserInputType.MouseButton1,
		MB2 = Enum.UserInputType.MouseButton2,
		E = Enum.KeyCode.E,
		Q = Enum.KeyCode.Q,
		F = Enum.KeyCode.F,
	};
local c0 = false;
local m0;
local function D0(w)
	local c = w0[J.AimKey] or Enum.UserInputType.MouseButton2;
	if typeof(c) == "EnumItem" then
		if c.EnumType == Enum.UserInputType then
			return w.UserInputType == c;
		end;
		if c.EnumType == Enum.KeyCode then
			return w.KeyCode == c;
		end;
	end;
	return false;
end;
m.InputBegan:Connect(function(w, c)
	if not J.Aimbot or J.MobileAim then
		return;
	end;
	if not D0(w) then
		return;
	end;
	if J.AimMode == "Hold" then
		c0 = true;
	elseif J.AimMode == "Toggle" then
		c0 = not c0;
	end;
end);
m.InputEnded:Connect(function(w)
	if J.AimMode == "Hold" and D0(w) then
		c0 = false;
	end;
end);
local function y0(w)
	if m0 then
		m0:Disconnect();
		m0 = nil;
	end;
	if not w then
		local w = i(g);
		if w then
			for w, c in ipairs(w:GetDescendants()) do
				if c:IsA("BasePart") then
					c.CanCollide = true;
				end;
			end;
		end;
		return;
	end;
	m0 = D.Stepped:Connect(function()
			local w = i(g);
			if not w then
				return;
			end;
			for w, c in ipairs(w:GetDescendants()) do
				if c:IsA("BasePart") then
					c.CanCollide = false;
				end;
			end;
		end);
end;
task.spawn(function()
	while true do
		task.wait(.2);
		if J.AntiBow then
			pcall(function()
				local w = i(g);
				if not w then
					return;
				end;
				local c = w:FindFirstChild("HumanoidRootPart");
				local m = w:FindFirstChildOfClass("Humanoid");
				if not c or not m or m.Health <= 0 then
					return;
				end;
				local D = m:GetState();
				if D == Enum.HumanoidStateType.Jumping or D == Enum.HumanoidStateType.Freefall then
					return;
				end;
				if c.CFrame.UpVector:Dot(Vector3.yAxis) >= .92 then
					return;
				end;
				local y, j = c.CFrame:ToOrientation();
				c.CFrame = CFrame.new(c.Position) * CFrame.Angles(0, j, 0);
			end);
		end;
	end;
end);
task.spawn(function()
	while true do
		task.wait(.5);
		if J.StreamProof then
			local w = J.ShowVerified and (tostring(J.SpoofName) .. " \238\128\128") or tostring(J.SpoofName);
			pcall(function()
				g.DisplayName = w;
			end);
		end;
	end;
end);
local j0 = 33054943;
local M0 = {};
task.spawn(function()
	while true do
		task.wait(2);
		if J.StaffDetect then
			for w, c in ipairs(c:GetPlayers()) do
				if c ~= g then
					local w, m = pcall(function()
							return c:GetRankInGroup(j0);
						end);
					if w and (type(m) == "number" and m >= 51) then
						if not M0[c.UserId] then
							M0[c.UserId] = true;
							if J.StaffLeave then
								pcall(function()
									g:Kick("Staff");
								end);
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
local K0, z0, n0;
local function g0()
	if not O or K0 then
		return;
	end;
	K0 = gp("Circle");
	if K0 then
		K0.Filled = true;
		K0.Color = Color3.fromRGB(10, 10, 14);
		K0.Transparency = .35;
		K0.NumSides = 48;
		K0.Visible = false;
	end;
	z0 = gp("Circle");
	if z0 then
		z0.Filled = false;
		z0.Thickness = 1.5;
		z0.Color = E;
		z0.NumSides = 48;
		z0.Visible = false;
	end;
	n0 = {};
end;
local o0 = gp("Circle");
if o0 then
	o0.Thickness = 1;
	o0.NumSides = 40;
	o0.Filled = false;
	o0.Color = Color3.new(1, 1, 1);
	o0.Visible = false;
end;
local T0 = gp("Text");
if T0 then
	T0.Size = 15;
	T0.Outline = true;
	T0.Font = 2;
	T0.Visible = false;
end;
local a0, r0, J0, l0 = 0, tick(), 0, 0;
D.Heartbeat:Connect(function()
	local w = i(g);
	if w then
		local c = w:FindFirstChildOfClass("Humanoid");
		if J.Speed and (c and c.Health > 0) then
			c.WalkSpeed = J.SpeedValue or 24;
		end;
		if J.Noclip then
			if not m0 then
				y0(true);
			end;
		elseif m0 then
			y0(false);
		end;
	end;
	Ep(J.Potato == true);
	pcall(yp);
	pcall(zp);
end);
D.RenderStepped:Connect(function()
	a0 = a0 + 1;
	if tick() - r0 >= 1 then
		J0 = a0;
		a0 = 0;
		r0 = tick();
	end;
	if S.Visible then
		local w = m:GetMouseLocation();
		S.Position = UDim2.new(0, w.X, 0, w.Y);
	end;
	pcall(lp);
	l0 = l0 + 1;
	if l0 >= 2 then
		l0 = 0;
		pcall(wp);
	end;
	if J.ShowPerf and T0 then
		local w = 0;
		pcall(function()
			w = math.floor(j.Network.ServerStatsItem["Data Ping"]:GetValue());
		end);
		T0.Text = "FPS " .. (J0  .. ("  MS " .. w));
		T0.Position = Vector2.new(n.ViewportSize.X - 150, 10);
		T0.Color = E;
		T0.Visible = true;
	elseif T0 then
		T0.Visible = false;
	end;
	local w, D = false, J.AimFOV or 150;
	if J.MobileAim then
		w = J.MobileShowFOV;
		D = J.MobileFOV or 160;
	else
		w = J.ShowFOV and J.Aimbot;
		D = J.AimFOV or 150;
	end;
	if o0 then
		o0.Position = n.ViewportSize / 2;
		o0.Radius = D;
		o0.Visible = w;
		if J.RGBESP then
			o0.Color = s();
		end;
	end;
	local y, M, K = false, J.AimSmooth or .95, J.AimFOV or 150;
	if not J.KillAura then
		if J.MobileAim then
			y = true;
			M = J.MobileSmooth or .9;
			K = J.MobileFOV or 160;
		elseif J.Aimbot then
			y = c0 or J.AimMode == "Always";
			M = J.AimSmooth or .95;
			K = J.AimFOV or 150;
		end;
	end;
	if y then
		local w, c = u(K, true);
		if c then
			if M >= .98 then
				n.CFrame = CFrame.new(n.CFrame.Position, c);
			else
				n.CFrame = n.CFrame:Lerp(CFrame.new(n.CFrame.Position, c), math.clamp(M, .1, 1));
			end;
		end;
	end;
	if J.Radar and O then
		g0();
		local w = tonumber(J.RadarSize) or 140;
		local m = tonumber(J.RadarRange) or 200;
		local D = w / 2;
		local y = Vector2.new(20 + D, 20 + D);
		local j = s();
		if K0 then
			K0.Position = y;
			K0.Radius = D;
			K0.Visible = true;
		end;
		if z0 then
			z0.Position = y;
			z0.Radius = D;
			z0.Visible = true;
		end;
		local M = i(g) and (i(g)):FindFirstChild("HumanoidRootPart");
		local K = math.atan2(n.CFrame.LookVector.X, n.CFrame.LookVector.Z);
		local z = {};
		if M then
			for w, c in ipairs(c:GetPlayers()) do
				if c ~= g and (L(c) and Z(c)) then
					local w = i(c) and (i(c)):FindFirstChild("HumanoidRootPart");
					if w then
						local n = w.Position - M.Position;
						if n.Magnitude <= m then
							local w = n.X * math.cos(K) - n.Z * math.sin(K);
							local M = n.X * math.sin(K) + n.Z * math.cos(K);
							local g = D / m;
							local o, T = w * g, -M * g;
							if not n0[c] then
								local w = gp("Circle");
								if w then
									w.Filled = true;
									w.NumSides = 10;
									w.Radius = 3;
									n0[c] = w;
								end;
							end;
							local a = n0[c];
							if a then
								a.Position = Vector2.new(y.X + o, y.Y + T);
								a.Color = j;
								a.Visible = true;
							end;
							z[c] = true;
						end;
					end;
				end;
			end;
		end;
		for w, c in pairs(n0) do
			if not z[w] then
				pcall(function()
					if c then
						c.Visible = false;
					end;
				end);
			end;
		end;
	else
		if K0 then
			K0.Visible = false;
		end;
		if z0 then
			z0.Visible = false;
		end;
		if n0 then
			for w, c in pairs(n0) do
				pcall(function()
					if c then
						c.Visible = false;
					end;
				end);
			end;
		end;
	end;
end);
task.spawn(function()
	while true do
		task.wait(15);
		N();
	end;
end);
if J.CursorName and J.CursorName ~= "Off" then
	F(J.CursorName);
end;
if J.CustomFOV then
	p();
end;
if O then
	print("[Moon Hub] FULL | Kill Aura LOOP TP + head lock");
else
	warn("[Moon Hub] Drawing missing \226\128\148 ESP/Radar off on this executor");
end;

local config = {
	{ modifiers = { "alt" },          key = "1", bundleID = "com.github.wez.wezterm" },
	{ modifiers = { "alt" },          key = "2", bundleID = "app.zen-browser.zen" },
	{ modifiers = { "alt" },          key = "A", bundleID = "com.spotify.client" },
	{ modifiers = { "alt" },          key = "C", bundleID = "com.apple.iCal" },
	{ modifiers = { "alt" },          key = "S", bundleID = "org.zulip.zulip-electron" },
	{ modifiers = { "alt" },          key = "M", bundleID = "com.facebook.archon.developerID" },
	{ modifiers = { "alt", "shift" }, key = "M", bundleID = "com.apple.MobileSMS" },
	{ modifiers = { "alt" },          key = "N", bundleID = "notion.id" },
	{ modifiers = { "alt" },          key = "F", bundleID = "com.apple.finder" },
	{ modifiers = { "alt" },          key = "T", bundleID = "com.microsoft.teams2" },
	{ modifiers = { "alt" },          key = "8", bundleID = "org.mozilla.thunderbird" },
	{ modifiers = { "alt" },          key = "X", bundleID = "com.apple.dt.Xcode" },
	{ modifiers = { "alt" },          key = "9", bundleID = "org.jkiss.dbeaver.core.product" }
}
local bindings = {}

local function enableKeyBindings()
	for _, c in ipairs(config) do
		table.insert(bindings, hs.hotkey.bind(
			c["modifiers"],
			c["key"],
			function()
				hs.application.launchOrFocusByBundleID(c["bundleID"])
			end
		))
	end
end

local function disableKeybindings()
	for _, binding in ipairs(bindings) do
		binding:delete()
	end
	bindings = {}
end

local function checkAeroSpace()
	local _, isRunning = hs.execute("pgrep -x AeroSpace", true)

	if isRunning and next(bindings) ~= nil then
		disableKeybindings()
	elseif not isRunning and next(bindings) == nil then
		enableKeyBindings()
	end
end

-- AeroSpace launched and terminated events are not detected thus I need use a
-- timer.
hs.timer.doEvery(10, checkAeroSpace)

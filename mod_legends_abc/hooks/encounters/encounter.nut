// Add tooltip support to Legends encounters (Vanilla already does this for events)
::mods_hookExactClass("encounters/encounter", function (o) {
	
	local getUIButtons = o.getUIButtons;
	o.getUIButtons = function () {
		local buttons = getUIButtons();
		foreach (b in buttons) {
			local option = this.m.ActiveScreen.Options[b.id];
			if (b.text == option.Text) { // only continue if it's the correct option
				if ("Icon" in option) {
					if ("icon" in b) {
						::LABC.logWarning("Legends seems to already support encounter Icons and this is redundant");
					} else {
						b.icon <- option.Icon;
					}
				}
				if ("Tooltip" in option) {
					if ("tooltip" in b) {
						::LABC.logWarning("Legends seems to already support encounter Tooltips and this is redundant");
					} else {
						b.tooltip <- ::LABC.patchTooltip(option.Tooltip); // support Legends-style tooltip text parameterisation
					}
				}
			} else {
				::LABC.logError("Mismatch of encounter buttons with options");
			}
		}
		return buttons;
	};

	local setScreen = o.setScreen;
	o.setScreen = function(_screen, _restartIfAlreadyActive = true) {
		setScreen(_screen, _restartIfAlreadyActive);
		foreach (i, option in this.m.ActiveScreen.Options) {
			local screenOption = _screen.Options[i];
			if ("Tooltip" in screenOption) {
				option.Tooltip <- screenOption.Tooltip;
			}
		}
	};
});
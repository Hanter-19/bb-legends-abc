::mods_hookExactClass("events/event", function (o) {
	
	// Support Legends parameterisation of tooltip text in event tooltips
	local getUIButtons = o.getUIButtons;
	o.getUIButtons = function () {
		local buttons = getUIButtons();
		foreach (b in buttons) {
			if ("tooltip" in b) {
				b.tooltip = ::LABC.patchTooltip(b.tooltip);
			}
		}
		return buttons;
	};

});
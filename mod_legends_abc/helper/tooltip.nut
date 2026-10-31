// Copied from Legends hooks/ui/screens/tooltip/tooltip_events.nut
::LABC.patchTooltip <- function (_tooltip) {
	if (_tooltip == null) {
		return _tooltip;
	}
	foreach (entry in _tooltip) {
		if (entry == null) {
			continue;
		}
		if ("text" in entry) {
			entry.text = ::Legends.tooltip(entry.text, "param" in entry ? entry.param : []);
		}
	}
	return _tooltip;
};
::mods_hookNewObject("events/event_manager", function(o) {
	local processInput = o.processInput;
	o.processInput = function ( _option ) {
		processInput(_option);
		if (this.m.ActiveEvent == null) {
			::Time.scheduleEvent(::TimeUnit.Real, 500, function ( _tag ) {
					::LABC.Test.Events.runNextTest(); // Trigger the next test Event after we're done with the current one
				}, null);
		}
	}
});
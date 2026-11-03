::LABC.Test.Events <- {};

::LABC.Test.Events.Stack <- [];

::LABC.Test.Events.runNextTest <- function() {
	if (::LABC.Test.Events.Stack.len() > 0) {
		local e = ::LABC.Test.Events.Stack.pop();
		e.prepare();
		::World.Events.fire(e.ID, false);
	}
};

// Define Tests here
::LABC.Test.Events.TestDefs <- [
	{
		// Purpose: manually verify parameterised option tooltip text
		ID = "event.teamplayer_is_bro",
		prepare = function () {
			::World.Events.getEvent("event.teamplayer_is_bro").m.Teamplayer = ::World.getPlayerRoster().getAll()[0];
		}
	}
];

foreach (t in ::LABC.Test.Events.TestDefs) {
	::LABC.Test.Events.Stack.push(t);
}
::mods_hookExactClass("events/events/dlc2/teamplayer_is_bro_event", function(o) {
	local create = o.create;
	o.create = function() {
		create();
		::Legends.Screens.hook(this, "A", function (_screen) {
			// Test events tooltips
				local t = _screen.Options[0];
				t.Text = "foo";
				// t.Icon = "ui/icons/special.png";
				local tt = [];
				tt.push({
					id = 1,
					type = "title",
					text = "Test Title"
				});
				tt.push({
					id = 2,
					type = "description",
					text = "Test Description"
				});
				tt.push({
					id = 3,
					type = "text",
					icon = "ui/icons/fatigue.png",
					text = "Test Text"
				});
				tt.push({
					id = 4,
					type = "hint",
					icon = "ui/icons/special.png",
					text = "Test Hint"
				});
				tt.push({
					id = 5,
					type = "hint",
					icon = "ui/icons/special.png",
					text = "Test Hint with %p%",
					param = [
						["p", "parameters"]
					]
				});
				t.Tooltip <- tt;
		});
	}
});
::LABC <- {
	Version = "0.1.0",
	ID = "mod_legends_abc",
	Name = "Legends ABC"
}

::mods_registerMod(::LABC.ID, ::LABC.Version, ::LABC.Name);

::mods_queue(::LABC.ID, "mod_msu(>=1.9.0), mod_legends(>=19.5.0)", function() {
	::LABC.Mod <- ::MSU.Class.Mod(::LABC.ID, ::LABC.Version, ::LABC.Name);
	::LABC.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Hanter-19/bb-legends-abc");
	::LABC.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

    foreach (dir in [
        "mod_legends_abc/hooks"
    ]) {
        foreach (file in ::IO.enumerateFiles(dir)) {
            ::include(file);
        }
    }

	// MSU Logging Convenience
	::LABC.Mod.Debug.enable();
	::LABC.log <- ::LABC.Mod.Debug.printLog;
	::LABC.logWarning <- ::LABC.Mod.Debug.printWarning;
	::LABC.logError <- ::LABC.Mod.Debug.printError;
});
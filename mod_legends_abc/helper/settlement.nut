::LABC.getNearestHumanSettlement <- function ( _tile ) {
	local bestDist = 9000;
	local ret;

	foreach(s in ::World.EntityManager.getSettlements()) {
		local d = _tile.getDistanceTo(s.getTile());

		if (d < bestDist)
		{
			bestDist = d;
			ret = s;
		}
	}

	return ret;
}

::LABC.getNearestHumanSettlementToPlayer <- function () {
	local myTile = ::World.State.getPlayer().getTile();
	return ::LABC.getNearestHumanSettlement(myTile);
}

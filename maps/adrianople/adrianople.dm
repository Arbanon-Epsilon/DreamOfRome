#if !defined(using_map_DATUM)
	#include "../adrianople/adrianople_areas.dm"
	#include "../oldfare/jobs/captain_verbs.dm"
	#include "../oldfare/jobs/warfare_jobs.dm"
	#include "../oldfare/jobs/soldiers.dm"
	#include "../oldfare/jobs/fortress.dm"
	#include "../oldfare/jobs/blue/blue_fortress.dm"
	#include "../oldfare/jobs/blue/blue_soldiers.dm"
	#include "../oldfare/jobs/red/red_fortress.dm"
	#include "../oldfare/jobs/red/red_soldiers.dm"
	#include "../oldfare/warfare_items.dm"
	#include "../shared/items/clothing.dm"
	#include "../shared/items/cards_ids.dm"

	#include "adrianople.dmm"

	#include "../../code/modules/lobby_music/siegefare_songs.dm" //CHANGE THE MUSIC

	#define using_map_DATUM /datum/map/adrianople
#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif

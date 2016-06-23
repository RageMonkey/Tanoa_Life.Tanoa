/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\marijuana.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_rabbit": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\fish.paa")};
	case "life_inv_ornate": {("icons\items\fish.paa")};
	case "life_inv_mackerel": {("icons\items\fish.paa")};
	case "life_inv_tuna": {("icons\items\fish.paa")};
	case "life_inv_mullet": {("icons\items\fish.paa")};
	case "life_inv_catshark": {("icons\items\fish.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\items\fishingpoles.paa")};
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\items\donut.paa")};
	case "life_inv_fuelE": {("icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\items\salt.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_diamond": {("icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("icons\items\diamond.paa")};
	case "life_inv_tbacon": {("icons\items\meat.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_coke": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikestrip.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("icons\items\storagebig.paa")};
	case "life_inv_zipties": {("icons\items\ziptie.paa")};
	case "life_inv_kidney": {("icons\items\kidney.paa")};
	case "life_inv_scalpel": {("icons\items\scalpel.paa")};
	case "life_inv_antiairfuel": {("icons\items\fuel_killer.paa")};
	case "life_inv_antiairfuelammo": {("icons\items\fuel_missile.paa")};
	case "life_inv_yeast": {("icons\items\yeast.paa")};
	case "life_inv_rye": {("icons\items\rye.paa")};
	case "life_inv_hops": {("icons\items\hops.paa")};
	case "life_inv_whiskey": {("icons\items\whiskey.paa")};
	case "life_inv_beerp": {("icons\items\beer.paa")};
	case "life_inv_bottles": {("icons\items\bottle.paa")};
	case "life_inv_bottledwhiskey": {("icons\items\bottlewhiskey.paa")};
	case "life_inv_bottledbeer": {("icons\items\bottlebeer.paa")};
	case "life_inv_bottledshine": {("icons\items\bottlemoonshine.paa")};
	case "life_inv_moonshine": {("icons\items\moonshine.paa")};
	case "life_inv_wine": {("icons\items\goon.paa")};
	case "life_inv_grapes": {("icons\items\grapes.paa")};
	case "life_inv_handcuffs": {("icons\items\handcuffs.paa")};
	case "life_inv_handcuffkeys": {("icons\items\handcuffkeys.paa")};
	case "life_inv_tobacco": {("icons\items\tobacco.paa")};
	case "life_inv_cigarette": {("icons\items\cigar.paa")};
	case "life_inv_uwsl": {("icons\items\depthcharge.paa")};
	case "life_inv_cone": {("icons\items\cone.paa")};
	case "life_inv_barrier": {("icons\items\barrier.paa")};
	case "life_inv_chainsaw": {("icons\items\chainsaw.paa")};
	case "life_inv_wood": {("icons\items\lumber.paa")};
	case "life_inv_timber": {("icons\items\timber.paa")};
	case "life_inv_bdiamond": {("icons\items\bdu.paa")};
	case "life_inv_bdiamondc": {("icons\items\bdp.paa")};
	case "life_inv_prayer": {("icons\items\radaway.paa")};
	case "life_inv_uranium": {("icons\items\uranium.paa")};
	case "life_inv_uraniumr": {("icons\items\uraniumr.paa")};
	case "life_inv_pills": {("icons\items\pills.paa")};
	case "life_inv_chemicals": {("icons\items\chemicals.paa")};
	case "life_inv_ecstasy": {("icons\items\ecstasy.paa")};
	case "life_inv_petrol": {("icons\items\petrol.paa")};
	case "life_inv_petrolp": {("icons\items\petrolp.paa")};
	case "life_inv_paracetamol": {("icons\items\paracetamol.paa")};
	case "life_inv_panadol": {("icons\items\panadol.paa")};
	case "life_inv_alienhead": {("icons\items\alienhead.paa")};
};
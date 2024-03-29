/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_antiairfuel": {"AA Fuel Mk1"};
	case "life_inv_antiairfuelammo": {"AA Fuel Mk1 Ammo"};
	case "life_inv_zipties": {"Zip Tie"};
	case "life_inv_kidney": {"Black Market Kidney"}; 
	case "life_inv_scalpel": {"Scalpel"}; 
	case "life_inv_yeast": {"Yeast"};
	case "life_inv_rye": {"Rye"};
	case "life_inv_hops": {"Hops"};
	case "life_inv_whiskey": {"Distilled Whiskey"};
	case "life_inv_beerp": {"Fermented Beer"};
	case "life_inv_bottles": {"Glass Bottles"};
	case "life_inv_bottledwhiskey": {"Bottled Whiskey"};
	case "life_inv_bottledbeer": {"Bottled Beer"};
	case "life_inv_bottledshine": {"Bottled Moonshine"};
	case "life_inv_moonshine": {"Distilled Moonshine"};
	case "life_inv_wine": {"Goon"};
	case "life_inv_grapes": {"Grapes"};
	case "life_inv_handcuffs": {(localize "STR_Item_Handcuffs")};
    case "life_inv_handcuffkeys": {(localize "STR_Item_Handcuffkeys")};
	case "life_inv_tobacco": {"Tobacco"};
	case "life_inv_cigarette": {"Cigar"};
	case "life_inv_uwsl": {"Depth Charge"}; 
	case "life_inv_cone": {"Traffic Cone"};
	case "life_inv_barrier": {"Traffic Barrier"};
	case "life_inv_wood": {"Lumber"};
	case "life_inv_timber": {"Timber"};
	case "life_inv_chainsaw": {"Chainsaw"};
	case "life_inv_uranium": {("Uranium")};
	case "life_inv_uraniumr": {("Refined Uranium")};
	case "life_inv_prayer": {("RadAway")};
    case "life_inv_bdiamond": {("Uncut Blood Diamond")};
	case "life_inv_bdiamondc": {("Cut Blood Diamond")};
	case "life_inv_pills": {("Unprocessed Pills")};
	case "life_inv_chemicals": {("Illegal Chemicals")};
	case "life_inv_ecstasy": {("Ecstasy Pills")};
	case "life_inv_panadol": {("Panadol")};
	case "life_inv_paracetamol": {("Paracetamol")};
	case "life_inv_petrol": {("Hydrogen")};
	case "life_inv_petrolp": {("Refined Hydrogen")};
	case "life_inv_alienhead": {"Alien Head"}; 
	
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_stiller": {"Distillers License"};
	case "license_civ_liquor": {"Liquor License"};
	case "license_civ_bottler": {"Bottling License"};
	case "license_civ_grapes": {"Wine Making Training"};
	case "license_civ_moonshine": {"Moonshine Training"};
	case "license_civ_cigarette": {"Cigar Rolling Training"};
	case "license_civ_shipwreck": {"Salvage License"};
	case "license_civ_bounty": {"Bounty Hunter License"};
	case "license_civ_lumber": {"Lumber Training"};
	case "license_civ_treelopping": {"Tree Lopping License"};
	case "license_civ_rifle": {"Rifle License"};
    case "license_civ_uranium": {"Uranium License"};
    case "license_civ_bdiamond": {"Blood Diamond License"};
	case "license_civ_ecstasy": {"Ecstasy License"};
	case "license_civ_panadol": {"Panadol License"};
	case "license_civ_petrol": {"Hydrogen License"};
};

/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","rabbit","apple","redgull","tbacon","lockpick","chainsaw","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","bottles","uwsl"]]};
	case "rebel": {["Rebel Market",["water","redgull","tbacon","lockpick","fuelF","boltcutter","blastingcharge","scalpel","handcuffs","handcuffkeys"]]};
	case "gang": {["Gang Market",["water","redgull","tbacon","lockpick","fuelF","boltcutter","blastingcharge","scalpel","handcuffs","handcuffkeys"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","cone","barrier","water","rabbit","apple","redgull","fuelF","defusekit","antiairfuel","antiairfuelammo"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "organ": {["Organ Dealer",["kidney","scalpel"]]}; 
	case "beer": {["Liqour Store",["wine","bottledbeer","bottledwhiskey","bottles"]]};
	case "bar": {["The Lounge",["bottledbeer","bottledwhiskey","bottles"]]};
	case "speakeasy": {["Speakeasy's",["bottledwhiskey","bottledshine","bottledbeer","bottles"]]};
	case "salvage": {["Salvage Shop",["uwsl","water","tbacon"]]};
	case "bunnings": {["Bunnings",["timber","pliers","fuelF","storagesmall","storagebig","pickaxe","chainsaw"]]};
    case "uranium": {["Uranium Specialist",["uraniumr","pickaxe","prayer"]]};
    case "bdiamond": {["Altis Blood Diamond Trader",["bdiamondc","bdiamond"]]};
	case "pills": {["Altis Pharmacy",["pills","panadol","prayer","paracetamol"]]};
	case "chemicals": {["Altis Wholesale Cleaning Supplies",["chemicals"]]};
	case "ecstasy": {["The Matrix Club Owner",["ecstasy"]]};
	case "petrol": {["Altis Hydrogen Suppliers",["petrolp"]]};
	case "xcom": {["XCOM Operative",["alienhead"]]};
};
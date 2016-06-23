/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		// license_civ_rebel = false;
		// license_civ_driver = false;
		// license_civ_heroin = false;
		// license_civ_marijuana = false;
		// license_civ_coke = false;
	};
	
	//Jail licenses
	case 1:
	{
		// license_civ_gun = false;
		// license_civ_rebel = false;
		// license_civ_driver = false;
	};
	
	// Land vehicular manslaughter
	case 2:
	{
		if(license_civ_driver OR license_civ_truck) then {
			license_civ_driver = false;
			license_civ_truck = false;
			hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then {
			license_civ_gun = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
		
		if(license_civ_rifle) then {
			license_civ_rifle = false;
			hint localize "STR_Civ_LicenseRemove_2";
		};
		
	};
	
	// Air vehicular manslaughter
	case 4:
	{
		if(license_civ_air) then {
			// license_civ_air = false;
		};
	};
	
	// Boat vehicular manslaughter
	case 5:
	{
		if(license_civ_boat) then {
			// license_civ_boat = false;
		};
	};
};
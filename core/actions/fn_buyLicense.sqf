/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_RoT_money < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

life_RoT_money = life_RoT_money - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];

if((_license select 0) == "license_civ_rebel") then {
	[[player,false,playerSide,license_civ_rebel],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
	if(life_sidechat) then {
		[[player,true,playerSide,license_civ_rebel],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
	};
};
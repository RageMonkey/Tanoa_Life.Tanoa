#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
#define MESSAGE "You are prohibited from shooting inside a safezone!"
#define MESSAGEBH "Unauthorised Weapon Access...Terminating User... Have a Nice Day.."

private["_ammoType","_projectile","_handled","_curWeapon"];

if (isDedicated) exitWith {};
waitUntil {!isNull player};

_handled = false;
if(playerSide != west) then {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count (__GETC__(life_safe_points)) > 0) then {
		deleteVehicle (_this select 6);
		titleText [MESSAGE, "PLAIN", 3];
		_handled = true; 
	};
};

//Enslaved Cops
if(playerSide == west) then {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count (__GETC__(life_safe_points)) > 0) then {
		if(player distance (getMarkerPos "slave_trader_center") < 50) then
		{	
			if (life_enslaved) then
			{
				deleteVehicle (_this select 6);
				titleText [MESSAGE, "PLAIN", 3];
				_handled = true; 
			};
		};
	};
};

//Bounty Hunter Weapon
_curWeapon = currentWeapon player;
if(_curWeapon in ["srifle_DMR_04_Tan_F","srifle_DMR_04_F"]) then {
	if(!license_civ_bounty) then {
		titleText [MESSAGEBH, "PLAIN", 3];
		[player,player] spawn life_fnc_tranq;
		_handled = true;
	};
};


if(_handled) exitWith {};

_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] spawn life_fnc_MP;
	};
};
#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_member")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_member: %3",life_adminlevel,life_coplevel,life_member]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Parse basic player information.
life_RoT_money = parseNumber (_this select 2);
life_RoT_atm = parseNumber (_this select 3);
life_log_cashflow = life_RoT_money + life_RoT_atm;
life_log_opening = life_RoT_money + life_RoT_atm;

__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_member,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

life_gear = _this select 8;
[] call life_fnc_loadGear;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
		life_missing_organ = _this select 10;
		life_enslaved = _this select 11;
		life_spawn_points = _this select 12;
		
		life_trn_r = _this select 13;
		life_trn_s = _this select 14;
		life_trn_h = _this select 15;
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		life_missing_organ = _this select 9;
		life_enslaved = _this select 10;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		life_houses = _this select 11;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _This select 12;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
		
		life_gangBasesData = _This select 14;
		life_player_bases = [];
		{			
			_gangMarker = _x select 0;
			life_player_bases pushBack _gangMarker;
		} foreach life_gangBasesData;
		
		
		life_all_bases = _this select 15;
		{			
			_markerName = _x select 0;
			_owned = _x select 2;
			_logo = _x select 3;
			
			if (_owned != 0) then {
				life_owned_bases pushBack _markerName;
			};
			
			_gangBaseBillBoard = missionNamespace getVariable [_markerName + "_billboard" , objNull];
			if (_gangBaseBillBoard != objNull) then {
				_gangBaseBillBoard setObjectTexture [0, "textures\civ\gang\" + _logo];
			};
			
		} foreach life_all_bases;
		
		life_spawn_points = _this select 16;
		
		life_trn_r = _this select 17;
		life_trn_s = _this select 18;
		life_trn_h = _this select 19;
		
		life_bounty_contracts = [];
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		life_missing_organ = _this select 9;
		life_enslaved = _this select 10;
		life_spawn_points = _this select 11;
		
		life_trn_r = _this select 12;
		life_trn_s = _this select 13;
		life_trn_h = _this select 14;
	};
};

if(count (_this select 13) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 13);
};

life_session_completed = true;
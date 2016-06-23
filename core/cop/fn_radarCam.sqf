#include <macro.h>
/* 
	File:fn_radarCam.sqf
	author: [midgetgrimm]
	Flash/Basic premise idea from preller, trigger function from shems and Yuka for the waitUntil <3
	Runs cams on map for speeders, if speed too many times diff shit happens
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};
private ["_limit","_speed","_driver","_speedover","_wanted"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _driver == civilian) then {
            
			cutText["!!! You have been caught speeding !!!","WHITE OUT"];
			0.00000001 cutFadeOut .01;
			sleep 5;
			0.00000001 cutFadeOut .01;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed],"PLAIN DOWN"]; titlefadeout 10;
					
			_wanted = "601";
			switch (true) do
			{
				case (_speed > 100): {_wanted = "605"}; // 50 Over
				case (_speed > 90): {_wanted = "604"}; // 40 Over
				case (_speed > 80): {_wanted = "603"}; // 30 Over
				case (_speed > 70): {_wanted = "602"}; // 20 Over
				case (_speed > 60): {_wanted = "601"}; // 10 Over
			};
			
			[[getPlayerUID _driver,name _driver,_wanted],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
};

//diag_log "Speed cam script done";//for logging
sleep 5;
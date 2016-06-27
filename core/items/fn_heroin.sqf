/*
    File: fn_heroin.sqf
    Author (inherited code): Kuchiha
	Reworked: RageMonkey

    Description:
    Heroin effects.
*/

//Close inventory
closeDialog 0;

//Player Message
hint "Board the Magic Carpet...";

sleep 3;

//Activate ppEffects we need

enableCamShake true;
_smoke = "SmokeShellRed" createVehicle position player;
_smoke1 = "SmokeShellRed" createVehicle position player;
    
if (vehicle player != player) then {
	if ((typeOf (vehicle player)) in ["B_G_Quadbike_01_F","B_Quadbike_01_F","C_Quadbike_01_F","I_Quadbike_01_F","O_Quadbike_01_F"]) then {
		_smoke attachTo [(vehicle player),[0,-0.2,0.1]];
		_smoke1 attachTo [(vehicle player),[0,-0.2,0.1]];
	} else {
		_smoke attachTo [(vehicle player),[-0.3,-0.08,-0.3]];
		_smoke1 attachTo [(vehicle player),[-0.3,-0.08,-0.3]];
	};
} else {
	_smoke attachTo [player,[0,0,0.1],"pelvis"];
	_smoke1 attachTo [player,[0,0,0.1],"pelvis"];
};	
	
player say3D "Heroin";
	
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
"radialBlur" ppEffectEnable true;
"radialBlur" ppEffectAdjust [0.02,0.02,0.15,0.15]; 
"radialBlur" ppEffectCommit 1;

private["_force"];
for "_i" from 0 to 11 do {
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
	"colorCorrections" ppEffectCommit 1;	
	sleep 2.25;
};

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
"radialBlur" ppEffectAdjust false;

player setDamage (0.2 + (damage player)):
[] call life_fnc_hudUpdate;
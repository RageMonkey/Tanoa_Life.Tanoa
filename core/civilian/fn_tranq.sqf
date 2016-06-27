/*
	File: fn_tranq.sqf
	Author: RageMonkey
	
	Description:
	Tranquiliser
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istranq = false;};


if(!life_istranq) then
{
	life_istranq= true;
	
	enableCamShake true;
	"colorCorrections" ppEffectEnable true; 
	"colorCorrections" ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; 
	"colorCorrections" ppEffectCommit 10;
	
	"filmGrain" ppEffectEnable true; 
	"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
	"filmGrain" ppEffectCommit 10;
	
	for "_i" from 0 to 59 do
	{
		if(_i > 30) then {
			"dynamicBlur" ppEffectAdjust [5]; 
			"dynamicBlur" ppEffectCommit 1; 
			
			"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.1,random 0.1,0.3,0.3];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 6, 2, random 6];
			sleep 1;
		} else {
			"chromAberration" ppEffectAdjust[0.16,random 0.16, true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.05,random 0.05,0.3,0.3];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 4, 2, random 4];
			sleep 1;
		};
	};
	
		
	//blackout
	"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,0], [1,1,1,1]]; 
	"colorCorrections" ppEffectCommit 10;
	
	player playMoveNow "Incapacitated";
	
	sleep 60;
	
	[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	
	//Stop effect
	"chromAberration" ppEffectAdjust [0,0,true];
	"chromAberration" ppEffectCommit 5;
	"radialBlur" ppEffectAdjust  [0,0,0,0];
	"radialBlur" ppEffectCommit 5;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 5;
	"filmgrain" ppEffectAdjust [0]; 
	"filmgrain" ppEffectCommit 5; 
	
	//Deactivate ppEffects
	"chromAberration" ppEffectEnable false;
	"radialBlur" ppEffectEnable false;
	//"dynamicBlur" ppEffectEnable false; //Tear gas uses this so dont turn it off
	"filmGrain" ppEffectEnable false;
	"colorCorrections" ppEffectEnable false; 
	
	resetCamShake;
		
	life_istranq = false;
};

#include <macro.h>
/*
	Author: RageMonkey
	Based on Tonic CaptureHideout
	Description:
	Liberates a Captured Hideout
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_markername","_gangname2"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];

if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint localize "STR_GNOTF_Captured";};
if(isNull _group) exitWith {hint localize "STR_GNOTF_NotCaptured";};

life_action_inUse = true;
_cpRate = 0.0075;
	
//Setup the progress bar
disableSerialization;
_title = localize "STR_GNOTF_Liberating";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];   //EDIT
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};

	sleep 0.195; // 3 fois 6.5 secondes = 19,5secondes
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
life_action_inUse = false;

titleText["Hideout has been liberated.","PLAIN"];
_flagTexture = ["\A3\Data_F\Flags\flag_fd_blue_CO.paa"] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
[[[0,1],localize "STR_GNOTF_Liberated"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",ObjNull,true];
    
// Hide Marker
 
_markername = str(getPos _hideout);
_markername setMarkerShape "Empty";

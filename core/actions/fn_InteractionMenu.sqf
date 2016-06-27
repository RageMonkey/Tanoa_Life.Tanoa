/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
		
if(!isPlayer _curTarget && (_curTarget getVariable["restrained",false])) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
//_Btn4 = _display displayCtrl Btn4;
//_Btn5 = _display displayCtrl Btn5;
//_Btn6 = _display displayCtrl Btn6;
//_Btn7 = _display displayCtrl Btn7;
//_Btn8 = _display displayCtrl Btn8;
//_Btn9 = _display displayCtrl Btn9;

life_pInact_curTarget = _curTarget;

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn1 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_InteractionMenu;";
} else {
	_Btn1 ctrlSetText localize "STR_pInAct_Escort";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

//Set Unrestrain Button
if(life_inv_handcuffkeys > 0) then
{
	//Set Unrestrain Button
	_Btn2 ctrlSetText localize "STR_pInAct_Unrestrain";
	_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
}else{
	_Btn2 ctrlSetText localize "STR_pInAct_Unrestrain";
	_Btn2 buttonSetAction "[] call life_fnc_lockpick";
	if(life_inv_lockpick > 0) then {
		_Btn2 ctrlEnable true;
	} else {
		_Btn2 ctrlEnable false;
	};
};

//Put In Car
_Btn3 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";



//_Btn4 ctrlEnable false;
//_Btn5 ctrlEnable false;
//_Btn6 ctrlEnable false;
//_Btn7 ctrlEnable false;
//_Btn8 ctrlEnable false;
//_Btn9 ctrlEnable false;

//_Btn4 ctrlShow false;
//_Btn5 ctrlShow false;
//_Btn6 ctrlShow false;
//_Btn7 ctrlShow false;
//_Btn8 ctrlShow false;
//_Btn9 ctrlShow false;
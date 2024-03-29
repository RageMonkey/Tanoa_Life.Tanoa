/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine
	
	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_handle","_clothings"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (10 * 60);
	}
		else
	{
		sleep (5 * 60);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then {
		_countDown = [(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString;
		hintSilent parseText format[(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Pay")+ " %3<br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if((player distance (getMarkerPos "jail_marker") > 60) && (player distance (getMarkerPos "jail_marker_1") > 60))  exitWith {
		_esc = true;
	};
	
	if(life_bail_paid) exitWith {
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 0.1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint localize "STR_Jail_Paid";
		serv_wanted_remove = [player];
		
		if(player distance (getMarkerPos "jail_marker") < 60) then
		{
			player setPos (getMarkerPos "jail_release");
		};
		if(player distance (getMarkerPos "jail_marker_1") < 60) then
		{
			player setPos (getMarkerPos "jail_release_1");
		};
		
		//player setPos (getMarkerPos "jail_release");
		life_RoT_money = 0; // Lose Cash on Player
		
		_handle = [] spawn life_fnc_stripDownPlayer;
		waitUntil {scriptDone _handle};

		if(playerSide == civilian) then {
			_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
			player addUniform (_clothings select (floor(random (count _clothings))));
			[] call life_fnc_equipGear;
			
			player addItem "ItemMap";
			player assignItem "ItemMap";
			player addItem "ItemCompass";
			player assignItem "ItemCompass";
			player addItem "ItemWatch";
			player assignItem "ItemWatch";
		};
		if(playerSide == independent) then {
			player forceAddUniform "U_Competitor";
			[] call life_fnc_equipGear;
			player addBackpack "B_FieldPack_blk";
			player addVest "V_Rangemaster_belt";
			player addItem "FirstAidKit";
			player addItem "FirstAidKit";
			player addItem "FirstAidKit";
			player addItem "FirstAidKit";
			player addItem "FirstAidKit";
			player addItem "ItemMap";
			player assignItem "ItemMap";
			player addItem "ItemCompass";
			player assignItem "ItemCompass";
			player addItem "ItemWatch";
			player assignItem "ItemWatch";
		};

		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_EscapeSelf";
		[[0,format[localize "STR_Jail_EscapeNOTF",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,profileName,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint localize "STR_Jail_Released";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		
		if(player distance (getMarkerPos "jail_marker") < 60) then
		{
			player setPos (getMarkerPos "jail_release");
		};
		if(player distance (getMarkerPos "jail_marker_1") < 60) then
		{
			player setPos (getMarkerPos "jail_release_1");
		};
		
		//player setPos (getMarkerPos "jail_release");
		life_RoT_money = 0; // Lose Cash on Player
		
		_handle = [] spawn life_fnc_stripDownPlayer;
		waitUntil {scriptDone _handle};

		_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
		player addUniform (_clothings select (floor(random (count _clothings))));
		[] call life_fnc_equipGear;
		
		player addItem "ItemMap";
		player assignItem "ItemMap";
		player addItem "ItemCompass";
		player assignItem "ItemCompass";
		player addItem "ItemWatch";
		player assignItem "ItemWatch";
		
		[5] call SOCK_fnc_updatePartial;
	};
};
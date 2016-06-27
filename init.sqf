enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

introSpawn = nil;

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "scripts\RoT_Weather.sqf";
[] execVM "scripts\teargas.sqf";
0 = execVM "IgiLoad\IgiLoadInit.sqf";

if(isDedicated && isNil("life_market_prices")) then {
	[] call AoD_fnc_marketconfiguration;
	diag_log "Market prices generated!";
	
	"life_market_prices" addPublicVariableEventHandler
	{
		diag_log format["Market prices update! %1", _this select 1];
	};
	
	[] execFSM "core\fsm\server.fsm";
	diag_log "Server FSM executed";
};

StartProgress = true;
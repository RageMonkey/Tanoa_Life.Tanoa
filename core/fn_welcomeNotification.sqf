/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
format["Welcome %1 !",profileName] hintC
[
	"Welcome to the RoT Gaming Altis Life server!",
	"Please read our server rules at RULES.ROTGAMING.NET",
	"Join our TeamsSpeak on TS.ROTGAMING.NET (mandatory for Cops)",
	"[Left Windows] Key allows you to interact with Vehicles & other Players (Configure->Controls->Custom 'Use Action 10' to change)",
	"'Y' to open your Altis Life Inventory/Menu",
	"Shift 'p' to toggle Volume to 10%",
	"'L' to use Radar Gun (Tazer) or whilst in Vehicle (cop only)",
	"Shift 'r' to restrain a player",
	"Shift 'o' to open boom games (cop only)",
	"Press 'l' with Tazerr pistol out to use Radar Speed Gun (cop only)",
	"Shift 'g' to knock out a player (civ only)"
];
	
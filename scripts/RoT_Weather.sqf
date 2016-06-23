/*
	File: RoT_weather.sqf
	Original File: D41_wetter.sqf
	Original Author: Distrikt41.de - Dscha
	Edited by: Spadge

	Description:
	RoT Weather Script
	Disables fog, allows for weather effects other than fog.
*/
	private ["_fnc_WeatherScript"];

	//PreLoad Variable
	if (isDedicated) then
	{
		RoT_Fog = [0,0,0];
		RoT_Wave = 0;
		RoT_Overcast = 0.5;
		RoT_Wind = [10, 10, true];
		RoT_Rain = 0;
		RoT_RainCounter = 1;
	};
	
	_fnc_WeatherScript =
	{
		if (isDedicated) then
			{
				RoT_ChanceN = round(random 100);
				if(RoT_ChanceN <= 10) then
					{
						RoT_Fog = [0,0,0]; RoT_Wave = 0; RoT_Overcast = 0.2; RoT_Wind = [5, 5, true]; RoT_Rain = 0; RoT_RainCounter = 0;
						RoT_WMod = round(random 9);
						if(RoT_WMod == 0)	then {/*RoT_Fog = [1, 0.1,10];		*/RoT_Rain = 0.1;	RoT_Overcast = 0.4;};
						if(RoT_WMod == 1)	then {/*RoT_Fog = [1, 0.2,10];		*/RoT_Rain = 0.2;	RoT_Overcast = 0.3;};
						if(RoT_WMod == 2)	then {/*RoT_Fog = [1, 0.3,10];		*/RoT_Rain = 0.2;	RoT_Overcast = 0.2;};
						if(RoT_WMod == 3)	then {/*RoT_Fog = [0.9, 0.1,15];	*/RoT_RainCounter = 0;};
						if(RoT_WMod == 4)	then {/*RoT_Fog = [0.8, 0.1,15];	*/RoT_Rain = 0.2;	RoT_Overcast = 0.4;};
						if(RoT_WMod == 5)	then {/*RoT_Fog = [0.7, 0.1,15];	*/RoT_RainCounter = 0;};
						if(RoT_WMod == 6)	then {/*RoT_Fog = [0.6, 0.1,30];	*/RoT_RainCounter = 0;};
						if(RoT_WMod == 7)	then {/*RoT_Fog = [0.5, 0.1,30];	*/RoT_Rain = 0.2;	RoT_Overcast = 0.5;};
						if(RoT_WMod == 8)	then {/*RoT_Fog = [0.4, 0.1,30];	*/RoT_RainCounter = 0;};
						if(RoT_WMod == 9)	then {/*RoT_Fog = [0.1, 0.1,50];	*/RoT_Rain = 0.4;	RoT_Wave = 1;	RoT_Overcast = 0.5;};
					};

				if(RoT_ChanceN >=11 && RoT_ChanceN <= 30 && RoT_RainCounter == 0) then
					{
						RoT_Fog = [0,0,0]; RoT_Wave = 0; RoT_Overcast = 1; RoT_Rain = 0; RoT_RainCounter = 1;
						RoT_WMod = round(random 9);
						if(RoT_WMod == 0)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 1;		RoT_Overcast = 1; 	RoT_Wind = [12, 12, true];	RoT_Rain = 0.6;};
						if(RoT_WMod == 1)	then {/*RoT_Fog = 0.3;	*/RoT_Wave = 1;		RoT_Overcast = 1; 	RoT_Wind = [12, 12, true];	RoT_Rain = 0.6;};
						if(RoT_WMod == 2)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 1;		RoT_Overcast = 0.9; RoT_Wind = [12, 12, true];	RoT_Rain = 0.5;};
						if(RoT_WMod == 3)	then {/*RoT_Fog = 0.2;	*/RoT_Wave = 0.8;	RoT_Overcast = 0.8; RoT_Wind = [0, 20, true];	RoT_Rain = 0.5;};
						if(RoT_WMod == 4)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0.8;	RoT_Overcast = 0.7; RoT_Wind = [23, 0, true];	RoT_Rain = 0.3;};
						if(RoT_WMod == 5)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0.6;	RoT_Overcast = 0.7; RoT_Wind = [0, 21, true];	RoT_Rain = 0.3;};
						if(RoT_WMod == 6)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0.4;	RoT_Overcast = 0.6; RoT_Wind = [18, 0, true];	RoT_Rain = 0.2;};
						if(RoT_WMod == 7)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0.2;	RoT_Overcast = 0.5; RoT_Wind = [7, 7, true];	RoT_Rain = 0.2;};
						if(RoT_WMod == 8)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0.1;	RoT_Overcast = 0.4; RoT_Wind = [5, 7, true];	RoT_Rain = 0.2;};
						if(RoT_WMod == 9)	then {/*RoT_Fog = 0.1;	*/RoT_Wave = 0;		RoT_Overcast = 0.4; RoT_Wind = [7, 5, true];	RoT_Rain = 0.1;};
					};

				if(RoT_ChanceN >=11 && RoT_ChanceN <= 30 && RoT_RainCounter == 1) then {RoT_ChanceN = 31};

				if(RoT_ChanceN >=31 && RoT_ChanceN <= 90) then
				{
					RoT_Fog = [0,0,0]; RoT_Wave = 0; RoT_Overcast = 0.2; RoT_Wind = [5, 5, true]; RoT_Rain = 0; RoT_RainCounter = 0;
					RoT_WMod = round(random 9);
					if(RoT_WMod == 0)	then {RoT_Overcast = 0.9;	RoT_Wind = [10, 0, true];};
					if(RoT_WMod == 1)	then {RoT_Overcast = 0.9;	RoT_Wind = [0, 10, true];};
					if(RoT_WMod == 2)	then {RoT_Overcast = 0.7;	RoT_Wind = [5, 10, true];};
					if(RoT_WMod == 3)	then {RoT_Overcast = 0.7;	RoT_Wind = [10, 5, true];};
					if(RoT_WMod == 4)	then {RoT_Overcast = 0.6;	RoT_Wind = [0, 10, true];};
					if(RoT_WMod == 5)	then {RoT_Overcast = 0.6;	RoT_Wind = [5, 0, true];};
					if(RoT_WMod == 6)	then {RoT_Overcast = 0.5;	RoT_Wind = [5, 5, true];};
					if(RoT_WMod == 7)	then {RoT_Overcast = 0.5;	RoT_Wind = [5, 0, true];};
					if(RoT_WMod == 8)	then {RoT_Overcast = 0.4;	RoT_Wind = [0, 5, true];};
					if(RoT_WMod == 9)	then {RoT_Overcast = 0.4;	RoT_Wind = [5, 5, true];};
					
				};

				if(RoT_ChanceN >=91 && RoT_ChanceN <= 100) then
				{
					RoT_Fog = [0,0,0]; RoT_Wave = 0; RoT_Overcast = 0.2; RoT_Wind = [5, 5, true]; RoT_Rain = 0; RoT_RainCounter = 1;
					RoT_WMod = round(random 2);
					if(RoT_WMod == 0)	then {RoT_Overcast = 0.2;	RoT_Wind = [10, 0, true];};
					if(RoT_WMod == 1)	then {RoT_Overcast = 0.2;	RoT_Wind = [0, 10, true];};
					if(RoT_WMod == 2)	then {RoT_Overcast = 0.1;	RoT_Wind = [0, 0, true];};				
				};
				diag_log format ["::::::::: WEATHER SYSTEM ::::::::: RoT_ChanceN = %1 ::: RoT_WMod = %2",RoT_ChanceN, RoT_WMod];
				publicVariable "RoT_Fog";
				publicVariable "RoT_Wave";
				publicVariable "RoT_Overcast";
				publicVariable "RoT_Wind";
				publicVariable "RoT_Rain";
			};
	};

	if(isDedicated)then
	{
		while{true}do
		{
			[] call _fnc_WeatherScript;
			sleep 1;
			60 setfog (RoT_Fog);
			60 setRain (RoT_Rain);
			0 setOvercast (RoT_Overcast);
			setWind (RoT_Wind);
			60 setWaves (RoT_Wave);
			sleep 1200;
		};
	};

	//JIP and sync
	if (!isDedicated) then
	{
		while{true}do
		{
			60 setfog (RoT_Fog);
			60 setRain (RoT_Rain);
			0 setOvercast (RoT_Overcast);
			setWind (RoT_Wind);
			60 setWaves (RoT_Wave);
			//hint format ["::::::::: WEATHER SYSTEM ::::::::: RoT_ChanceN = %1 ::: RoT_WMod = %2",RoT_ChanceN, RoT_WMod];
			uisleep 120;
		};
	};
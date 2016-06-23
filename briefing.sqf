waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

//New briefing menu
player createDiarySubject ["reignofterror","Reign of Terror"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["controls","Controls"];

// Reign of Terror Section

	player createDiaryRecord ["reignofterror",
		[
			"Teamspeak",
				"
				Reign of Terror Teamspeak can be found at:<br/><br/>
				ts.rotgaming.net<br/><br/>
				COPS ARE REQUIRED TO CONNECT TO TEAMSPEAK<br></br>
				"
		]
	];
	
	player createDiaryRecord ["reignofterror",
		[
			"Website/Forums",
				"
				reignofterrorclan.enjin.com/<br/>
				This is also where ban appeals will be made.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["reignofterror",
		[
			"Donations",
				"
				Donations keep the server running, also you gain access to donator shop.<br/><br/>
				reignofterrorclan.enjin.com/<br/><br/>
				"
		]
	];
	
// Server Rules
	
	player createDiaryRecord ["serverrules",
		[
			"Check the website for the current rules and punishments", 
				"
				http://reignofterrorclan.enjin.com/forum/m/17518766/viewthread/11327612-altis-life-rules<br/><br/>
				"
		]
	];
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"Interaction",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, gathering, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				Left Shift + H: Holster's your pistol<br/>
				"
		]
	];

private["_respawn", "_spCheck", "_result" ,"_faction1" , "_crateToDelete"];

_caller      = _this select 1;

_faction1 = faction _caller;

_arguments   = _this select 3;
_typeofCrate = [_arguments, 0, "crate_small"] call BIS_fnc_param;
_faction     = [_arguments, 1, _faction1] call BIS_fnc_param;
_mycrate = "";

switch (_typeofCrate) do
{
	case "crate_small":        { _mycrate = "Box_NATO_Wps_F"; }; 
	case "crate_smallmedical": { _mycrate = "Box_East_Support_F"; };
	case "crate_night_small":  { _mycrate = "Box_East_Support_F"; };
	case "crate_night_big":    { _mycrate = "B_supplyCrate_F"; };
	case "crate_med":          { _mycrate = "B_supplyCrate_F"; };
	case "crate_large":        { _mycrate = "B_CargoNet_01_ammo_F"; };
	case "crate_bigmedical":   { _mycrate = "I_CargoNet_01_ammo_F"; };
	case "crate_mmg":          { _mycrate = "Box_IND_Wps_F"; };  
	case "crate_mat":		   { _mycrate = "Box_NATO_WpsLaunch_F"; }; 
	case "crate_sam":		   { _mycrate = "Box_IND_WpsLaunch_F"; };
	case "crate_hat":          { _mycrate = "Box_East_WpsSpecial_F"; };
};

_respawnPos = getMarkerPos "Crate_mark";
	
	_spCheck = nearestObjects[_respawnPos,["Box_NATO_Wps_F","Box_East_Support_F","B_supplyCrate_F","B_CargoNet_01_ammo_F","I_CargoNet_01_ammo_F","Box_IND_Wps_F","Box_NATO_WpsLaunch_F","Box_IND_WpsLaunch_F","Box_East_WpsSpecial_F"],10] select 0;  //"landVehicle","Air","Ship"],10] select 0;  Object'		
	if(!isNil "_spCheck") then {
		
		deleteVehicle _spCheck;
	};

	sleep 0.5;
if(_mycrate != "") then
{
	sleep 0.5;
	_unit = _mycrate createVehicle _respawnPos;
	_unit setPos _respawnPos;
		
    [_typeofCrate,_unit,_faction] call f_fnc_assignGear;
	
};


// przyklad inicjalizacji ( wpisac w pole init obiektu ) :

//_null = this addAction ["Mala skrzynia z bronia", 		"f\assignGear\SpawnCrate.sqf", ["crate_small",			faction1] ];
//_null = this addAction ["Srednia skrzynia z bronia", 		"f\assignGear\SpawnCrate.sqf", ["crate_med",			faction1] ];
//_null = this addAction ["Duza skrzynia z bronia", 		"f\assignGear\SpawnCrate.sqf", ["crate_large",			faction1] ];
//_null = this addAction ["Mala skrzynia medyczna", 		"f\assignGear\SpawnCrate.sqf", ["crate_smallmedical",	faction1] ];
//_null = this addAction ["Duza skrzynia medyczna", 		"f\assignGear\SpawnCrate.sqf", ["crate_bigmedical",		faction1] ];
//_null = this addAction ["Mala skrzynia z wypo nocnym", 	"f\assignGear\SpawnCrate.sqf", ["crate_night_small",	faction1] ];
//_null = this addAction ["Duza skrzynia z wypo nocnym", 	"f\assignGear\SpawnCrate.sqf", ["crate_night_big",		faction1] ];
//_null = this addAction ["Amunicja MMG", 					"f\assignGear\SpawnCrate.sqf", ["crate_mmg",			faction1] ];
//_null = this addAction ["Amunicja MAT", 					"f\assignGear\SpawnCrate.sqf", ["crate_mat",			faction1] ];
//_null = this addAction ["Amunicja SAM", 					"f\assignGear\SpawnCrate.sqf", ["crate_sam",			faction1] ];
//_null = this addAction ["Amunicja HAT", 					"f\assignGear\SpawnCrate.sqf", ["crate_hat",			faction1] ];
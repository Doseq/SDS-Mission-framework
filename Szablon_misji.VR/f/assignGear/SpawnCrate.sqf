// S.D.S Spawn Crate Script - [V-1.7 | 19.04.2017]

private["_respawn","_spCheck", "_result" ,"_faction1" , "_crateToDelete"];

_caller      = _this select 1;
_faction1 = faction _caller;
_arguments   = _this select 3;
_typeofCrate = [_arguments, 0, "crate_small"] call BIS_fnc_param;
_faction     = [_arguments, 1, _faction1] call BIS_fnc_param;
_mycrate = "";

switch (_typeofCrate) do
{
	case "crate_small":        { _mycrate = "Box_NATO_Ammo_F"; }; 
	case "crate_med":          { _mycrate = "B_supplyCrate_F"; };
	case "crate_large":        { _mycrate = "B_CargoNet_01_ammo_F"; };
	case "crate_small_explo":  { _mycrate = "Box_NATO_AmmoOrd_F"; }; 
	case "crate_large_explo":  { _mycrate = "Box_NATO_Equip_F"; };
	case "crate_smallmedical": { _mycrate = "Box_NATO_Support_F"; };
	case "crate_bigmedical":   { _mycrate = "Box_NATO_Equip_F"; };
	case "crate_night_small":  { _mycrate = "Box_NATO_Support_F"; };
	case "crate_night_big":    { _mycrate = "Box_NATO_Equip_F"; };	
	case "crate_mmg":          { _mycrate = "Box_IND_Wps_F"; };  
	case "crate_mat":		   { _mycrate = "Box_NATO_WpsLaunch_F"; }; 
	case "crate_sam":		   { _mycrate = "Box_NATO_WpsLaunch_F"; };
	case "crate_hat":          { _mycrate = "Box_NATO_WpsLaunch_F"; };
};

_respawnPos = getMarkerPos "Crate_mark";
	
	_spCheck = nearestObjects[_respawnPos,["Box_NATO_Wps_F","Box_East_Support_F","B_supplyCrate_F","B_CargoNet_01_ammo_F","I_CargoNet_01_ammo_F","Box_IND_Wps_F","Box_NATO_WpsLaunch_F","Box_IND_WpsLaunch_F","Box_NATO_Ammo_F","Box_NATO_Wps_F","Box_NATO_Equip_F","Box_NATO_AmmoOrd_F","Box_NATO_WpsLaunch_F","B_supplyCrate_F","Box_NATO_Support_F","B_CargoNet_01_ammo_F","Box_East_WpsSpecial_F","Box_IND_AmmoOrd_F"],10] select 0;  //"landVehicle","Air","Ship"],10] select 0;  Object'		
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

/*
_null = this addAction ["Mała skrzynia z bronią", "f\assignGear\SpawnCrate.sqf", ["crate_small",faction1] ]; 
_null = this addAction ["Średnia skrzynia z bronią", "f\assignGear\SpawnCrate.sqf", ["crate_med",faction1] ]; 
_null = this addAction ["Duża skrzynia z bronią", "f\assignGear\SpawnCrate.sqf", ["crate_large",faction1] ]; 
_null = this addAction ["Mała skrzynia z ładunkami", "f\assignGear\SpawnCrate.sqf", ["crate_small_explo",faction1] ]; 
_null = this addAction ["Duża skrzynia z ładunkami", "f\assignGear\SpawnCrate.sqf", ["crate_large_explo",faction1] ]; 
_null = this addAction ["Mała skrzynia medyczna", "f\assignGear\SpawnCrate.sqf", ["crate_smallmedical",faction1] ]; 
_null = this addAction ["Duża skrzynia medyczna", "f\assignGear\SpawnCrate.sqf", ["crate_bigmedical",faction1] ]; 
_null = this addAction ["Mała skrzynia z wypo nocnym", "f\assignGear\SpawnCrate.sqf", ["crate_night_small",faction1] ]; 
_null = this addAction ["Duża skrzynia z wypo nocnym", "f\assignGear\SpawnCrate.sqf", ["crate_night_big",faction1] ]; 
_null = this addAction ["Amunicja MMG", "f\assignGear\SpawnCrate.sqf", ["crate_mmg",faction1] ]; 
_null = this addAction ["Amunicja MAT", "f\assignGear\SpawnCrate.sqf", ["crate_mat",faction1] ]; 
_null = this addAction ["Amunicja SAM", "f\assignGear\SpawnCrate.sqf", ["crate_sam",faction1] ]; 
_null = this addAction ["Amunicja HAT", "f\assignGear\SpawnCrate.sqf", ["crate_hat",faction1] ];
/*
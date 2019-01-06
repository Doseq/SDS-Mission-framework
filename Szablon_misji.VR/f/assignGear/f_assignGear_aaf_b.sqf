// DEFINE BACKPACK CONTENTS
// The following blocks of code define different backpack loadouts. These are then
// called from the role loadouts.
	

// BACKPACK: MEDIC
case "m":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {

	_unit addBackpack _bagMs;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_carbinemag, 1];
		//(unitBackpack _unit) addItemCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addItemCargoGlobal [_blood, 6];
		(unitBackpack _unit) addItemCargoGlobal [_bandage,40];
		(unitBackpack _unit) addItemCargoGlobal [_morphine,15];
		(unitBackpack _unit) addItemCargoGlobal [_epinephrine,15];
		(unitBackpack _unit) addItemCargoGlobal [_personalAidKit, 6];
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
	_unit addBackpack _bagMm;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_carbinemag, 1];
		(unitBackpack _unit) addItemCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addItemCargoGlobal [_blood, 6];
		(unitBackpack _unit) addItemCargoGlobal [_bandage,40];
		(unitBackpack _unit) addItemCargoGlobal [_morphine,15];
		(unitBackpack _unit) addItemCargoGlobal [_epinephrine,15];
		(unitBackpack _unit) addItemCargoGlobal [_personalAidKit, 6];
			
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagMb;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addItemCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addItemCargoGlobal [_blood, 6];
		(unitBackpack _unit) addItemCargoGlobal [_bandage,40];
		(unitBackpack _unit) addItemCargoGlobal [_morphine,15];
		(unitBackpack _unit) addItemCargoGlobal [_epinephrine,15];
		(unitBackpack _unit) addItemCargoGlobal [_personalAidKit, 6];
	
	};
};

// BACKPACK: FTL (CO/DC/SL)
case "ftl":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
	};

	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,3];
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,6];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];		
		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag_tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,8];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade,1];
		
	};
};


// BACKPACK: Vehicle Comander
case "vc":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];	
		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag,3];
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag_tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,3];
	};
};



// BACKPACK: AR
case "ar":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagARs;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr,2];;
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagARm;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr, 2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagARb;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr, 2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
};

// BACKPACK: AAR
case "aar":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagARs;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];

	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagARm;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag,3];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagARb;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_ARmag_Tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
};

// BACKPACK: RIFLEMAN AT (RAT)
case "rat":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
};

// BACKPACK: GREANDIER
case "g":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
				
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag_tr,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,6];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_glriflemag,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glmag,8];
		(unitBackpack _unit) addMagazineCargoGlobal [_glsmokewhite,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		
	};
};

// BACKPACK: RIFLEMAN (R)
case "r":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];	
		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
		
	};
};

// BACKPACK: CARABINEER (CAR)
case "car":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 6];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
		
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
	
		_unit addBackpack _bagR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];	
		
	};
};

// BACKPACK: MMG GUNNER (MMG)
case "mmg":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagARs;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr,1];
		//(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		

	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
		_unit addBackpack _bagARm;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr,2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagARb;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr,2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
};

// BACKPACK: MMG ASSISTANT GUNNER (MMGAG)
case "mmgag":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagARs;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag,2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
		
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
		_unit addBackpack _bagARm;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];		
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagARb;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_MMGmag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_riflemag_tr, 2];		
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];		
		
	};
};

// LOADOUT: HEAVY MG GUNNER (HMGG)
case "hmgg":
{
	_unit addBackpack _baghmgg;
};

// LOADOUT: HEAVY MG ASSISTANT GUNNER (HMGAG)
case "hmgag":
{
	_unit addBackpack _baghmgag;
};

// BACKPACK: MAT GUNNER (MATG)
case "matg":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		//(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 3];
		//(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
};

// BACKPACK: MAT ASSISTANT (MATAG)
case "matag":
    {
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];	
		
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag1, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_MATmag2, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 3];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];		
	};
};

// LOADOUT: HEAVY AT GUNNER (HATG)
case "hatg":
{
	_unit addBackpack _baghatg;
};

// LOADOUT: HEAVY AT ASSISTANT GUNNER (HATAG)
case "hatag":
{
	_unit addBackpack _baghatag;
};

// BACKPACK: MORTAR GUNNER (MTRG)
case "mtrg":
{
	_unit addBackpack _bagmtrg;
};

// BACKPACK: MORTAR ASSISTANT GUNNER (MTRAG)
case "mtrag":
{
	_unit addBackpack _bagmtrag;
};

// BACKPACK: MEDIUM SAM GUNNER (MSAMG)
case "msamg":
{
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_SAMmag, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
};

// BACKPACK: MEDIUM SAM ASSISTANT GUNNER (MSAMAG)
case "msamag":
{
		_unit addBackpack _bagMAT;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_SAMmag, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_carbinemag_tr, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
};

// LOADOUT: HEAVY SAM GUNNER (HSAMG)
case "hsamg":
{
	_unit addBackpack _baghsamg;
};

// LOADOUT: HEAVY SAM ASSISTANT GUNNER (HSAMAG)
case "hsamag":
{
	_unit addBackpack _baghsamag;
};

// BACKPACK: ENGINEER (LOGI)
case "eng":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagENG;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_smgmag,3];
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_saperka,1];
		(unitBackpack _unit) addItemCargoGlobal [_mlotek,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeblue, 2];
	
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagENG;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_smgmag,5];
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_saperka,1];
		(unitBackpack _unit) addItemCargoGlobal [_mlotek,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeblue, 2];
	
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagENG;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal [_smgmag,7];	
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_saperka,1];
		(unitBackpack _unit) addItemCargoGlobal [_mlotek,1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadeblue, 2];
	
	};
};

// BACKPACK: ENGINEER (HQ)
case "engm":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagmedium;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_wirecutter,1];
		(unitBackpack _unit) addItemCargoGlobal [_satche_small,1];
		(unitBackpack _unit) addItemCargoGlobal [_satche_big,1];
		
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
	
		_unit addBackpack _bagENG;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_wirecutter,1];
		(unitBackpack _unit) addItemCargoGlobal [_satche_small,3];
		(unitBackpack _unit) addItemCargoGlobal [_satche_big,3];
		
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {

		_unit addBackpack _bagENG;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
		(unitBackpack _unit) addItemCargoGlobal [_wirecutter,1];
		(unitBackpack _unit) addItemCargoGlobal [_satche_small,4];
		(unitBackpack _unit) addItemCargoGlobal [_satche_big,4];
		
	};
};

// BACKPACK: SUBMACHINEGUNNER (SMG)
case "smg":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagsmall;
		_unit addmagazines [_smgmag,2];
		_unit addmagazines [_grenade,1];
		_unit addmagazines [_smokegrenadegreen,2];
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
		_unit addBackpack _bagAR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
		_unit addBackpack _bagAR;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_smgmag, 8];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 4];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
	};
};

// BACKPACK: Dowódca sil specjalnych
case "divc":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
		_unit addBackpack _bagFTL;
		clearMagazineCargoGlobal (unitBackpack _unit);
		(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 2];
		(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 1];
		(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 1];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
			_unit addBackpack _bagFTL;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 4];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
			_unit addBackpack _bagFTL;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 6];
			(unitBackpack _unit) addMagazineCargoGlobal [_grenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_mgrenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenade, 2];
			(unitBackpack _unit) addMagazineCargoGlobal [_smokegrenadegreen, 2];
	};
};

// BACKPACK: Medyk Sil Specjalnych
case "divm":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal ["ACE_quikclot,20"];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_morphine",5];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_epinephrine",5];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_personalAidKit", 4];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal	["ACE_bloodIV_500", 4];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_quikclot", 25];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_morphine", 7];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_epinephrine", 7];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_personalAidKit", 4];
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal	["ACE_bloodIV_500", 8];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_quikclot", 30];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_morphine", 10];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_epinephrine", 10];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_personalAidKit", 6];
	};
};


// BACKPACK: Strzelec AT Sil Specjalnych
case "divr":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagR, 2];
	};
	
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagR, 3];
	};
	
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagR, 4];
	};
	
};


// BACKPACK: Saper Sil Specjalnych
case "divs":
{
	// LOADOUT: LIGHT
	if (_loadout == 0) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal ["CUP_PipeBomb_M",2];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_DefusalKit",1];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_Clacker",1];
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 2];
		
	};
	// LOADOUT: MEDIUM
	if (_loadout == 1) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal ["ACE_DefusalKit",1];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_Clacker",1];
			(unitBackpack _unit) addItemCargoGlobal ["SatchelCharge_Remote_Mag",1];
			(unitBackpack _unit) addItemCargoGlobal ["CUP_PipeBomb_M",2];
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 2];
	};
	// LOADOUT: HEAVY
	if (_loadout == 2) then {
			_unit addBackpack _bagmediumdiver;
			clearMagazineCargoGlobal (unitBackpack _unit);
			(unitBackpack _unit) addItemCargoGlobal ["ACE_DefusalKit",1];
			(unitBackpack _unit) addItemCargoGlobal ["ACE_Clacker",1];
			(unitBackpack _unit) addItemCargoGlobal ["SatchelCharge_Remote_Mag",1];
			(unitBackpack _unit) addItemCargoGlobal ["CUP_PipeBomb_M",2];
			(unitBackpack _unit) addMagazineCargoGlobal [_diverMagCaS, 2];
	};
};

// BACKPACK: UAV
case "uav":
{
	_unit addBackpack _baguav;
};

// BACKPACK: CREW CHIEFS & VEHICLE DRIVERS
case "cc":
{
	_unit addBackpack _bagENG;
	clearMagazineCargoGlobal (unitBackpack _unit);
	(unitBackpack _unit) addItemCargoGlobal ["ToolKit",1];
	(unitBackpack _unit) addMagazineCargoGlobal [_flaregreen, 8];
};


// Plecak Pilota
case "pp":
{
	_unit addBackpack _bagPP;
	(unitBackpack _unit) addMagazineCargoGlobal [_flaregreen, 8];
};

// Plecak Pilota Samolotu		
case "ps":		
{		
	_unit addBackpack _bagsmall;		
};

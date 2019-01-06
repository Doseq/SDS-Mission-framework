// ====================================================================================
// S.D.S Assign Gear Script - [V-1.8 beta | 04.01.2018]
// ====================================================================================

//	SPIS TRESCI
/*

	1.	US ARMY UCP
	2.	US ARMY OCP
	3.	USMC Desert
	4.	USMC Woodland
	5.	Polska Desert
	6.	Polska Woodland
	7.	US Desert [CW]
	8.	US Woodland [CW]
	9.	Everon Defence Forces [U]
	10.	Altis Defence Forces [U]
	
*/
// ====================================================================================
	_loadout_faction_player = f_param_player_faction_Blufor;
// ====================================================================================

//Definicje przedmiotów

// Sprzet medyczny
_personalAidKit = "ACE_personalAidKit";		// Zestaw pierwszej pomocy
_surgicalKit = "ACE_surgicalKit";			// Zestaw do szycia ran
_bandage = "ACE_elasticBandage";			// Opatrunek "Quik Clot" dla piechoty
_epinephrine = "ACE_epinephrine";			// Epinefryna
_morphine = "ACE_morphine";					// Morfina
_blood = "ACE_bloodIV_500";					// Krew 500 ml
_plasma = "ACE_plasmaIV_500";				// Osocze 500 ml
_saline = "ACE_salineIV_500";				// Sól fizjologiczna 500 ml
_firstaid = "FirstAidKit";
_medkit = "Medikit";

//Radia ACRE2
_radioSR = "ACRE_PRC343";
_radioMR = "ACRE_PRC152";
_radioLR = "ACRE_PRC77";

//Przydatne rzeczy
_earplugs = "ACE_EarPlugs";
_IRstrobe = "ACE_IR_Strobe_Item";
_latarka = "ACE_Flashlight_XL50";
_lornetkaAM = "ACE_Vector";
_lornetkaFTL = "Binocular";
_lornetkaRTO = "Laserdesignator";
_GPS = "ItemGPS";
_handcuffs = "ACE_CableTie";
_worek = "ACE_bodyBag";

// Flary ręczne
_flarewhite = "ACE_HandFlare_White";
_flarered = "ACE_HandFlare_Red";
_flareyellow = "ACE_HandFlare_Yellow";
_flaregreen = "ACE_HandFlare_Green";

// Świetliki
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

//Granaty dymne
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";
_smokegrenadeblue = "SmokeShellBlue";
_smokegrenadered = "SmokeShellRed";

// Granaty ręczne
_grenade = "rhs_mag_m67";
_mgrenade = "ACE_M84";

// Granaty dymne do granatnika
_glsmokewhite = "1Rnd_Smoke_Grenade_shell";
_glsmokegreen = "1Rnd_SmokeGreen_Grenade_shell";
_glsmokered = "1Rnd_SmokeRed_Grenade_shell";

// Flary do granatnika
_glflarewhite = "UGL_FlareWhite_F";
_glflarered = "UGL_FlareRed_F";
_glflareyellow = "UGL_FlareYellow_F";
_glflaregreen = "UGL_FlareGreen_F";

//Przedmioty w skrzyniach
_satche_small = "ClaymoreDirectionalMine_Remote_Mag";
_satche_big = "DemoCharge_Remote_Mag";
_satche_extra_big = "SatchelCharge_Remote_Mag";
_toolkit = "ToolKit";
_zapalnik = "ACE_Clacker";
_zapalnik_b = "ACE_M26_Clacker";
_n_rozbraja = "ACE_DefusalKit";
_saperka = "ACE_EntrenchingTool";
_mlotek = "ACE_Fortify";
_wirecutter = "ACE_wirecutter";

// Mechanicy/saperzy
_ATmine = "ATMine_Range_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";
_mineDetector = "ACE_VMM3";

// Noktowizja
_nvg = "rhsusf_ANPVS_15";

// Terminal UAV
_uavterminal = "B_UavTerminal";	  // Dla BLUFORU musi być terminal BLUFORU, innej frakcji nie zadziała

//Konstruktor BUILDERA
Builder = {	
	_backpack = {
		_typeofBackPack = _this select 0;
		_loadout = f_param_backpacks;
		if (count _this > 1) then {_loadout = _this select 1;};
		switch (_typeofBackPack) do
		{
			#include "f_assignGear_nato_b.sqf";
		};
	};
// SETUP CRATE
	_crate = {
		_typeofCrate = _this select 0;
		switch (_typeofCrate) do
		{
			#include "f_assignGear_crate.sqf";
		};
	};
// WYWOŁANIE BUILDERA
		#include "f_assignGear_nato_builder.sqf";
};	

//Dodanie wyposażenia medycznego	
Medical = {
	for "_p" from 1 to 12 do {_unit addItem _bandage;};		// Dodanie 12 sztuk bandaży
	for "_p" from 1 to 2 do {_unit addItem _morphine;};		// Dodanie 2 sztuk morfiny
	for "_p" from 1 to 2 do {_unit addItem _epinephrine;};	// Dodanie 2 sztuk epinefryny	
	_unit linkItem "ItemMap";		// Dodanie mapy
	_unit linkItem "ItemCompass";	// Dodanie kompsu
	_unit addItem _radioSR;		// Dodanie radia
	_unit linkItem "ItemWatch";		// Dodanie zegarka
	_unit addItem _earplugs;		// Dodaje zatyczki do uszy
	_unit addItem _latarka;			// Latarka na mape
};

//Nocne wyposażenie oparte na noktowizji, laserach, flarach
Night_Eq_NVG = {
	_loadout_night_day = f_param_night_day_wyp;
		
	if (_loadout_night_day == 0) then {
		if(_typeofUnit != "ps") then {
			_unit linkItem _nvg;			// Dodanie noktowizji
			_unit addItem _IRstrobe;		// Znacznik IR (doczepiany)
			_unit addItem _IRstrobe;		
			(unitBackpack _unit) addItemCargoGlobal [_chemblue,2];
			(unitBackpack _unit) addItemCargoGlobal [_flarered,2];
			(unitBackpack _unit) addItemCargoGlobal [_flarewhite,3];
		};
		
		if (_typeofUnit == "dc" || _typeofUnit == "co" || _typeofUnit == "ftl" || _typeofUnit == "uav") then {
		(unitBackpack _unit) addMagazineCargoGlobal [_glflarewhite,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glflarered,4];
		};
		
		if (_typeofUnit == "pp" || _typeofUnit == "ps" || _typeofUnit == "pcc" || _typeofUnit == "pc" || _typeofUnit == "divc" || _typeofUnit == "divm" || _typeofUnit == "divs" || _typeofUnit == "divr") then {
			_unit linkItem _nvg;			// Dodanie noktowizji	
		};
	};
};

//Nocne wyposażenie oparte na latarkach, flarach, lightstick-ach
Night_Eq_No_NVG = {
	_loadout_night_day = f_param_night_day_wyp;
		
	if (_loadout_night_day == 0) then {
		if(_typeofUnit != "ps") then {
			_unit addItem _IRstrobe;		// Znacznik IR (doczepiany)
			_unit addItem _IRstrobe;		
			(unitBackpack _unit) addItemCargoGlobal [_chemblue,2];
			(unitBackpack _unit) addItemCargoGlobal [_flarered,2];
			(unitBackpack _unit) addItemCargoGlobal [_flarewhite,3];
		};
		
		if (_typeofUnit == "dc" || _typeofUnit == "co" || _typeofUnit == "ftl" || _typeofUnit == "uav") then {
		(unitBackpack _unit) addMagazineCargoGlobal [_glflarewhite,4];
		(unitBackpack _unit) addMagazineCargoGlobal [_glflarered,4];
		};
		
		if (_typeofUnit == "pp" || _typeofUnit == "ps" || _typeofUnit == "pcc" || _typeofUnit == "pc" || _typeofUnit == "divc" || _typeofUnit == "divm" || _typeofUnit == "divs" || _typeofUnit == "divr") then {
			_unit linkItem _nvg;			// Dodanie noktowizji	
		};
	};
};
	

// ====================================================================================

switch (_loadout_faction_player) do
{
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//US ARMY UCP
	case 1: 
	{
// Dodatki broń główna
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_grey";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";			// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x
_scope4 = "rhsusf_acc_T1_high";				// Aimpoint RHS (SF)

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "rhsusf_acc_grip1";				// Grippod

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {					// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_bipod2,_attach1,_scope1];		//NOC
} else {
	_attachments = [_bipod2,_attach1,_scope1];		//DZIEŃ 			
};

// [] = brak dodatków
// [_attach1,_scope1] = usuwa dodatki a na ich miejsce dodaje _attach1, _scope1
// [_scope2] = dodaje tylko _scope2, reszta zostaje usunięta
// false = nie zmieniaj dodatków, zostaw tak jak domyślnie arma respi na broni

// ====================================================================================
// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [_hg_attah1];
// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_m4a1_carryhandle_pmag";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_m4a1_carryhandle_pmag";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
_diverWep = "rhs_weap_m4a1_blockII_KAC_bk";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_sfPistol = "rhsusf_weap_glock17g4";
_sfPistolMag = "rhsusf_mag_17Rnd_9x19_FMJ";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_m4a1_carryhandle_m203";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_glock17g4";
_pistolmag = "rhsusf_mag_17Rnd_9x19_JHP";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249_pip_L";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "rhs_weap_m240B";
_MMGmag = "rhsusf_100Rnd_762x51";
_MMGmag_tr = "rhsusf_100Rnd_762x51_m62_tracer";

// Strzelec wyborowy
_DMrifle = "rhs_weap_m14ebrri";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_M136";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_maaws";
_MATmag1 = "rhs_mag_maaws_HEAT";
_MATmag2 = "rhs_mag_maaws_HEDP";
_MAT_sight = "rhs_optic_maaws";
//_MATsptr = "rhs_mag_smaw_SR";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = true;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_M107";
_SNrifleMag = "rhsusf_mag_10Rnd_STD_50BMG_M33";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";						// Spadochron

_bagFTL = "rhsusf_assault_eagleaiii_ucp";					// Plecak dla dowódcy (radio)
_bagPP = "rhsusf_assault_eagleaiii_ucp";                  // Plecak dla pilota (radio)

_bagTL = "rhsusf_assault_eagleaiii_ucp";		//Plecak dowódcy drużyny

_bagMs = "B_Kitbag_cbr";						// Plecak dla medyka (mały)
_bagMm = "rhsusf_assault_eagleaiii_ucp";		// Plecak dla medyka (średni)
_bagMb = "rhsusf_assault_eagleaiii_ucp";        // Plecak dla medyka (duży)

_bagARs = "rhsusf_assault_eagleaiii_ucp";		// Plecak dla RKM (mały)
_bagARm = "B_Carryall_mcamo";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_mcamo";                   // Plecak dla RKM (duży)

_bagENG = "rhsusf_assault_eagleaiii_ucp";		// Plecak dla Mechanika

_bagR = "B_AssaultPack_mcamo";					// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_mcamo";					// Plecak dla MAT

_bagmedium = "rhsusf_assault_eagleaiii_ucp";	// carries 200, weighs 30
_baglarge =  "B_Carryall_mcamo"; 				// carries 320, weighs 40

_bagmediumdiver =  "rhsusf_assault_eagleaiii_ocp";	// Plecaki SF

_baguav = "rhsusf_assault_eagleaiii_ucp";					// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_cu_ucp"];
_baseHelmet = ["rhsusf_ach_helmet_ESS_ucp", "rhsusf_ach_helmet_headset_ucp", "rhsusf_ach_helmet_headset_ess_ucp"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsusf_iotv_ucp_Medic"];
_mediumRig = ["rhsusf_iotv_ucp_Grenadier", "rhsusf_iotv_ucp_SAW", "rhsusf_iotv_ucp_Squadleader", "rhsusf_iotv_ucp_Teamleader"];
_heavyRig = ["rhsusf_iotv_ucp_Repair"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_g3_mc"];
_diverHelmet = ["rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt_cam"];
_diverRig = ["rhsusf_mbav_grenadier","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_cu_ucp"];
_crewHelmet = ["rhsusf_cvc_green_helmet"];
_crewRig = ["rhsusf_spcs_ucp"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================
	// Dodanie przedmiotów medycznych do każdej jednstki (gracza)	
	call Medical;
	
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_NVG;

};
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//US ARMY OCP
	case 2:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_grey";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";			// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x
_scope4 = "rhsusf_acc_T1_high";				// Aimpoint RHS (SF)

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "rhsusf_acc_grip1";				// Grippod

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {					// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_bipod2,_attach1,_scope1];		//NOC
} else {
	_attachments = [_bipod2,_attach1,_scope1];		//DZIEŃ 			
};

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [_hg_attah1];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_m4a1_carryhandle_pmag";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_m4a1_carryhandle_pmag";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
_diverWep = "rhs_weap_m4a1_blockII_KAC_bk";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_sfPistol = "rhsusf_weap_glock17g4";
_sfPistolMag = "rhsusf_mag_17Rnd_9x19_FMJ";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_m4a1_carryhandle_m203";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_glock17g4";
_pistolmag = "rhsusf_mag_17Rnd_9x19_JHP";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249_pip_L";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "rhs_weap_m240B";
_MMGmag = "rhsusf_100Rnd_762x51";
_MMGmag_tr = "rhsusf_100Rnd_762x51_m62_tracer";

// Strzelec wyborowy
_DMrifle = "rhs_weap_m14ebrri";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_M136";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_maaws";
_MATmag1 = "rhs_mag_maaws_HEAT";
_MATmag2 = "rhs_mag_maaws_HEDP";
_MAT_sight = "rhs_optic_maaws";
//_MATsptr = "rhs_mag_smaw_SR";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = true;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_M107";
_SNrifleMag = "rhsusf_mag_10Rnd_STD_50BMG_M33";

// ====================================================================================

// Plecaki
_bagsmall = "B_Parachute";						// Spadochron

_bagFTL = "rhsusf_assault_eagleaiii_ocp";					// Plecak dla dowódcy (radio)
_bagPP = "rhsusf_assault_eagleaiii_ocp";                  // Plecak dla pilota (radio)

_bagTL = "rhsusf_assault_eagleaiii_ocp";		//Plecak dowódcy drużyny

_bagMs = "rhsusf_assault_eagleaiii_coy";		// Plecak dla medyka (mały)
_bagMm = "rhsusf_assault_eagleaiii_coy";		// Plecak dla medyka (średni)
_bagMb = "rhsusf_assault_eagleaiii_coy";		// Plecak dla medyka (duży)

_bagARs = "B_AssaultPack_mcamo";				// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_mcamo";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_mcamo";                   // Plecak dla RKM (duży)

_bagENG = "rhsusf_assault_eagleaiii_ocp";		// Plecak dla Mechanika

_bagR = "B_AssaultPack_mcamo";					// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_mcamo";					// Plecak dla MAT

_bagmedium = "B_TacticalPack_mcamo";			// carries 200, weighs 30
_baglarge =  "B_Carryall_mcamo"; 				// carries 320, weighs 40

_bagmediumdiver =  "rhsusf_assault_eagleaiii_ocp";	// Plecaki SF

_baguav = "rhsusf_assault_eagleaiii_ocp";		// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_cu_ocp"];
_baseHelmet = ["rhsusf_ach_helmet_headset_ocp", "rhsusf_ach_helmet_headset_ess_ocp", "rhsusf_ach_helmet_ESS_ocp"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsusf_iotv_ocp_Medic"];
_mediumRig = ["rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ocp_Rifleman", "rhsusf_iotv_ocp_SAW", "rhsusf_iotv_ocp_Squadleader", "rhsusf_iotv_ocp_Teamleader"];
_heavyRig = ["rhsusf_iotv_ocp_Repair"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_g3_mc"];
_diverHelmet = ["rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt_cam"];
_diverRig = ["rhsusf_mbav_grenadier","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_cu_ocp"];
_crewHelmet = ["rhsusf_cvc_helmet"];
_crewRig = ["rhsusf_spcs_ocp"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
	
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_NVG;

};	
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//USMC Desert
	case 3:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_grey";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_compm4";			// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_eotech_552";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x
_scope4 = "rhsusf_acc_T1_high";				// Aimpoint RHS (SF)

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "rhsusf_acc_grip1";				// Grippod 

// Jakie dodatki mają być dodane
_attachments = [_attach3,_scope1]; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [_hg_attah1];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_m16a4_carryhandle_grip_pmag";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_m4a1_carryhandle_grip";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
_diverWep = "rhs_weap_m4a1_blockII_KAC_bk";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_sfPistol = "rhsusf_weap_glock17g4";
_sfPistolMag = "rhsusf_mag_17Rnd_9x19_FMJ";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_m16a4_carryhandle_M203";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m9";
_pistolmag = "rhsusf_mag_15Rnd_9x19_FMJ";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249_pip_L";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "hlc_lmg_M60E4";
_MMGmag = "hlc_100Rnd_762x51_M_M60E4";
_MMGmag_tr = "hlc_100Rnd_762x51_M_M60E4";

// Strzelec wyborowy
_DMrifle = "rhs_weap_sr25_ec";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_smaw_green";
_MATmag1 = "rhs_mag_smaw_HEAA";
_MATmag2 = "rhs_mag_smaw_HEDP";
_MAT_sight = "rhs_weap_optic_smaw";
_MATsptr = "rhs_mag_smaw_SR";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = true;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_m40a5";
_SNrifleMag = "rhsusf_10Rnd_762x51_m118_special_Mag";

// ====================================================================================

// Plecaki
_bagsmall = "B_Parachute";						// Spadochron

_bagFTL = "tfw_ilbe_blade_d";					// Plecak dla dowódcy (radio)
_bagPP = "tfw_ilbe_blade_d";                  	// Plecak dla pilota (radio)

_bagTL = "B_Kitbag_cbr";						//Plecak dowódcy drużyny

_bagMs = "rhsusf_assault_eagleaiii_coy";		// Plecak dla medyka (mały)
_bagMm = "B_Kitbag_cbr";						// Plecak dla medyka (średni)
_bagMb = "B_Kitbag_cbr";               			// Plecak dla medyka (duży)

_bagARs = "rhsusf_assault_eagleaiii_coy";		// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_cbr";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_cbr";                     // Plecak dla RKM (duży)

_bagENG = "rhsusf_assault_eagleaiii_coy";		// Plecak dla Mechanika

_bagR = "B_AssaultPack_cbr";					// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_cbr";						// Plecak dla MAT

_bagmedium = "B_Kitbag_cbr";					// carries 200, weighs 30
_baglarge =  "B_Carryall_cbr"; 					// carries 320, weighs 40

_bagmediumdiver =  "rhsusf_assault_eagleaiii_coy";	// Plecaki SF

_baguav = "tfw_ilbe_d";							// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_FROG01_d"];
_baseHelmet = ["rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd_headset"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsusf_spc_corpsman"];
_mediumRig = ["rhsusf_spc_iar","rhsusf_spc_mg","rhsusf_spc_rifleman","rhsusf_spc_squadleader","rhsusf_spc_teamleader"];
_heavyRig = ["rhsusf_spc_iar","rhsusf_spc_mg","rhsusf_spc_rifleman","rhsusf_spc_squadleader","rhsusf_spc_teamleader"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_g3_tan"];
_diverHelmet = ["rhsusf_opscore_mar_ut","rhsusf_opscore_mar_ut_pelt"];
_diverRig = ["rhsusf_mbav_grenadier","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_FROG01_d"];
_crewHelmet = ["rhsusf_cvc_helmet"];
_crewRig = ["rhsusf_spc_crewman"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"]; 
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
	
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//USMC Woodland
	case 4:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_grey";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_compm4";				// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_eotech_552";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x
_scope4 = "rhsusf_acc_T1_high";				// Aimpoint RHS (SF)

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "rhsusf_acc_grip1";				// Grippod 

// Jakie dodatki mają być dodane
_attachments = [_attach3,_scope1]; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [_hg_attah1];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_m16a4_carryhandle_grip_pmag";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_m4a1_carryhandle_grip";
_carbinemag = "30Rnd_556x45_Stanag";
_carbinemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
_diverWep = "rhs_weap_m4a1_blockII_KAC_bk";
_diverMag1 = "30Rnd_556x45_Stanag";
_diverMag2 = "30Rnd_556x45_Stanag_Tracer_Red";
_sfPistol = "rhsusf_weap_glock17g4";
_sfPistolMag = "rhsusf_mag_17Rnd_9x19_FMJ";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_m16a4_carryhandle_M203";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m9";
_pistolmag = "rhsusf_mag_15Rnd_9x19_FMJ";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249_pip_L";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "hlc_lmg_M60E4";
_MMGmag = "hlc_100Rnd_762x51_M_M60E4";
_MMGmag_tr = "hlc_100Rnd_762x51_M_M60E4";

// Strzelec wyborowy
_DMrifle = "rhs_weap_sr25_ec";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_smaw_green";
_MATmag1 = "rhs_mag_smaw_HEAA";
_MATmag2 = "rhs_mag_smaw_HEDP";
_MAT_sight = "rhs_weap_optic_smaw";
_MATsptr = "rhs_mag_smaw_SR";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = true;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_m40a5";
_SNrifleMag = "rhsusf_10Rnd_762x51_m118_special_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";							// Spadochron
	
_bagFTL = "tfw_ilbe_blade_coy";      				// Plecak dla dowódcy (radio)
_bagPP = "tfw_ilbe_blade_coy";           		 	// Plecak dla pilota (radio)

_bagTL = "rhsusf_assault_eagleaiii_coy";			//Plecak dowódcy drużyny

_bagMs = "rhsusf_assault_eagleaiii_coy";			// Plecak dla medyka (mały)
_bagMm = "rhsusf_assault_eagleaiii_coy";			// Plecak dla medyka (średni)
_bagMb = "B_Carryall_khk";               			// Plecak dla medyka (duży)

_bagARs = "rhsusf_assault_eagleaiii_coy";			// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_rgr";							// Plecak dla RKM (średni)
_bagARb = "B_Carryall_khk";                  	 	// Plecak dla RKM (duży)

_bagENG = "B_TacticalPack_blk";                		// Plecak dla Mechanika

_bagR = "B_AssaultPack_rgr";						// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_cbr";							// Plecak dla MAT

_bagmediumdiver = "rhsusf_assault_eagleaiii_coy";	// Plecak dla SF

_baguav = "tfw_ilbe_coy";							// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";						// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";					// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_FROG01_wd"];
_baseHelmet = ["rhsusf_lwh_helmet_marpatwd","rhsusf_lwh_helmet_marpatwd_ess","rhsusf_lwh_helmet_marpatwd_headset"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsusf_spc_corpsman"];
_mediumRig = ["rhsusf_spc_corpsman","rhsusf_spc_iar","rhsusf_spc_mg","rhsusf_spc_rifleman","rhsusf_spc_squadleader","rhsusf_spc_teamleader"];
_heavyRig = ["rhsusf_spc_corpsman","rhsusf_spc_iar","rhsusf_spc_mg","rhsusf_spc_rifleman","rhsusf_spc_squadleader","rhsusf_spc_teamleader"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_g3_m81"];
_diverHelmet = ["rhsusf_opscore_mar_fg_pelt","rhsusf_opscore_mar_fg"];
_diverRig = ["rhsusf_mbav_grenadier","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["H_PilotHelmetHeli_B"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_FROG01_wd"];
_crewHelmet = ["rhsusf_cvc_helmet"];
_crewRig = ["rhsusf_spc_crewman"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"]; //DLC alternatives: ["U_B_FullGhillie_lsh","U_B_FullGhillie_ard","U_B_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
		
  };  
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//Polska Desert
	case 5:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_M952V";				// Latarka (RHS)
_attach3 = "acc_pointer_IR";				// czerwony laser (ARMA)

//_silencer1 = "muzzle_snds_M";				// Tłumik 5.56 (długi)
//_silencer2 = "BWA3_muzzle_snds_G36";		// Tłumik 5.56 (krótki)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x (RHS)

_bipod1 = "";								// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_attachments = [_attach2,_scope1]; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_silencer2 = "muzzle_snds_L";	// SF pistol suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "PSZ_Beryl04";
_riflemag = "PSZ_556x45_Beryl_30";
_riflemag_tr = "PSZ_556x45_Beryl_30_T_G";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "PSZ_BerylMini04";
_carbinemag = "PSZ_556x45_Beryl_30";
_carbinemag_tr = "PSZ_556x45_Beryl_30_T_G";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Siły specjalne
_diverWepCaS = "PSZ_Radon_HG";
_diverMagCaS = "PSZ_556x45_STANAG_30";
_diverWepM = "PSZ_Radon_HG";
_diverMagM = "PSZ_556x45_STANAG_30";
_diverWepR = "PSZ_Radon";
_diverMagR = "PSZ_556x45_STANAG_30";
_secendWep = "PSZ_P99";
_secendMag = "PSZ_9x19_P99_16";

// Broń z granatnikiem (dla dowóców)
_glrifle = "PSZ_Beryl04_GPBO_G";
_glriflemag = "PSZ_556x45_Beryl_30";
_glriflemag_tr = "PSZ_556x45_Beryl_30_T_G";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "PSZ_P99";
_pistolmag = "PSZ_9x19_P99_16";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_RPK12";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy (broń DLC)
_DMrifle = "srifle_DMR_06_camo_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
//_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v3";

// Strzelec AA
_SAM = "PSZ_Grom";
_SAMmag = "PSZ_Grom_AA";

// Strzelec HAT
_HAT = "PSZ_Spike_LR";		
_HATmag1 = "PSZ_Spike_THEAT";
_HATmag2 = "PSZ_Spike_THEAT";
_HAT_Mobile = true; 	//HAT mobilny - Spike		HAT statyczny - SPG-9

// Snajper
_SNrifle = "srifle_LRR_F";
_SNrifleMag = "7Rnd_408_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		// Spadochron

_bagFTL = "B_Kitbag_cbr";						// Plecak dla dowódcy (radio)
_bagPP = "B_Kitbag_cbr";                  	// Plecak dla pilota (radio)

_bagTL = "PSZ_B_wz93_DES";						//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_rgr";					// Plecak dla medyka (mały)
_bagMm = "B_TacticalPack_oli";					// Plecak dla medyka (średni)
_bagMb = "PSZ_B_wz93_Medical_DES";              // Plecak dla medyka (duży)

_bagARs = "B_AssaultPack_rgr";					// Plecak dla RKM (mały)
_bagARm = "PSZ_B_wz93_DES";						// Plecak dla RKM (średni)
_bagARb = "PSZ_B_wz97_DES";						// Plecak dla RKM (duży)

_bagENG = "B_AssaultPack_rgr";					// Plecak dla Mechanika

_bagR = "PSZ_B_wz93_WDL";						// Plecak dla strzelca, strzelca AT

_bagMAT = "PSZ_B_wz97_DES";						// Plecak dla MAT

_bagmedium = "B_TacticalPack_oli";				// carries 200, weighs 30
_baglarge =  "PSZ_B_wz97_DES"; 					// carries 320, weighs 40

_bagmediumdiver =  "PSZ_B_wz93_DES";			// Plecaki SF

_baguav = "B_Kitbag_cbr";						// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";						// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "RHS_SPG9_Gun_Bag";				// used by Heavy AT gunner
_baghatag = "RHS_SPG9_Tripod_Bag";			// used by Heavy AT assistant gunner
_bagmtrg = "B_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "B_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = [];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["PSZ_U_PL_DES_wz2010_Crye","PSZ_U_PL_DES_wz2010_Crye_Folded","PSZ_U_PL_DES_wz2010_Polar","PSZ_U_PL_WDL_wz2010_Crye_Folded","PSZ_U_PL_WDL_wz2010_Polar"];
_baseHelmet = ["PSZ_H_wz2005_DES","PSZ_H_wz2005_DES_ESS","PSZ_H_wz2005_OLIVE","PSZ_H_wz2005_OLIVE_ESS","PSZ_H_wz2005_WDL","PSZ_H_wz2005_WDL_ESS"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["PSZ_V_UKO_L_DES_CO_Headset","PSZ_V_UKO_L_DES_GL_Headset","PSZ_V_UKO_L_DES_MG_Headset","PSZ_V_UKO_L_DES_M_Headset","PSZ_V_UKO_L_DES_R_Headset","PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset"];
_mediumRig = ["PSZ_V_UKO_L_DES_CO_Headset","PSZ_V_UKO_L_DES_GL_Headset","PSZ_V_UKO_L_DES_MG_Headset","PSZ_V_UKO_L_DES_M_Headset","PSZ_V_UKO_L_DES_R_Headset","PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset"]; 	
_heavyRig = ["PSZ_V_UKO_L_DES_CO_Headset","PSZ_V_UKO_L_DES_GL_Headset","PSZ_V_UKO_L_DES_MG_Headset","PSZ_V_UKO_L_DES_M_Headset","PSZ_V_UKO_L_DES_R_Headset","PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset"];

// Siły specjalne
_diverUniform =  ["PSZ_U_PL_DES_wz2010_Crye_Folded","PSZ_U_PL_DES_wz2010_Polar"];
_diverHelmet = ["PSZ_H_wz2005_OLIVE_ESS","PSZ_H_wz2005_DES_ESS", "PSZ_H_wz2005_DES"];
_diverRig = ["PSZ_V_UKO_L_DES_M_Headset","PSZ_V_UKO_L_DES_R_Headset", "PSZ_V_UKO_L_WDL_R_Headset"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["PSZ_U_PL_Pilot_Coverall"];
_pilotHelmet = ["PSZ_H_THL5"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// Załoga pojazdu
_crewUniform = ["PSZ_U_PL_WDL_wz2010_Crye"];
_crewHelmet = ["rhsusf_cvc_green_alt_helmet"];
_crewRig = ["PSZ_V_Kontraktor_DES"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"]; //DLC alternatives: ["U_B_FullGhillie_lsh","U_B_FullGhillie_ard","U_B_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
		
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};	
		
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//Polska Woodland
	case 6:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_M952V";				// Latarka (RHS)
_attach3 = "acc_pointer_IR";				// czerwony laser (ARMA)

//_silencer1 = "muzzle_snds_M";				// Tłumik 5.56 (długi)
//_silencer2 = "BWA3_muzzle_snds_G36";		// Tłumik 5.56 (krótki)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x (RHS)

_bipod1 = "";								// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_attachments = [_attach2,_scope1]; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
//_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
//_hg_silencer2 = "muzzle_snds_L";	// SF pistol suppressor
//_hg_scope1 = "optic_MRD";			// MRD
//_hg_attachments= []; 

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "PSZ_Beryl04_G";
_riflemag = "PSZ_556x45_Beryl_30";
_riflemag_tr = "PSZ_556x45_Beryl_30_T_R";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "PSZ_BerylMini04_G";
_carbinemag = "PSZ_556x45_Beryl_30";
_carbinemag_tr = "PSZ_556x45_Beryl_30_T_R";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Siły specjalne
_diverWepCaS = "PSZ_Radon_HG";
_diverMagCaS = "PSZ_556x45_STANAG_30";
_diverWepM = "PSZ_Radon_HG";
_diverMagM = "PSZ_556x45_STANAG_30";
_diverWepR = "PSZ_Radon";
_diverMagR = "PSZ_556x45_STANAG_30";
_secendWep = "PSZ_P99";
_secendMag = "PSZ_9x19_P99_16";

// Broń z granatnikiem (dla dowóców)
_glrifle = "PSZ_Beryl04_GPBO_G";
_glriflemag = "PSZ_556x45_Beryl_30";
_glriflemag_tr = "PSZ_556x45_Beryl_30_T_G";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "PSZ_P99";
_pistolmag = "PSZ_9x19_P99_16";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_RPK12";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy (broń DLC)
_DMrifle = "srifle_DMR_06_camo_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
//_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v3";

// Strzelec AA
_SAM = "PSZ_Grom";
_SAMmag = "PSZ_Grom_AA";

// Strzelec HAT
_HAT = "PSZ_Spike_LR";
_HATmag1 = "PSZ_Spike_THEAT";
_HATmag2 = "PSZ_Spike_THEAT";
_HAT_Mobile = true; 	//HAT mobilny - Spike		HAT statyczny - SPG-9

// Snajper
_SNrifle = "srifle_LRR_F";
_SNrifleMag = "7Rnd_408_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		// Spadochron

_bagFTL = "B_Kitbag_rgr";				// Plecak dla dowódcy (radio)
_bagPP = "B_Kitbag_rgr";                // Plecak dla pilota (radio)

_bagTL = "PSZ_B_wz93_WDL";						//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_rgr";					// Plecak dla medyka (mały)
_bagMm = "PSZ_B_wz93_Medical_WDL";				// Plecak dla medyka (średni)
_bagMb = "PSZ_B_wz93_Medical_WDL";              // Plecak dla medyka (duży)

_bagARs = "B_AssaultPack_rgr";					// Plecak dla RKM (mały)
_bagARm = "PSZ_B_wz97_WDL";						// Plecak dla RKM (średni)
_bagARb = "PSZ_B_wz97_WDL";						// Plecak dla RKM (duży)

_bagENG = "B_AssaultPack_rgr";					// Plecak dla Mechanika

_bagR = "PSZ_B_wz93_WDL";						// Plecak dla strzelca, strzelca AT

_bagMAT = "PSZ_B_wz97_WDL";						// Plecak dla MAT

_bagmedium = "B_TacticalPack_oli";				// carries 200, weighs 30
_baglarge =  "PSZ_B_wz97_DES"; 					// carries 320, weighs 40

_bagmediumdiver =  "PSZ_B_wz93_WDL";			// Plecaki SF

_baguav = "B_Kitbag_rgr";				// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";						// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "RHS_SPG9_Gun_Bag";				// used by Heavy AT gunner
_baghatag = "RHS_SPG9_Tripod_Bag";			// used by Heavy AT assistant gunner
_bagmtrg = "B_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "B_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = [];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];


// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["PSZ_U_PL_WDL_wz2010_Crye","PSZ_U_PL_WDL_wz2010_Polar","PSZ_U_PL_WDL_wz2010_Crye_Folded"];
_baseHelmet = ["PSZ_H_wz2005_OLIVE_ESS","PSZ_H_wz2005_WDL","PSZ_H_wz2005_WDL_ESS"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset","PSZ_V_UKO_H_WDL_M","PSZ_V_UKO_L_WDL_R","PSZ_V_UKO_L_WDL_R_Headset"];
_mediumRig = ["PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset","PSZ_V_UKO_H_WDL_M","PSZ_V_UKO_L_WDL_R","PSZ_V_UKO_L_WDL_R_Headset"]; 	// default for all infantry classes
_heavyRig = ["PSZ_V_UKO_L_WDL_CO_Headset","PSZ_V_UKO_L_WDL_GL_Headset","PSZ_V_UKO_L_WDL_R_Headset","PSZ_V_UKO_H_WDL_M","PSZ_V_UKO_L_WDL_R","PSZ_V_UKO_L_WDL_R_Headset"];

// Siły specjalne
_diverUniform =  ["PSZ_U_PL_WDL_wz2010_Polar","PSZ_U_PL_DES_wz2010_Polar"];
_diverHelmet = ["PSZ_H_wz2005_WDL_ESS","PSZ_H_wz2005_OLIVE_ESS"];
_diverRig = ["PSZ_V_UKO_L_WDL_M_Headset","PSZ_V_UKO_L_WDL_R_Headset"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["PSZ_U_PL_Pilot_Coverall"];
_pilotHelmet = ["PSZ_H_THL5"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// Załoga pojazdu
_crewUniform = ["PSZ_U_PL_DES_wz2010_Polar"];
_crewHelmet = ["rhsusf_cvc_green_alt_helmet"];
_crewRig = ["PSZ_V_Kontraktor_WDL"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"]; //DLC alternatives: ["U_B_FullGhillie_lsh","U_B_FullGhillie_ard","U_B_FullGhillie_sard"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
	
  };  
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};
		
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//US Desert [CW]
	case 7:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_tan";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_attachments = []; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "gst_m16a2_2";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "hlc_rifle_M14";
_carbinemag = "20Rnd_762x51_Mag";
_carbinemag_tr = "rhsusf_20Rnd_762x51_m62_Mag";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
//_diverWepCaS = "rhs_weap_m4a1_blockII_grip2_KAC";
//_diverMagCaS = "30Rnd_556x45_Stanag";
//_diverWepM = "hlc_rifle_samr2";
//_diverMagM = "30Rnd_556x45_Stanag";
//_diverWepR = "rhs_weap_m249_pip_S_vfg";
//_diverMagR = "rhsusf_100Rnd_556x45_soft_pouch";
//_secendWep = "hlc_smg_mp5k";
//_secendMag = "hlc_30Rnd_9x19_SD_MP5";

// Broń z granatnikiem (dla dowódców)
_glrifle = "gst_m16a2_gl";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m1911a1";
_pistolmag = "rhsusf_mag_7x45acp_MHP";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "hlc_lmg_m60";
_MMGmag = "hlc_100Rnd_762x51_M_M60E4";
_MMGmag_tr = "hlc_100Rnd_762x51_M_M60E4";

// Strzelec wyborowy
_DMrifle = "hlc_rifle_M21_Rail";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "rhs_m72a7_mag";

// Strzelec MAT
_MAT = "rhs_weap_maaws";
_MATmag1 = "rhs_mag_maaws_HEAT";
_MATmag2 = "rhs_mag_maaws_HEDP";
_MAT_sight = "rhs_optic_maaws";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = false;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_m24sws_blk";
_SNrifleMag = "rhsusf_5Rnd_762x51_m118_special_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";					// Spadochron

_bagFTL = "usm_pack_st138_prc77";				// Plecak dla dowódcy (radio)
_bagPP = "usm_pack_st138_prc77";             	// Plecak dla pilota (radio)

_bagTL = "B_Kitbag_cbr";					//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_cbr";				// Plecak dla medyka (mały)
_bagMm = "B_TacticalPack_oli";				// Plecak dla medyka (średni)
_bagMb = "B_Kitbag_cbr";               		// Plecak dla medyka (duży)

_bagARs = "B_AssaultPack_cbr";				// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_cbr";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_cbr";                 // Plecak dla RKM (duży)

_bagENG = "B_AssaultPack_cbr";				// Plecak dla Mechanika

_bagR = "B_Kitbag_cbr";						// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_cbr";					// Plecak dla MAT

_bagmedium = "B_TacticalPack_oli";			// carries 200, weighs 30
_baglarge =  "B_Carryall_cbr"; 				// carries 320, weighs 40

_bagmediumdiver =  "B_AssaultPack_cbr";		// Plecaki SF

_baguav = "usm_pack_st138_prc77";					// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["matg","matag","hatg","hatag"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["usm_bdu_dcu"];
_baseHelmet = ["usm_helmet_pasgt_dcu","usm_helmet_pasgt_g_dcu"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["usm_vest_pasgtdcu_lbv_gr","usm_vest_pasgtdcu_lbv_mg","usm_vest_pasgtdcu_lbv_rmp"];
_mediumRig = ["usm_vest_rba_lbe_gr","usm_vest_rba_lbe_mg","usm_vest_rba_lbe_rmp","usm_vest_rba_lbe_rm","usm_vest_rba_lbv_gr","usm_vest_rba_lbv_mg","usm_vest_rba_lbv_rmp"];
_heavyRig = ["usm_vest_rba_lbe_gr","usm_vest_rba_lbe_mg","usm_vest_rba_lbe_rmp","usm_vest_rba_lbe_rm","usm_vest_rba_lbv_gr","usm_vest_rba_lbv_mg","usm_vest_rba_lbv_rmp"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_FROG01_m81"];
_diverHelmet = ["rhsusf_mich_bare_headset","rhsusf_ach_bare_headset_ess","rhsusf_ach_helmet_M81"];
_diverRig = ["rhsusf_spc_marksman","rhsusf_spc_light"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["rhsusf_hgu56p","rhsusf_hgu56p_visor_mask_skull"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_TacVest_blk"];
_sfGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_olive"];
_crewHelmet = ["rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet"];
_crewRig = ["rhsusf_spc_crewman"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;	
	
  };

// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};	
		
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//US Woodland [CW]
	case 8:
	{
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "acc_flashlight";				// Latarka

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_tan";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_attachments = []; 			// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "rhsusf_acc_omega9k";	// 9mm tłumik do Glocka 17
_hg_attah1 = "acc_flashlight_pistol";
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "gst_m16a2_2";
_riflemag = "30Rnd_556x45_Stanag";
_riflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "hlc_rifle_M14";
_carbinemag = "20Rnd_762x51_Mag";
_carbinemag_tr = "rhsusf_20Rnd_762x51_m62_Mag";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Siły specjalne
//_diverWepCaS = "rhs_weap_m4a1_blockII_grip2_KAC";
//_diverMagCaS = "30Rnd_556x45_Stanag";
//_diverWepM = "hlc_rifle_samr2";
//_diverMagM = "30Rnd_556x45_Stanag";
//_diverWepR = "rhs_weap_m249_pip_S_vfg";
//_diverMagR = "rhsusf_100Rnd_556x45_soft_pouch";
//_secendWep = "hlc_smg_mp5k";
//_secendMag = "hlc_30Rnd_9x19_SD_MP5";

// Broń z granatnikiem (dla dowódców)
_glrifle = "gst_m16a2_gl";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m1911a1";
_pistolmag = "rhsusf_mag_7x45acp_MHP";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "hlc_lmg_m60";
_MMGmag = "hlc_100Rnd_762x51_M_M60E4";
_MMGmag_tr = "hlc_100Rnd_762x51_M_M60E4";

// Strzelec wyborowy
_DMrifle = "hlc_rifle_M21_Rail";
_DMriflemag = "rhsusf_20Rnd_762x51_m118_special_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "rhs_m72a7_mag";

// Strzelec MAT
_MAT = "rhs_weap_maaws";
_MATmag1 = "rhs_mag_maaws_HEAT";
_MATmag2 = "rhs_mag_maaws_HEDP";
_MAT_sight = "rhs_optic_maaws";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
_HAT = "rhs_weap_fgm148";		
_HATmag1 = "rhs_fgm148_magazine_AT";
_HATmag2 = "rhs_fgm148_magazine_AT";
_HAT_Mobile = false;			//true - Javelin		false - TOW

// Snajper
_SNrifle = "rhs_weap_m24sws_blk";
_SNrifleMag = "rhsusf_5Rnd_762x51_m118_special_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";					// Spadochron

_bagFTL = "usm_pack_st138_prc77";				// Plecak dla dowódcy (radio)
_bagPP = "usm_pack_st138_prc77";             	// Plecak dla pilota (radio)

_bagTL = "B_Kitbag_rgr";					//Plecak dowódcy drużyny

_bagMs = "usm_pack_m5_medic";				// Plecak dla medyka (mały)
_bagMm = "usm_pack_m5_medic";				// Plecak dla medyka (średni)
_bagMb = "B_Kitbag_rgr";               		// Plecak dla medyka (duży)

_bagARs = "B_AssaultPack_rgr";				// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_rgr";					// Plecak dla RKM (średni)
_bagARb = "usm_pack_alice";                 // Plecak dla RKM (duży)

_bagENG = "B_AssaultPack_rgr";				// Plecak dla Mechanika

_bagR = "B_Kitbag_rgr";						// Plecak dla strzelca, strzelca AT

_bagMAT = "usm_pack_alice";					// Plecak dla MAT

_bagmedium = "B_TacticalPack_oli";			// carries 200, weighs 30
_baglarge =  "usm_pack_alice"; 				// carries 320, weighs 40

_bagmediumdiver =  "B_AssaultPack_rgr";		// Plecaki SF

_baguav = "usm_pack_st138_prc77";					// Plecak RTO

_baghmgg = "RHS_M2_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_M2_MiniTripod_Bag";			// used by Heavy MG assistant gunner

_baghatg = "rhs_Tow_Gun_Bag";					// used by Heavy AT gunner
_baghatag = "rhs_TOW_Tripod_Bag";				// used by Heavy AT assistant gunner

_bagmtrg = "rhs_M252_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "rhs_M252_Bipod_Bag";			// used by Mortar assistant gunner

_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["matg","matag","hatg","hatag"];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["usm_bdu_w"];
_baseHelmet = ["usm_helmet_pasgt_g_w","usm_helmet_pasgt_w"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["usm_vest_pasgt_lbv_mg","usm_vest_pasgt_lbv_rmp","usm_vest_pasgt_lbv_rm","usm_vest_pasgt_lbe_rm"];
_mediumRig = ["usm_vest_rba_lbe_gr","usm_vest_rba_lbe_mg","usm_vest_rba_lbe_rmp","usm_vest_rba_lbe_rm","usm_vest_rba_lbv_gr","usm_vest_rba_lbv_mg","usm_vest_rba_lbv_rmp"];
_heavyRig = ["usm_vest_rba_lbe_gr","usm_vest_rba_lbe_mg","usm_vest_rba_lbe_rmp","usm_vest_rba_lbe_rm","usm_vest_rba_lbv_gr","usm_vest_rba_lbv_mg","usm_vest_rba_lbv_rmp"];

// Siły specjalne
_diverUniform =  ["usm_bdu_w"];
_diverHelmet = ["rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_alt_tan"];
_diverRig = ["rhsusf_mbav_rifleman","rhsusf_mbav_mg"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_B_HeliPilotCoveralls"];
_pilotHelmet = ["rhsusf_hgu56p_visor_usa","rhsusf_hgu56p_usa"];
_pilotRig = ["V_TacVest_blk"];
_pilotGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["H_PilotHelmetFighter_B"];
_sfRig = ["V_TacVest_blk"];
_sfGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_olive"];
_crewHelmet = ["rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet"];
_crewRig = ["rhsusf_spc_crewman"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================

	// Przedmioty uniwersalne dla klas
	// Dodanie przedmiotów do każdej jednstki (gracza)

	call Medical;
	
  };

// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_No_NVG;

};
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************
	//Everon Defense Forces [U]
	case 9: 
	{
// Dodatki broń główna
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_tan";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {			// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_attach2];		//NOC
} else {
	_attachments = [_attach2];		//DZIEŃ 			
};

// [] = brak dodatków
// [_attach1,_scope1] = usuwa dodatki a na ich miejsce dodaje _attach1, _scope1
// [_scope2] = dodaje tylko _scope2, reszta zostaje usunięta
// false = nie zmieniaj dodatków, zostaw tak jak domyślnie arma respi na broni

// ====================================================================================
// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];
// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "hlc_rifle_STGW57";
_riflemag = "hlc_24Rnd_75x55_B_stgw";
_riflemag_tr = "hlc_24Rnd_75x55_T_stgw";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "hlc_rifle_stgw57_commando";
_carbinemag = "hlc_24Rnd_75x55_B_stgw";
_carbinemag_tr = "hlc_24Rnd_75x55_T_stgw";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_pp2000";
_smgmag = "rhs_mag_9x19mm_7n21_44";
_smgmag_tr = "rhs_mag_9x19mm_7n21_44";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_m16a4_carryhandle_M203";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m9";
_pistolmag = "rhsusf_mag_15Rnd_9x19_FMJ";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "rhs_weap_m249";
_ARmag = "rhsusf_100Rnd_556x45_soft_pouch";
_ARmag_tr = "rhsusf_100Rnd_556x45_soft_pouch";

// Strzelec MMG
_MMG = "hlc_lmg_MG3";
_MMGmag = "hlc_100Rnd_762x51_M_MG3";
_MMGmag_tr = "hlc_100Rnd_762x51_T_MG3";

// Strzelec wyborowy (broń DLC)
_DMrifle = "srifle_DMR_06_camo_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v3";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
//_HAT = "";
//_HATmag1 = "";
//_HATmag2 = "";
_HAT_Mobile = false; 	//HAT statyczny - Kornet

// Snajper
_SNrifle = "rhs_weap_M107";
_SNrifleMag = "rhsusf_mag_10Rnd_STD_50BMG_M33";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";						// Spadochron

_bagFTL = "tfw_ilbe_gr";						// Plecak dla dowódcy (radio)
_bagPP = "tfw_ilbe_gr";                  		// Plecak dla pilota (radio)

_bagTL = "B_AssaultPack_blk";					//Plecak dowódcy drużyny

_bagMs = "B_TacticalPack_blk";					// Plecak dla medyka (mały)
_bagMm = "B_AssaultPack_blk";					// Plecak dla medyka (średni)
_bagMb = "B_AssaultPack_blk";        			// Plecak dla medyka (duży)

_bagARs = "B_TacticalPack_blk";					// Plecak dla RKM (mały)
_bagARm = "B_Carryall_oli";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                   	// Plecak dla RKM (duży)

_bagENG = "B_TacticalPack_blk";					// Plecak dla Mechanika

_bagR = "B_AssaultPack_blk";					// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_oli";						// Plecak dla MAT

_bagmedium = "B_TacticalPack_blk";				// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "B_AssaultPack_blk";			// Plecaki SF

_baguav = "tfw_ilbe_gr";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "RHS_Kornet_Gun_Bag";				// used by Heavy AT gunner
_baghatag = "RHS_Kornet_Tripod_Bag";			// used by Heavy AT assistant gunner
_bagmtrg = "B_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "B_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = [];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhsgref_uniform_tigerstripe"];
_baseHelmet = ["rhsgref_helmet_M1_bare_alt01","rhsgref_helmet_M1_painted"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["V_TacVestIR_blk", "V_TacVest_blk"];
_mediumRig = ["V_TacVestIR_blk", "V_TacVest_blk"];
_heavyRig = ["V_TacVestIR_blk", "V_TacVest_blk"];

// Siły specjalne
_diverUniform =  ["rhsgref_uniform_tigerstripe"];
_diverHelmet = ["rhsusf_protech_helmet_rhino", "rhsusf_protech_helmet_rhino_ess"];
_diverRig = ["V_TacVestIR_blk"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhsgref_uniform_tigerstripe"];
_pilotHelmet = ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike"];
_pilotRig = ["V_BandollierB_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_tigerstripe"];
_crewHelmet = ["rhsusf_cvc_green_helmet"];
_crewRig = ["V_TacVest_blk"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================
	// Dodanie przedmiotów medycznych do każdej jednstki (gracza)	
	call Medical;
	
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_NVG;

};

//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************
	//Altis Defence Forces [U]
	case 10: 
	{
// Dodatki broń główna
_attach1 = "rhsusf_acc_anpeq15side_bk";		// Laser (RHS)
_attach2 = "rhsusf_acc_anpeq15_bk_light";	// Laser i latarka (można przełączyć) (RHS)
_attach3 = "rhsusf_acc_M952V";				// Latarka (RHS)

_silencer1 = "rhsusf_acc_nt4_black";		// Tłumik 5.56 (długi) (RHS)
_silencer2 = "rhsusf_acc_rotex5_tan";		// Tłumik 5.56 (krótki) (RHS)

_scope1 = "rhsusf_acc_eotech_552";				// Eotech (Czarny PSZ)
_scope2 = "rhsusf_acc_compm4";				// Aimpoint (RHS)
_scope3 = "rhsusf_acc_M8541";		// Celownik snajperski 6.5-20x

_bipod1 = "rhsusf_acc_harris_bipod";		// 
_bipod2 = "bipod_02_F_blk";					// 

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {			// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_attach2];		//NOC
} else {
	_attachments = [_attach2];		//DZIEŃ 			
};

// [] = brak dodatków
// [_attach1,_scope1] = usuwa dodatki a na ich miejsce dodaje _attach1, _scope1
// [_scope2] = dodaje tylko _scope2, reszta zostaje usunięta
// false = nie zmieniaj dodatków, zostaw tak jak domyślnie arma respi na broni

// ====================================================================================
// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];
// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "hlc_rifle_M14";
_riflemag = "20Rnd_762x51_Mag";
_riflemag_tr = "rhsusf_20Rnd_762x51_m62_Mag";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_savz58v_black";
_carbinemag = "rhs_30Rnd_762x39mm_Savz58";
_carbinemag_tr = "rhs_30Rnd_762x39mm_Savz58_tracer";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "hlc_smg_mp5a2";
_smgmag = "hlc_30Rnd_9x19_B_MP5";
_smgmag_tr = "hlc_30Rnd_9x19_B_MP5";

// Broń z granatnikiem (dla dowóców)
_glrifle = "gst_m16a2_gl";
_glriflemag = "30Rnd_556x45_Stanag";
_glriflemag_tr = "30Rnd_556x45_Stanag_Tracer_Red";
_glmag = "1Rnd_HE_Grenade_shell";

// Pistolet (dla wszystkich klas)
_pistol = "rhsusf_weap_m9";
_pistolmag = "rhsusf_mag_15Rnd_9x19_FMJ";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_rpk74n";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_m240G";
_MMGmag = "rhsusf_100Rnd_762x51";
_MMGmag_tr = "rhsusf_100Rnd_762x51_m62_tracer";

// Strzelec wyborowy (broń DLC)
_DMrifle = "srifle_DMR_06_camo_F";
_DMriflemag = "20Rnd_762x51_Mag";

// Strzelec AT
_RAT = "rhs_weap_m72a7";
//_RATmag = "";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v3";

// Strzelec AA
_SAM = "rhs_weap_fim92";
_SAMmag = "rhs_fim92_mag";

// Strzelec HAT
//_HAT = "";
//_HATmag1 = "";
//_HATmag2 = "";
_HAT_Mobile = false; 	//HAT statyczny - SPG-9

// Snajper
_SNrifle = "rhs_weap_M107";
_SNrifleMag = "rhsusf_mag_10Rnd_STD_50BMG_M33";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";						// Spadochron

_bagFTL = "tfw_ilbe_gr";						// Plecak dla dowódcy (radio)
_bagPP = "tfw_ilbe_gr";                  		// Plecak dla pilota (radio)

_bagTL = "B_AssaultPack_blk";					//Plecak dowódcy drużyny

_bagMs = "B_TacticalPack_blk";					// Plecak dla medyka (mały)
_bagMm = "B_AssaultPack_blk";					// Plecak dla medyka (średni)
_bagMb = "B_AssaultPack_blk";        			// Plecak dla medyka (duży)

_bagARs = "B_TacticalPack_blk";					// Plecak dla RKM (mały)
_bagARm = "B_Carryall_oli";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                   	// Plecak dla RKM (duży)

_bagENG = "B_TacticalPack_blk";					// Plecak dla Mechanika

_bagR = "B_AssaultPack_blk";					// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_oli";						// Plecak dla MAT

_bagmedium = "B_TacticalPack_blk";				// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "B_AssaultPack_blk";			// Plecaki SF

_baguav = "tfw_ilbe_gr";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "RHS_SPG9_Gun_Bag";				// used by Heavy AT gunner
_baghatag = "RHS_SPG9_Tripod_Bag";			// used by Heavy AT assistant gunner
_bagmtrg = "B_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "B_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "B_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "B_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = [];
_heavy =  ["eng","engm"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhsgref_uniform_altis_lizard"];
_baseHelmet = ["rhsgref_helmet_pasgt_altis_lizard","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_painted_alt01"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["V_TacVest_khk", "V_TacVest_oli"];
_mediumRig = ["V_TacVest_khk", "V_TacVest_oli"];
_heavyRig = ["V_TacVest_khk", "V_TacVest_oli"];

// Siły specjalne
_diverUniform =  ["rhsgref_uniform_altis_lizard"];
_diverHelmet = ["rhsusf_protech_helmet_rhino", "rhsusf_protech_helmet_rhino_ess"];
_diverRig = ["V_TacVest_khk"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhsgref_uniform_olive"];
_pilotHelmet = ["rhs_zsh7a_mike_alt", "rhs_zsh7a_mike"];
_pilotRig = ["V_BandollierB_blk"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_olive"];
_crewHelmet = ["rhsusf_cvc_green_alt_helmet"];
_crewRig = ["V_TacVest_blk"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_B_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_rgr"];
_ghillieGlasses = [];

// JET Pilot
_sfuniform = ["U_B_PilotCoveralls"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);	// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks

	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

// ====================================================================================

	// HANDLE CLOTHES
	// Handle clothes and helmets and such using the include file called next.

	#include "f_assignGear_clothes.sqf";

// ====================================================================================
	// Dodanie przedmiotów medycznych do każdej jednstki (gracza)	
	call Medical;
	
  };
  
// ====================================================================================
	//WYWOŁANIE BUILDERA
	call Builder;
	
	//Dodanie nocnego wyposażenia
	call Night_Eq_NVG;

};


// ====================================================================================
// ====================================================================================
//END CASE STATEMENT		

};

// ====================================================================================
// ====================================================================================
// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// ====================================================================================
// Handle weapon attachments
#include "f_assignGear_attachments.sqf";

// ====================================================================================
// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING
_unit selectweapon primaryweapon _unit;
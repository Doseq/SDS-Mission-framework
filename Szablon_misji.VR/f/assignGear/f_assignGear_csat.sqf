// ====================================================================================
// S.D.S Assign Gear Script - [V-1.7 | 20.04.2017]
// ====================================================================================

//	SPIS TRESCI
/*

	1.	Rosja VDV Desert
	2.	Rosja VDV Woodland
	3.	Rosja MSV Woodland
	4.	Separatyści
	5.	ZSRR Desert [CW]
	6.	ZSRR Woodland [CW]
	
*/
// ====================================================================================
	_loadout_faction_player = f_param_player_faction_Opfor;
// ====================================================================================

//Definicje przedmiotów

// Sprzet medyczny
_personalAidKit = "ACE_personalAidKit";		// Zestaw pierwszej pomocy
_surgicalKit = "ACE_surgicalKit";			// Zestaw do szycia ran
_bandage = "ACE_quikclot";					// Opatrunek "Quik Clot" dla piechoty
_epinephrine = "ACE_epinephrine";			// Epinefryna
_morphine = "ACE_morphine";					// Morfina
_blood = "ACE_bloodIV_500";					// Krew 500 ml
_plasma = "ACE_plasmaIV_500";				// Osocze 500 ml
_saline = "ACE_salineIV_500";				// Sól fizjologiczna 500 ml
_firstaid = "FirstAidKit";
_medkit = "Medikit";

//Przydatne rzeczy
_earplugs = "ACE_EarPlugs";
_IRstrobe = "ACE_IR_Strobe_Item";
_latarka = "ACE_Flashlight_XL50";
_lornetkaAM = "rhs_pdu4";
_lornetkaFTL = "Binocular";
_GPS = "ItemGPS";
_Antena_RTO = "tfw_rf3080Item";

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

//Przedmioty w skrzyniach
_satche_small = "DemoCharge_Remote_Mag";
_satche_big = "SatchelCharge_Remote_Mag";
_toolkit = "ToolKit";
_zapalnik = "ACE_M26_Clacker";
_n_rozbraja = "ACE_DefusalKit";
_saperka = "ACE_EntrenchingTool";
_wirecutter = "ACE_wirecutter";

// Granaty ręczne
_grenade = "rhs_mag_rgd5";
_mgrenade = "ACE_M84";
_smokegrenade = "SmokeShell";

//Granaty dymne
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";
_smokegrenadered = "SmokeShellRed";
_smokegrenadeblue = "SmokeShellBlue";

// Granaty dymne do granatnika
_glsmokewhite = "rhs_GRD40_White";
_glsmokegreen = "rhs_GRD40_Green";
_glsmokered = "rhs_GRD40_Red";

// Flary do granatnika
_glflarewhite = "rhs_VG40OP_white";
_glflarered = "rhs_VG40OP_red";
_glflaregreen = "rhs_VG40OP_green";

// Noktowizja
_nvg = "rhs_1PN138";

// UAV Terminal
_uavterminal = "O_UavTerminal";

// Mechanicy/saperzy
_ATmine = "ATMine_Range_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

//Konstruktor BUILDERA
Builder ={	
	_backpack = {
		_typeofBackPack = _this select 0;
		_loadout = f_param_backpacks;
		if (count _this > 1) then {_loadout = _this select 1};
		switch (_typeofBackPack) do
		{
			#include "f_assignGear_csat_b.sqf";
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
		#include "f_assignGear_csat_builder.sqf";
};
	
//Dodanie wyposażenia medycznego
Medical = {
	for "_p" from 1 to 12 do {_unit addItem _bandage;};		// Dodanie 12 sztuk bandaży
	for "_p" from 1 to 2 do {_unit addItem _morphine;};		// Dodanie 2 sztuk morfiny
	for "_p" from 1 to 2 do {_unit addItem _epinephrine;};	// Dodanie 2 sztuk epinefryny	
	_unit linkItem "ItemMap";		// Dodanie mapy
	_unit linkItem "ItemCompass";	// Dodanie kompsu
	_unit linkItem "ItemRadio";		// Dodanie radia (nie z taskforce)
	_unit linkItem "tf_microdagr";	// Dodanie zegarka
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
			(unitBackpack _unit) addItemCargoGlobal [_chemred,2];
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
			(unitBackpack _unit) addItemCargoGlobal [_chemred,2];
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

	//Rosja VDV Desert
	case 1: 
	{
_attach1 = "rhs_acc_2dpZenit_ris";		// Latarka (RHS)
_attach2 = "rhs_acc_perst3";			// Laser (RHS)
_attach3 = "rhs_acc_perst3_2dp_h";		// Latarka+Laser (RHS)

_silencer1 = "rhs_acc_dtk";				// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "optic_ACO_grn";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "rhs_acc_grip_ffg2";			// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {								// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_silencer1,_attach2,_scope1,_bipod1]; 		//NOC
} else {
	_attachments = [_silencer1,_attach1,_scope1,_bipod1]; 		//DZIEŃ 			
};

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74mr";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_ak74mr";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74mr_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_pya";
_pistolmag = "rhs_mag_9x19_17";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_RPK12";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkp";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "B_Kitbag_sgg";						//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_khk";					// Plecak dla medyka (mały)
_bagMm = "B_FieldPack_oli";						// Plecak dla medyka (średni)
_bagMb = "B_TacticalPack_oli";               	// Plecak dla medyka (duży)

_bagARs = "rhs_assault_umbts";					// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_sgg";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                     // Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "B_FieldPack_oli";						// Plecak dla strzelca, strzelca AT

_bagMAT = "rhs_rpg_empty";						// Plecak dla MAT

_bagmedium = "B_Kitbag_sgg";					// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "rhs_assault_umbts";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner

_bagmtrg = "O_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "O_Mortar_01_support_F";			// used by Mortar assistant gunner

_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar"];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = ["ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_vdv_emr_des"];
_baseHelmet = ["rhs_6b47","rhs_6b47_ess"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b23_digi_medic"];
_mediumRig = ["rhs_6b23_digi_6sh92_headset_spetsnaz","rhs_6b23_digi_6sh92_Spetsnaz","rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz","rhs_6b23_digi_6sh92","rhs_6b23_digi_rifleman","rhs_6b23_digi_6sh92_vog"];
_heavyRig = ["rhs_6b23_digi_6sh92_headset_spetsnaz","rhs_6b23_digi_6sh92_Spetsnaz","rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz","rhs_6b23_digi_6sh92","rhs_6b23_digi_rifleman","rhs_6b23_digi_6sh92_vog"];

// Siły specjalne
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIR"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["rhs_uniform_df15_tan"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_zsh7a","rhs_gssh18"];
_pilotRig = ["rhs_vest_commander"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_mflora_patchless"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"]; 
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["rhs_uniform_df15_tan"];
_sfhelmet = ["rhs_zsh7a_alt"];
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
	//Dodanie nocnego wyposażenia
	call Night_Eq_NVG;
	
	//WYWOŁANIE BUILDERA
	call Builder;
		
};
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//Rosja VDV Woodland
	case 2:
	{
_attach1 = "rhs_acc_2dpZenit_ris";		// Latarka (RHS)
_attach2 = "rhs_acc_perst3";			// Laser (RHS)
_attach3 = "rhs_acc_perst3_2dp_h";		// Latarka+Laser (RHS)

_silencer1 = "rhs_acc_dtk";				// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "optic_ACO_grn";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "rhs_acc_grip_ffg2";			// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_loadout_night_day = f_param_night_day_wyp;
if (_loadout_night_day == 0) then {								// Każda jednostka otrzyma ten zestaw dodatków
	_attachments = [_silencer1,_attach2,_scope1,_bipod1]; 		//NOC
} else {
	_attachments = [_silencer1,_attach1,_scope1,_bipod1]; 		//DZIEŃ 			
};

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74mr";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_ak74mr";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74mr_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_pya";
_pistolmag = "rhs_mag_9x19_17";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_RPK12";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkp";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "rhs_assault_umbts";					//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_khk";					// Plecak dla medyka (mały)
_bagMm = "B_FieldPack_oli";						// Plecak dla medyka (średni)
_bagMb = "B_TacticalPack_oli";               	// Plecak dla medyka (duży)

_bagARs = "rhs_assault_umbts";					// Plecak dla RKM (mały)
_bagARm = "rhs_assault_umbts";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                     // Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "B_FieldPack_oli";						// Plecak dla strzelca, strzelca AT

_bagMAT = "rhs_rpg_empty";						// Plecak dla MAT

_bagmedium = "rhs_assault_umbts";				// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "rhs_assault_umbts";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner
_bagmtrg = "O_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "O_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_vdv_emr"];
_baseHelmet = ["rhs_6b47","rhs_6b47_ess"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b23_digi_medic"];
_mediumRig = ["rhs_6b23_digi_6sh92_headset","rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_6sh92_vog_headset","rhs_6b23_6sh116","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_vog"];
_heavyRig = ["rhs_6b23_digi_6sh92_headset","rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_6sh92_vog_headset","rhs_6b23_6sh116","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_vog"];

// Siły specjalne
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIR"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["rhs_uniform_df15"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_zsh7a","rhs_gssh18"];
_pilotRig = ["rhs_vest_commander"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_mflora_patchless"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_6b23_digi_crewofficer","rhs_6b23_digi_crew","rhs_6b23_digi_engineer"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"]; 
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["rhs_uniform_df15"];
_sfhelmet = ["rhs_zsh7a_alt"];
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
	//Dpdanie nocnego wyposażenia
	call Night_Eq_NVG;

	//WYWOŁANIE BUILDERA
	call Builder;
		
};	
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//Rosja MSV Woodland
	case 3:
	{
_attach1 = "rhs_acc_2dpZenit";			// Latarka (RHS)
_attach2 = "rhs_acc_perst1ik";			// Laser (RHS)

_silencer1 = "rhs_acc_dtk";				// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "rhs_acc_1p63";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "bipod_02_F_hex";				// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_attachments = [_silencer1,_attach1]; 	// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74m_2mag";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_ak74m";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74m_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_pya";
_pistolmag = "rhs_mag_9x19_17";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

/// Strzelec RKM
_AR = "hlc_rifle_rpk74n";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "B_Kitbag_sgg";						//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_khk";					// Plecak dla medyka (mały)
_bagMm = "B_FieldPack_oli";						// Plecak dla medyka (średni)
_bagMb = "B_TacticalPack_oli";               	// Plecak dla medyka (duży)

_bagARs = "rhs_assault_umbts";					// Plecak dla RKM (mały)
_bagARm = "B_Kitbag_sgg";						// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                     // Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "B_FieldPack_oli";						// Plecak dla strzelca, strzelca AT

_bagMAT = "rhs_rpg_empty";						// Plecak dla MAT

_bagmedium = "B_Kitbag_sgg";					// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "rhs_assault_umbts";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner

_bagmtrg = "O_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "O_Mortar_01_support_F";			// used by Mortar assistant gunner

_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_flora_patchless"];
_baseHelmet = ["rhs_6b27m_green","rhs_6b27m_green_ess","rhs_6b27m","rhs_6b27m_ess"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b23_medic"];
_mediumRig = ["rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_radio","rhs_6b13_Flora_6sh92_vog"];
_heavyRig =  ["rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_radio","rhs_6b13_Flora_6sh92_vog"];

// Siły specjalne
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIR"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["rhs_uniform_df15"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_zsh7a","rhs_gssh18"];
_pilotRig = ["rhs_vest_commander"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_mflora_patchless"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"]; 
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["rhs_uniform_df15"];
_sfhelmet = ["rhs_zsh7a_alt"];
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
	//Dpdanie nocnego wyposażenia
	call Night_Eq_No_NVG;

	//WYWOŁANIE BUILDERA
	call Builder;
		
};	
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//Separatyści
	case 4:
	{
_attach1 = "rhs_acc_2dpZenit";			// Latarka (RHS)
_attach2 = "rhs_acc_perst1ik";			// Laser (RHS)

_silencer1 = "rhs_acc_dtk1983";			// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "rhs_acc_1p63";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "bipod_02_F_hex";				// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_attachments = [_silencer1,_attach1]; 	// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_aks74";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_makarov_pmm";
_pistolmag = "rhs_mag_9x18_12_57N181S";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_rpk74n";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "rhs_assault_umbts";					//Plecak dowódcy drużyny

_bagMs = "B_AssaultPack_khk";					// Plecak dla medyka (mały)
_bagMm = "B_Kitbag_rgr";					// Plecak dla medyka (średni)
_bagMb = "B_Kitbag_rgr";               	// Plecak dla medyka (duży)

_bagARs = "rhs_assault_umbts";					// Plecak dla RKM (mały)
_bagARm = "B_TacticalPack_oli";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_oli";                     // Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "B_FieldPack_oli";						// Plecak dla strzelca, strzelca AT

_bagMAT = "rhs_rpg_empty";						// Plecak dla MAT

_bagmedium = "B_TacticalPack_oli";					// carries 200, weighs 30
_baglarge =  "B_Carryall_oli"; 					// carries 320, weighs 40

_bagmediumdiver =  "rhs_assault_umbts";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_NSV_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_NSV_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner
_bagmtrg = "O_Mortar_01_weapon_F";				// used by Mortar gunner
_bagmtrag = "O_Mortar_01_support_F";			// used by Mortar assistant gunner
_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["LOP_U_US_Fatigue_06","LOP_U_US_Fatigue_07","LOP_U_US_Fatigue_02","LOP_U_US_Fatigue_09","LOP_U_US_Fatigue_08","LOP_U_US_Fatigue_11","LOP_U_US_Fatigue_04","LOP_U_US_Fatigue_05","LOP_U_US_Fatigue_10"];
_baseHelmet = ["rhs_6b26_ess","LOP_H_6B27M_Skol","rhs_6b27m_digi","LOP_H_6B27M_Skol","rhs_beret_milp","LOP_H_6B27M_ess_Flora","rhs_beanie_green","rhs_6b27m_digi_ess","rhs_6b28_green_ess","rhs_6b28_green"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b23_medic"];
_mediumRig = ["rhs_6b23_6sh116","rhs_6b13_Flora_6sh92","LOP_V_6B23_6Sh92_OLV","rhs_6b23_6sh92","rhs_6b23_digi_6sh92_vog","LOP_V_6Sh92_Radio_OLV","rhs_6b13_6sh92","rhs_6b23_digi_6sh92_radio"];
_heavyRig =  ["rhs_6b23_6sh116","rhs_6b13_Flora_6sh92","LOP_V_6B23_6Sh92_OLV","rhs_6b23_6sh92","rhs_6b23_digi_6sh92_vog","LOP_V_6Sh92_Radio_OLV","rhs_6b13_6sh92","rhs_6b23_digi_6sh92_radio"];

// Siły specjalne
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIR"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["LOP_U_US_Fatigue_05"];
_pilotHelmet = ["rhs_zsh7a_mike_green"];
_pilotRig = ["rhs_6b23_digi_engineer"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["LOP_U_US_Fatigue_03"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["LOP_V_6Sh92_OLV","rhs_6b23_digi_crew","rhs_6b23_digi_rifleman"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["rhs_uniform_df15"];
_sfhelmet = ["rhs_zsh7a_alt"];
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
	//Dpdanie nocnego wyposażenia
	call Night_Eq_No_NVG;

	//WYWOŁANIE BUILDERA
	call Builder;
		
};	
	
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//ZSRR Desert [CW]
	case 5:
	{
_attach1 = "rhs_acc_2dpZenit";			// Latarka (RHS)
_attach2 = "rhs_acc_perst1ik";			// Laser (RHS)

_silencer1 = "rhs_acc_dtk";				// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "rhs_acc_1p63";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "bipod_02_F_hex";				// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_attachments = [_silencer1,_attach1]; 	// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_silencer2 = "muzzle_snds_L";	// SF Pistol suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_aks74";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_makarov_pmm";
_pistolmag = "rhs_mag_9x18_12_57N181S";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_rpk74n";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "rhs_assault_umbts";					//Plecak dowódcy drużyny

_bagMs = "rhs_sidorMG";							// Plecak dla medyka (mały)
_bagMm = "B_FieldPack_oli";						// Plecak dla medyka (średni)
_bagMb = "B_FieldPack_oli";               		// Plecak dla medyka (duży)

_bagARs = "B_FieldPack_cbr";					// Plecak dla RKM (mały)
_bagARm = "rhs_assault_umbts";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_cbr";						// Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "rhs_sidorMG";							// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_cbr";						// Plecak dla MAT

_bagmedium = "rhs_sidorMG";						// carries 200, weighs 30
_baglarge =  "B_Carryall_cbr"; 					// carries 320, weighs 40

_bagmediumdiver =  "B_Carryall_cbr";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_Kord_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_Kord_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner

_bagmtrg = "RHS_Podnos_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "RHS_Podnos_Bipod_Bag";				// used by Mortar assistant gunner

_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhs_uniform_m88_patchless"];
_baseHelmet = ["rhs_ssh68","ssh68_net_of"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b5_medic"];
_mediumRig = ["rhs_6b5","rhs_6b5_sniper","rhs_6b5_officer"];
_heavyRig = ["rhs_6b5","rhs_6b5_sniper","rhs_6b5_officer"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_gorka_r_y"];
_diverHelmet = ["rhs_ssh68"];
_diverRig = ["rhs_vydra_3m"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhs_uniform_df15_tan"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_gssh18"];
_pilotRig = ["rhs_vest_commander"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhs_uniform_m88_patchless"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_6b23_ML_crew","rhs_6b23_ML_crewofficer"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["rhs_uniform_df15_tan"];
_sfhelmet = ["rhs_zsh7a_alt"];
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
	//Dpdanie nocnego wyposażenia
	call Night_Eq_No_NVG;

	//WYWOŁANIE BUILDERA
	call Builder;
		
};	
		
//*****************************************************************************************************
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//*****************************************************************************************************

	//ZSRR Woodland [CW]
	case 6:
	{
_attach1 = "rhs_acc_2dpZenit";			// Latarka (RHS)
_attach2 = "rhs_acc_perst1ik";			// Laser (RHS)

_silencer1 = "rhs_acc_dtk";				// Tłumik płomieni (domyslny do wszytskich AK) (RHS)
_silencer2 = "rhs_acc_dtk4short";		// Tłumik (RHS)

_scope1 = "rhs_acc_1p63";				// Celownik holo (RHS)
_scope2 = "rhs_acc_pkas";				// Celownik holo (buguje RKM) (RHS)
_scope3 = "rhs_acc_pso1m2";				// Celownik optyczny (RHS)

_bipod1 = "bipod_02_F_hex";				// Default bipod
_bipod2 = "bipod_02_F_blk";				// Black bipod

// Jakie dodatki mają być dodane
_attachments = [_silencer1,_attach1]; 	// Każda jednostka otrzyma ten zestaw dodatków

// ====================================================================================

// Dodatki do pistoletu
_hg_silencer1 = "muzzle_snds_acp";	// .45 suppressor
_hg_silencer2 = "muzzle_snds_L";	// SF Pistol suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_ak74";
_riflemag = "rhs_30Rnd_545x39_AK";
_riflemag_tr = "rhs_30Rnd_545x39_7N22_AK";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_aks74";
_carbinemag = "rhs_30Rnd_545x39_AK";
_carbinemag_tr = "rhs_30Rnd_545x39_7N22_AK";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_7N22_AK";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_7N10_AK";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_makarov_pmm";
_pistolmag = "rhs_mag_9x18_12_57N181S";

// Siły specjalne
//_diverWepCaS = "arifle_min_rf_ak12_camo_grip";
//_diverMagCaS = "30Rnd_min_rf_545x39_mag";
//_diverWepR = "arifle_min_rf_ak12_camo_grip";
//_diverMagR = "30Rnd_min_rf_545x39_mag";
//_diverWepM = "arifle_min_rf_ak12_camo";
//_diverMagM = "30Rnd_min_rf_545x39_mag";

// ====================================================================================

// Sprzęt dla klas funkcyjnych

// Strzelec RKM
_AR = "hlc_rifle_rpk74n";
_ARmag = "hlc_60Rnd_545x39_t_rpk";
_ARmag_tr = "hlc_60Rnd_545x39_t_rpk";

// Strzelec MMG
_MMG = "rhs_weap_pkm";
_MMGmag = "rhs_100Rnd_762x54mmR";
_MMGmag_tr = "rhs_100Rnd_762x54mmR_green";

// Strzelec wyborowy
_DMrifle = "rhs_weap_svdp_wd";
_DMriflemag = "rhs_10Rnd_762x54mmR_7N1";

// Strzelec AT
_RAT = "rhs_weap_rpg26";
_RATmag = "rhs_rpg26_mag";

// Strzelec MAT
_MAT = "rhs_weap_rpg7";
_MATmag1 = "rhs_rpg7_PG7VL_mag";
_MATmag2 = "rhs_rpg7_PG7VR_mag";
_MAT_sight = "rhs_acc_pgo7v";

// Strzelec AA
_SAM = "rhs_weap_igla";
_SAMmag = "rhs_mag_9k38_rocket";

// Strzelec HAT
_HAT = "launch_O_Titan_short_F";
_HATmag1 = "Titan_AT";
_HATmag2 = "Titan_AP";

// Snajper
_SNrifle = "srifle_GM6_F";
_SNrifleMag = "5Rnd_127x108_Mag";

// ====================================================================================

// Plecaki

_bagsmall = "B_Parachute";		         		// Parachute

_bagFTL = "tf_mr3000_rhs";                  	// Plecak dla dowódcy (radio)
_bagPP = "tf_mr3000_rhs";                  		// Plecak dla pilota (radio)

_bagTL = "rhs_assault_umbts";					//Plecak dowódcy drużyny

_bagMs = "rhs_sidorMG";							// Plecak dla medyka (mały)
_bagMm = "B_FieldPack_oli";						// Plecak dla medyka (średni)
_bagMb = "B_FieldPack_oli";               		// Plecak dla medyka (duży)

_bagARs = "B_FieldPack_cbr";					// Plecak dla RKM (mały)
_bagARm = "rhs_assault_umbts";					// Plecak dla RKM (średni)
_bagARb = "B_Carryall_cbr";						// Plecak dla RKM (duży)

_bagENG = "rhs_assault_umbts_engineer_empty";	// Plecak dla Mechanika

_bagR = "rhs_sidorMG";							// Plecak dla strzelca, strzelca AT

_bagMAT = "B_Carryall_cbr";						// Plecak dla MAT

_bagmedium = "rhs_sidorMG";						// carries 200, weighs 30
_baglarge =  "B_Carryall_cbr"; 					// carries 320, weighs 40

_bagmediumdiver =  "B_Carryall_cbr";			// Plecaki SF

_baguav = "tf_mr3000_rhs";						// Plecak RTO

_baghmgg = "RHS_Kord_Gun_Bag";					// used by Heavy MG gunner
_baghmgag = "RHS_Kord_Tripod_Bag";				// used by Heavy MG assistant gunner

_baghatg = "O_AT_01_weapon_F";					// used by Heavy AT gunner
_baghatag = "O_HMG_01_support_F";				// used by Heavy AT assistant gunner

_bagmtrg = "RHS_Podnos_Gun_Bag";				// used by Mortar gunner
_bagmtrag = "RHS_Podnos_Bipod_Bag";				// used by Mortar assistant gunner

_baghsamg = "O_AA_01_weapon_F";					// used by Heavy SAM gunner
_baghsamag = "O_HMG_01_support_F";				// used by Heavy SAM assistant gunner

// ====================================================================================

// Mundury, kamizelki itp.

// Definicja jaka klasa do jakiej grupy ma się zaliczać
// Jeżeli jakaś klasa nie jest tutaj dopisana domyslnie trafi do "_medium"

_light = ["m"];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["Pograntsovka_M88"];
_baseHelmet = ["rhs_ssh68","ssh68_net_of","ssh68_camo_kzs"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhs_6b5_medic_vsr","rhs_6b5_medic"];
_mediumRig = ["rhs_6b5_vsr","rhs_6b5","rhs_6b5_sniper_vsr"];
_heavyRig = ["rhs_6b5_vsr","rhs_6b5","rhs_6b5_sniper_vsr"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_gorka_r_y"];
_diverHelmet = ["rhs_ssh68"];
_diverRig = ["rhs_vydra_3m"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhs_uniform_df15"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_gssh18"];
_pilotRig = ["rhs_vest_commander"];
_pilotGlasses = [];

// Jet Pilot
_sfuniform = ["rhs_uniform_df15"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["V_Rangemaster_belt"];
_sfGlasses = [];

// Załoga pojazdu
_crewUniform = ["Butan_M88"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_6b5_officer"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"]; 
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
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
	//Dpdanie nocnego wyposażenia
	call Night_Eq_No_NVG;

	//WYWOŁANIE BUILDERA
	call Builder;
		
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
// ====================================================================================
// S.D.S Assign Gear Script - [V-1.8 beta | 04.01.2018]
// ====================================================================================

//	SPIS TRESCI
/*

	1.	CDF UN
	2.	Ukraina
	3.	CDF [CW]
	4.	Rebels [CW]
	
*/
// ====================================================================================
	_loadout_faction_player = f_param_player_faction_Indfor;
// ====================================================================================

//Definicje przedmiotów

// Sprzet medyczny
_personalAidKit = "ACE_personalAidKit";		// Zestaw pierwszej pomocy
_surgicalKit = "ACE_surgicalKit";			// Zestaw do szycia ran
_bandage = "ACE_elasticBandage";					// Opatrunek "Quik Clot" dla piechoty
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

// Granaty dymne do granatnika
_glsmokewhite = "rhs_GRD40_White";
_glsmokegreen = "rhs_GRD40_Green";
_glsmokered = "rhs_GRD40_Red";

// Flary do granatnika
_glflarewhite = "rhs_VG40OP_white";
_glflarered = "rhs_VG40OP_red";
_glflaregreen = "rhs_VG40OP_green";

// Mechanicy/saperzy
_ATmine = "ATMine_Range_Mag";
_APmine1 = "APERSBoundingMine_Range_Mag";
_APmine2 = "APERSMine_Range_Mag";

//Przedmioty w skrzyniach
_satche_small = "DemoCharge_Remote_Mag";
_satche_big = "SatchelCharge_Remote_Mag";
_toolkit = "ToolKit";
_zapalnik = "ACE_M26_Clacker";
_n_rozbraja = "ACE_DefusalKit";
_saperka = "ACE_EntrenchingTool";
_mlotek = "ACE_Fortify";
_wirecutter = "ACE_wirecutter";

// Granaty ręczne
_grenade = "rhs_mag_rgd5";
_mgrenade = "ACE_M84";

//Granaty dymne
_smokegrenade = "SmokeShell";
_smokegrenadegreen = "SmokeShellGreen";
_smokegrenadered = "SmokeShellRed";
_smokegrenadeblue = "SmokeShellBlue";

//Flary ręczne
_flarewhite = "ACE_HandFlare_White";
_flarered = "ACE_HandFlare_Red";
_flareyellow = "ACE_HandFlare_Yellow";
_flaregreen = "ACE_HandFlare_Green";

// Świetliki
_chemgreen =  "Chemlight_green";
_chemred = "Chemlight_red";
_chemyellow =  "Chemlight_yellow";
_chemblue = "Chemlight_blue";

// Noktowizja
_nvg = "rhs_1PN138";

// UAV Terminal
_uavterminal = "O_UavTerminal";

//Konstruktor BUILDERA
Builder ={	
	_backpack = {
		_typeofBackPack = _this select 0;
		_loadout = f_param_backpacks;
		if (count _this > 1) then {_loadout = _this select 1};
		switch (_typeofBackPack) do
		{
			#include "f_assignGear_aaf_b.sqf";
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
		#include "f_assignGear_aaf_builder.sqf";
	};

//Dodanie wyposażenia medycznego
Medical = {
	for "_p" from 1 to 12 do {_unit addItem _bandage;};		// Dodanie 12 sztuk bandaży
	for "_p" from 1 to 2 do {_unit addItem _morphine;};		// Dodanie 2 sztuk morfiny
	for "_p" from 1 to 2 do {_unit addItem _epinephrine;};	// Dodanie 2 sztuk epinefryny	
	_unit linkItem "ItemMap";		// Dodanie mapy
	_unit linkItem "ItemCompass";	// Dodanie kompsu
	_unit linkItem "ItemRadio";		// Dodanie radia
	_unit linkItem "ItemWatch";		// Dodanie zegarka
	_unit addItem _earplugs;		// Dodaje zatyczki do uszy
	_unit addItem _latarka;			// Latarka na mape
};

//Nocne wyposażenie oparte na latarkach, flarach, lightstick-ach
Night_Eq_No_NVG = {
	_loadout_night_day = f_param_night_day_wyp;
		
	if (_loadout_night_day == 0) then {
		if(_typeofUnit != "ps") then {
		
			_unit addItem _IRstrobe;		// Znacznik IR (doczepiany)
			_unit addItem _IRstrobe;		
			(unitBackpack _unit) addItemCargoGlobal [_chemgreen,2];
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
	//CDF UN
	case 1: 
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
_rifle = "rhs_weap_m21a";
_riflemag = "rhsgref_30rnd_556x45_m21";
_riflemag_tr = "rhsgref_30rnd_556x45_m21_t";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_m21s";
_carbinemag = "rhsgref_30rnd_556x45_m21";
_carbinemag_tr = "rhsgref_30rnd_556x45_m21_t";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_aks74u";
_smgmag = "rhs_30Rnd_545x39_AK";
_smgmag_tr = "rhs_30Rnd_545x39_AK_green";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_ak74m_fullplum_gp25";
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
_MAT_sight = "rhs_acc_pgo7v3";

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

_bagFTL = "rhs_assault_umbts";                  	// Plecak dla dowódcy (radio)
_bagPP = "rhs_assault_umbts";                  		// Plecak dla pilota (radio)

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

_baguav = "rhs_assault_umbts";						// Plecak RTO

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
_baseUniform = ["rhsgref_uniform_ttsko_mountain"];
_baseHelmet = ["rhsgref_helmet_pasgt_un","rhsgref_ssh68_un"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki"];
_mediumRig = ["rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki"];
_heavyRig = ["rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_gorka_r_y"];
_diverHelmet = ["rhs_ssh68"];
_diverRig = ["rhs_vydra_3m"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhsgref_uniform_ttsko_urban"];
_pilotHelmet = ["rhs_zsh7a_mike"];
_pilotRig = ["rhs_vydra_3m"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_ttsko_urban"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_vydra_3m"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Jet Pilot
_sfuniform = ["rhsgref_uniform_ttsko_mountain"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["LOP_V_6B23_Rifleman_UN"];
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

	//Ukraina
	case 2:
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
_rifle = "rhs_weap_ak74m_fullplum";
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
_glrifle = "rhs_weap_ak74m_gp25";
_glriflemag = "rhs_30Rnd_545x39_AK";
_glriflemag_tr = "rhs_30Rnd_545x39_AK_green";
_glmag = "rhs_VOG25";

// Pistolet (dla wszystkich klas)
_pistol = "rhs_weap_makarov_pmm";
_pistolmag = "rhs_mag_9x18_12_57N181S";

// Siły specjalne
//_diverWepCaS = "";
//_diverMagCaS = "";
//_diverWepR = "";
//_diverMagR = "";
//_diverWepM = "";
//_diverMagM = "";

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
_MAT_sight = "rhs_acc_pgo7v3";

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

_bagFTL = "rhs_assault_umbts";                 // Plecak dla dowódcy (radio)
_bagPP = "rhs_assault_umbts";                  // Plecak dla pilota (radio)

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

_baguav = "rhs_assault_umbts";					// Plecak RTO

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
_baseUniform = ["LOP_U_UKR_Fatigue_TanMTP","LOP_U_UKR_Fatigue_DPMWDPMD","LOP_U_UKR_Fatigue_Digit","LOP_U_UKR_Fatigue_IzlomTTsKO","LOP_U_UKR_Fatigue_Flec"];
_baseHelmet = ["LOP_H_6B27M_ess_MTP","LOP_H_SSh68Helmet_OLV","LOP_H_6B27M_Izlom","LOP_H_6B27M_ess_Digit","LOP_H_Beanie_marpat","LOP_H_Beanie_flec"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["LOP_V_6B23_Medic_TTKO"];
_mediumRig = ["LOP_V_6B23_6Sh92_TAN_DMPi","LOP_V_6B23_6Sh92_TTKO_OLV","rhs_6b23_6sh92_vog_headset","LOP_V_6B23_6Sh92_TAN_ACU","LOP_V_6B23_6Sh92_TTKO","LOP_V_6B23_6Sh92_OLV","rhs_6b23_6sh92"];
_heavyRig = ["LOP_V_6B23_6Sh92_TAN_DMPi","LOP_V_6B23_6Sh92_TTKO_OLV","rhs_6b23_6sh92_vog_headset","LOP_V_6B23_6Sh92_TAN_ACU","LOP_V_6B23_6Sh92_TTKO","LOP_V_6B23_6Sh92_OLV","rhs_6b23_6sh92"];

// Siły specjalne
_diverUniform =  ["U_O_Wetsuit"];
_diverHelmet = [];
_diverRig = ["V_RebreatherIR"];
_diverGlasses = ["G_Diving"];

// Pilot
_pilotUniform = ["LOP_U_UKR_Fatigue_DF15"];
_pilotHelmet = ["rhs_zsh7a_mike","rhs_zsh7a","rhs_gssh18"];
_pilotRig = ["rhsgref_6b23_khaki"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["LOP_U_UKR_Fatigue_TTsKO"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Spec Opa
_sfuniform = ["LOP_U_UKR_Fatigue_DF15"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["rhsgref_6b23_khaki"];
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

	//CDF [CW]
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
_hg_silencer2 = "muzzle_snds_L";	// SF Pistol suppressor
_hg_scope1 = "optic_MRD";			// MRD
_hg_attachments= [];

// ====================================================================================

// Bronie

// Podstawowa broń (dla przykładowo: Amunicyjny MMG, Amunicyjny RKM, Amunicyjny MAT,Strzelec)
_rifle = "rhs_weap_akm";
_riflemag = "rhs_30Rnd_762x39mm";
_riflemag_tr = "rhs_30Rnd_762x39mm_tracer";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_akms";
_carbinemag = "rhs_30Rnd_762x39mm";
_carbinemag_tr = "rhs_30Rnd_762x39mm_tracer";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_savz61";
_smgmag = "rhsgref_20rnd_765x17_vz61";
_smgmag_tr = "rhsgref_20rnd_765x17_vz61";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_akm_gp25";
_glriflemag = "rhs_30Rnd_762x39mm";
_glriflemag_tr = "rhs_30Rnd_762x39mm_tracer";
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
_MAT_sight = "rhs_acc_pgo7v3";

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

_bagFTL = "rhs_assault_umbts";                  	// Plecak dla dowódcy (radio)
_bagPP = "rhs_assault_umbts";                  		// Plecak dla pilota (radio)

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

_baguav = "rhs_assault_umbts";						// Plecak RTO

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
_baseUniform = ["rhsgref_uniform_ttsko_mountain"];
_baseHelmet = ["rhsgref_6b27m_ttsko_forest","rhsgref_ssh68_ttsko_forest"];
_baseGlasses = [];

// Kamizelki
_lightRig = ["rhsgref_6b23_khaki_medic"];
_mediumRig = ["rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki_sniper"];
_heavyRig = ["rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki_sniper"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_gorka_r_y"];
_diverHelmet = ["rhs_ssh68"];
_diverRig = ["rhs_vydra_3m"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["rhsgref_uniform_ttsko_urban"];
_pilotHelmet = ["rhs_zsh7a_mike"];
_pilotRig = ["rhsgref_6b23_khaki"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_ttsko_urban"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["rhs_vydra_3m"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Jet Pilot
_sfuniform = ["rhsgref_uniform_ttsko_mountain"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["rhs_vest_commander"];
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

	//Rebels [CW]
	case 4:
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
_rifle = "rhs_weap_akm";
_riflemag = "rhs_30Rnd_762x39mm";
_riflemag_tr = "rhs_30Rnd_762x39mm_tracer";

// Broń wersja "krótka" (dla przykładowo: Medyk, Strzelec (AT), Strzelec MAT)
_carbine = "rhs_weap_akms";
_carbinemag = "rhs_30Rnd_762x39mm";
_carbinemag_tr = "rhs_30Rnd_762x39mm_tracer";

// Broń PDW (dla przykładowo: Pilot, Co-pilot,Dowódca pojazdu)
_smg = "rhs_weap_savz61";
_smgmag = "rhsgref_20rnd_765x17_vz61";
_smgmag_tr = "rhsgref_20rnd_765x17_vz61";

// Broń z granatnikiem (dla dowóców)
_glrifle = "rhs_weap_akm_gp25";
_glriflemag = "rhs_30Rnd_762x39mm";
_glriflemag_tr = "rhs_30Rnd_762x39mm_tracer";
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

// UNIQUE, ROLE-SPECIFIC EQUIPMENT

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
_MAT_sight = "rhs_acc_pgo7v3";

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

_bagFTL = "rhs_assault_umbts";                  	// Plecak dla dowódcy (radio)
_bagPP = "rhs_assault_umbts";                  		// Plecak dla pilota (radio)

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

_baguav = "rhs_assault_umbts";						// Plecak RTO

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

_light = [];
_heavy =  ["eng","engm" ,"aar" , "ar" ];
_diver = ["divc","divr","divs","divm"];
_pilot = ["pp","pcc","pc"];
_crew = ["vc","vg","vd"];
_ghillie = ["sn","sp"];
_specOp = [ "ps"];

// Podstawowe mundury
// Elementy wyposażenia są losowo wybierane z listy
_baseUniform = ["rhsgref_uniform_flecktarn","rhsgref_uniform_reed","rhsgref_uniform_woodland_olive","rhs_uniform_mvd_izlom","rhsgref_uniform_alpenflage"];
_baseHelmet = ["rhsgref_helmet_M1_painted_alt01","rhs_beanie_green","H_Shemag_olive","H_Cap_blk","H_Bandanna_camo","rhsgref_ssh68_vsr"];
_baseGlasses = [];

// Kamizelki
_lightRig = [];
_mediumRig = ["V_TacVest_brn","V_TacVest_camo","rhsgref_TacVest_ERDL","V_HarnessO_gry","V_Chestrig_khk"];
_heavyRig = ["V_TacVest_brn","V_TacVest_camo","rhsgref_TacVest_ERDL","V_HarnessO_gry","V_Chestrig_khk"];

// Siły specjalne
_diverUniform =  ["rhs_uniform_gorka_r_y"];
_diverHelmet = ["rhs_ssh68"];
_diverRig = ["rhs_vydra_3m"];
_diverGlasses = [];

// Pilot
_pilotUniform = ["U_I_HeliPilotCoveralls"];
_pilotHelmet = ["rhs_zsh7a_mike_green_alt"];
_pilotRig = ["V_BandollierB_oli"];
_pilotGlasses = [];

// Załoga pojazdu
_crewUniform = ["rhsgref_uniform_ERDL"];
_crewHelmet = ["rhs_tsh4"];
_crewRig = ["V_BandollierB_cbr"];
_crewGlasses = [];

// Ghillie
_ghillieUniform = ["U_O_GhillieSuit"];
_ghillieHelmet = [];
_ghillieRig = ["V_Chestrig_khk"];
_ghillieGlasses = [];

// Jet Pilot
_sfuniform = ["rhsgref_uniform_ttsko_mountain"];
_sfhelmet = ["rhs_zsh7a_alt"];
_sfRig = ["rhs_vest_commander"];
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
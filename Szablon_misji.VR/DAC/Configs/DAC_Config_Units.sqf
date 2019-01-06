//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];


/*
/////////////////////////////////////////////
///////////////SPIS TRESCI///////////////////
/////////////////////////////////////////////
// [MD] - frakcje współczesne "modern"
// [CW] - frokcje Cold War
// [U] - frakcje uniwersalne
//////////BLUFOR//////////
	 7 - US Army OCP 2010 RHS [MD]
	 8 - USMC Pustynia 2010 RHS [MD]
	 9 - Polskie Siły Zbrojne - Las [MD]
	10 - Polskie Siły Zbrojne - Pustynia [MD]
	11 - US ARMY "WD" 80/90 [CW]
	12 - US ARMY "D" 80/90 [CW]
	13 - CDF [CW]
	14 - Horizon Defence Forces [CW]
	
//////////OPFOR///////////
	15 - Russians RHS - MSV Leśne [MD]
	16 - Russians RHS - VDV Leśne [MD]
	17 - Russians RHS - VDV Pustynia [MD]
	18 - Takistan Army [CW]
	19 - SLA [CW]
	
//////////INDFOR//////////
	20 - ChDKZ [CW/U]
	21 - Partyzanci [CW/U]
	22 - Komuniści [CW/U] (NAPA)
	23 - UN Old [CW]
	24 - UN Modern [MD]
	25 - Murzyny [U] (African rebels)
	26 - Ciapaci [U] (Takistan rebels)
	27 - RACS [U]

*////////////////////////////////////////////

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// REDFOR CSAT (A3)
  case 0:
  {
    _Unit_Pool_S = ["O_crew_F","O_Helipilot_F","O_Soldier_SL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_GL_F","O_soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_AA_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_F","O_soldier_LAT_F","O_soldier_LAT_F","O_soldier_lite_F","O_soldier_TL_F","O_soldier_TL_F"];
    _Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"];
    _Unit_Pool_T = ["O_MBT_02_arty_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"];
	_Unit_Pool_A = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Light_02_armed_F"];
  };
//-------------------------------------------------------------------------------------------------
// BLUFOR NATO (A3)
  case 1:
  {
    _Unit_Pool_S = ["B_crew_F","B_Helipilot_F","B_Soldier_SL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_GL_F","B_soldier_GL_F","B_soldier_AA_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","B_Soldier_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
    _Unit_Pool_V = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];
    _Unit_Pool_T = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
    _Unit_Pool_A = ["B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F"];
  };
//-------------------------------------------------------------------------------------------------
// Independent FIA (A3)
  case 2:
  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
  };
//-------------------------------------------------------------------------------------------------

//////////////////////////////////////////////////////////////////
//////////////////////CIVILIANS///////////////////////////////////
//////////////////////////////////////////////////////////////////

// Civilians (A3)
  case 3:
  {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  };
  
//-------------------------------------------------------------------------------------------------

// Civilians (African)
  case 4:
  {
    _Unit_Pool_S = ["LOP_AFR_Civ_Man_01","LOP_AFR_Civ_Man_02","LOP_AFR_Civ_Man_03","LOP_AFR_Civ_Man_04","LOP_AFR_Civ_Man_05","LOP_AFR_Civ_Man_06"];
    _Unit_Pool_V = ["LOP_AFR_Civ_Landrover","LOP_AFR_Civ_Offroad","LOP_AFR_Civ_UAZ_Open","LOP_AFR_Civ_Ural_open"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  };

//-------------------------------------------------------------------------------------------------

// Civilians (Czarnoruś)
  case 5:
  {
    _Unit_Pool_S = ["LOP_CHR_Civ_Doctor_01","LOP_CHR_Civ_Profiteer_01","LOP_CHR_Civ_Rocker_01","LOP_CHR_Civ_Villager_01","LOP_CHR_Civ_Woodlander_01","LOP_CHR_Civ_Worker_01"];
    _Unit_Pool_V = ["LOP_CHR_Civ_Offroad","LOP_CHR_Civ_UAZ","LOP_CHR_Civ_UAZ_Open","LOP_CHR_Civ_Ural"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  }; 
  
//-------------------------------------------------------------------------------------------------

// Civilians (Takistan)
  case 6:
  {
    _Unit_Pool_S = ["LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_04"];
    _Unit_Pool_V = ["LOP_CHR_Civ_Offroad","LOP_CHR_Civ_UAZ","LOP_CHR_Civ_UAZ_Open","LOP_CHR_Civ_Ural"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  }; 

//-------------------------------------------------------------------------------------------------

//////////////////////////////////////////////////////////////////
//////////////////////BLUFOR//////////////////////////////////////
//////////////////////////////////////////////////////////////////

// US Army OCP 2010 RHS (BLUFOR)
	case 7:
	{
    _Unit_Pool_S = ["rhsusf_army_ocp_crewman","rhsusf_army_ocp_helipilot","rhsusf_army_ocp_squadleader","rhsusf_army_ocp_medic","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_rifleman_m4","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_machinegunnera","rhsusf_army_ocp_machinegunner"];
    _Unit_Pool_V = ["rhsusf_m1025_w_m2","rhsusf_m1025_w_mk19","rhsusf_M1220_M2_usarmy_wd","rhsusf_M1220_MK19_usarmy_wd","rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy","rhsusf_m113_usarmy","rhsusf_m113_usarmy_M240","rhsusf_m113_usarmy_MK19"];
    _Unit_Pool_T = ["RHS_M2A3_BUSKI_wd","rhsusf_m1a1aimwd_usarmy","rhsusf_m1a1aim_tuski_wd"];
    _Unit_Pool_A = ["B_Heli_Light_01_dynamicLoadout_F","RHS_UH60M","RHS_CH_47F"];
  };
  
//-------------------------------------------------------------------------------------------------
// USMC Pustynia 2010 RHS (BLUFOR)
	case 8:
	{
    _Unit_Pool_S = ["rhsusf_usmc_marpat_d_crewman","rhsusf_usmc_marpat_d_helipilot","rhsusf_usmc_marpat_d_teamleader","rhsusf_usmc_marpat_d_machinegunner_ass","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_engineer","rhsusf_usmc_marpat_d_gunner","rhsusf_usmc_lar_marpat_d_riflemanat","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_rifleman_m4","rhsusf_usmc_marpat_d_rifleman"];
    _Unit_Pool_V = ["rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19","rhsusf_rg33_m2_usmc_d"];
    _Unit_Pool_T = ["rhsusf_m1a1fep_d"]; 
    _Unit_Pool_A = ["RHS_UH1Y_d","RHS_UH1Y_FFAR_d"];
  };

//-------------------------------------------------------------------------------------------------

// Polskie Siły Zbrojne - Las (BLUFOR)
  case 9:
  {
    _Unit_Pool_S = ["PSZ_PL_WDL10_Soldier_Driver", "PSZ_PL_WDL10_Soldier_Pilot", "PSZ_PL_WDL10_Soldier_TL", "PSZ_PL_WDL10_Soldier_Ammo_PKM", "PSZ_PL_WDL10_Soldier_MG", "PSZ_PL_WDL10_Soldier_Grenadier_RPG7", "PSZ_PL_WDL10_Soldier_Ammo_RPG7", "PSZ_PL_WDL10_Soldier_Rifleman", "PSZ_PL_WDL10_Soldier_Medic"];
    _Unit_Pool_V = ["PSZ_PL_Zbik_M96_W", "PSZ_PL_Zbik_M97_W", "PSZ_PL_Tumak2_UKM_W"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_t72ba_tv"];
    _Unit_Pool_A = ["PSZ_PL_Mi17_1W_PKT","PSZ_PL_Mi17_1W_UB32"];
  };
 
//-------------------------------------------------------------------------------------------------

// Polskie Siły Zbrojne - Pustynia (BLUFOR)
  case 10:
  {
    _Unit_Pool_S = ["PSZ_PL_DES10_Soldier_Driver", "PSZ_PL_DES10_Soldier_Pilot", "PSZ_PL_DES10_Soldier_TL", "PSZ_PL_DES10_Soldier_Ammo_PKM", "PSZ_PL_DES10_Soldier_MG", "PSZ_PL_DES10_Soldier_Grenadier_RPG7", "PSZ_PL_DES10_Soldier_Medic", "PSZ_PL_DES10_Soldier_Ammo_RPG7", "PSZ_PL_DES10_Soldier_Rifleman"];
    _Unit_Pool_V = ["PSZ_PL_Zbik_M96_D", "PSZ_PL_Zbik_M97_D", "PSZ_PL_Tumak2_UKM_D"];
    _Unit_Pool_T = ["rhs_bmp1_tv","rhs_t72ba_tv"];
    _Unit_Pool_A = ["PSZ_PL_Mi17_1W_PKT","PSZ_PL_Mi17_1W_UB32"];
  };

//-------------------------------------------------------------------------------------------------

// US ARMY "WD" 80/90 (BLUFOR)
  case 11:
  {
    _Unit_Pool_S = ["usm_ranger_90s_w_h_rm1", "rhsusf_airforce_pilot", "usm_ranger_90s_w_h_ftl", "usm_ranger_90s_w_h_gr", "usm_ranger_90s_w_h_mg", "usm_ranger_90s_w_h_mgab", "usm_ranger_90s_w_h_medic", "usm_ranger_90s_w_h_rto", "usm_ranger_90s_w_h_rm1","usm_ranger_90s_w_h_at4","usm_ranger_90s_w_h_ar"];
    _Unit_Pool_V = ["rhsusf_m1025_w_m2","rhsusf_m1025_w_mk19","rhsusf_m113_usarmy","rhsusf_m113_usarmy_M240","rhsusf_m113_usarmy_MK19"];
    _Unit_Pool_T = ["RHS_M2A2_wd","rhsusf_m1a1aimwd_usarmy"];
    _Unit_Pool_A = ["B_Heli_Light_01_dynamicLoadout_F","RHS_UH60M","RHS_CH_47F"];
  };
  
//-------------------------------------------------------------------------------------------------

// US ARMY "D" 80/90 (BLUFOR)
  case 12:
  {
    _Unit_Pool_S = ["usm_soldier_90s_d_h_rm1", "rhsusf_airforce_pilot", "usm_soldier_90s_d_h_ftl", "usm_soldier_90s_d_h_gr", "usm_soldier_90s_d_h_mg", "usm_soldier_90s_d_h_mgab", "usm_soldier_90s_d_h_medic", "usm_soldier_90s_d_h_rto", "usm_soldier_90s_d_h_rm1", "usm_soldier_90s_d_h_at4", "usm_soldier_90s_d_h_ar", "usm_soldier_90s_d_h_aa", "usm_soldier_90s_d_h_jav", "usm_soldier_90s_d_h_ajav"];
    _Unit_Pool_V = ["rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m113d_usarmy","rhsusf_m113d_usarmy_M240","rhsusf_m113d_usarmy_MK19"];
    _Unit_Pool_T = ["RHS_M2A2","rhsusf_m1a1aimd_usarmy"]; 
    _Unit_Pool_A = ["B_Heli_Light_01_dynamicLoadout_F","RHS_UH60M","RHS_CH_47F"];
  };
  
//-------------------------------------------------------------------------------------------------

// CDF (BLUFOR)
  case 13:
  {
    _Unit_Pool_S = ["rhsgref_cdf_b_reg_crew_commander","rhsgref_cdf_b_air_pilot","rhsgref_cdf_b_reg_squadleader","rhsgref_cdf_b_reg_rifleman_m70","rhsgref_cdf_b_reg_grenadier","rhsgref_cdf_b_reg_rifleman","rhsgref_cdf_b_reg_medic","rhsgref_cdf_b_reg_marksman","rhsgref_cdf_b_reg_machinegunner","rhsgref_cdf_b_reg_engineer","rhsgref_cdf_b_reg_grenadier_rpg","rhsgref_cdf_b_reg_specialist_aa","",""];
    _Unit_Pool_V = ["rhsgref_cdf_b_reg_uaz_ags","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_cdf_b_reg_uaz_spg9","rhsgref_BRDM2_b","rhsgref_BRDM2_ATGM_b","rhsgref_BRDM2_HQ_b","rhsgref_cdf_b_btr60","rhsgref_cdf_b_btr70","rhsgref_cdf_b_ural_Zu23"];
    _Unit_Pool_T = ["rhsgref_cdf_b_bmp1k","rhsgref_cdf_b_bmp2k","rhsgref_cdf_b_t72bb_tv","rhsgref_cdf_b_t80bv_tv","rhsgref_cdf_b_zsu234"];
    _Unit_Pool_A = ["rhsgref_cdf_b_reg_Mi17Sh"];
  };
  
//-------------------------------------------------------------------------------------------------
  
// Horizon Defence Forces (BLUFOR)
  case 14:
  {
    _Unit_Pool_S = ["rhsgref_hidf_crewman","rhsgref_hidf_helipilot","rhsgref_hidf_squadleader","rhsgref_hidf_autorifleman","rhsgref_hidf_autorifleman_assist","rhsgref_hidf_medic","rhsgref_hidf_grenadier","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_marksman","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_sniper"];
    _Unit_Pool_V = ["rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_mk19","rhsgref_hidf_m113a3_m2","rhsgref_hidf_m113a3_mk19"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  };
  
//-------------------------------------------------------------------------------------------------
  
//////////////////////////////////////////////////////////////////
//////////////////////OPFOR///////////////////////////////////////
////////////////////////////////////////////////////////////////// 
    
// Russians RHS - MSV Leśne (OPFOR)
  case 15:
  {
    _Unit_Pool_S = ["rhs_msv_combatcrew","rhs_pilot_combat_heli","rhs_msv_sergeant","rhs_msv_RShG2","rhs_msv_LAT","rhs_msv_grenadier","rhs_msv_rifleman","rhs_msv_medic","rhs_msv_marksman","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_grenadier_rpg","rhs_msv_strelok_rpg_assist","rhs_msv_aa"];
    _Unit_Pool_V = ["rhsgref_BRDM2_msv","rhsgref_BRDM2_ATGM_msv","rhsgref_BRDM2_HQ_msv","rhs_btr70_msv","rhs_btr80_msv","RHS_Ural_Zu23_MSV_01","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_spg9"];
    _Unit_Pool_T = ["rhs_bmp1k_msv","rhs_bmp2k_msv","rhs_bmp3_msv","rhs_bmp3mera_msv","rhs_Ob_681_2","rhs_t72bc_tv","rhs_t80um","rhs_t90a_tv","rhs_zsu234_aa"];
    _Unit_Pool_A = [];
  }; 
  
//-------------------------------------------------------------------------------------------------
  
// Russians RHS - VDV Leśne (OPFOR)
  case 16:
  {
    _Unit_Pool_S = ["rhs_vdv_armoredcrew","rhs_pilot_combat_heli","rhs_vdv_grenadier_alt","rhs_vdv_RShG2","rhs_vdv_LAT","rhs_vdv_rifleman","rhs_vdv_medic","rhs_vdv_marksman","rhs_vdv_grenadier_rpg","rhs_vdv_strelok_rpg_assist","rhs_vdv_machinegunner_assistant","rhs_vdv_arifleman","rhs_vdv_aa"];
    _Unit_Pool_V = ["rhs_tigr_sts_3camo_vdv","rhs_btr80_vdv","rhs_btr80a_vdv","rhsgref_BRDM2_vdv","rhsgref_BRDM2_ATGM_vdv","rhsgref_BRDM2_HQ_vdv","rhs_gaz66_zu23_vdv"];
    _Unit_Pool_T = ["rhs_bmd1p","rhs_bmd2m","rhs_bmd4ma_vdv","rhs_sprut_vdv","rhs_zsu234_aa"];
    _Unit_Pool_A = ["RHS_Mi8MTV3_heavy_vdv","RHS_Mi8MTV3_vdv"];
  }; 
  
//-------------------------------------------------------------------------------------------------
  
// Russians RHS - VDV Pustynia (OPFOR)
  case 17:
  {
    _Unit_Pool_S = ["rhs_vdv_des_combatcrew","rhs_pilot_combat_heli","rhs_vdv_des_grenadier","rhs_vdv_des_RShG2","rhs_vdv_des_LAT","rhs_vdv_des_rifleman","rhs_vdv_des_marksman","rhs_vdv_des_machinegunner_assistant","rhs_vdv_des_grenadier_rpg","rhs_vdv_des_strelok_rpg_assist","rhs_vdv_des_medic","rhs_vdv_des_arifleman","rhs_vdv_des_aa"];
    _Unit_Pool_V = ["rhs_tigr_sts_3camo_vdv","rhs_btr80_vdv","rhs_btr80a_vdv","rhsgref_BRDM2_vdv","rhsgref_BRDM2_ATGM_vdv","rhsgref_BRDM2_HQ_vdv","rhs_gaz66_zu23_vdv"];
    _Unit_Pool_T = ["rhs_bmd1p","rhs_bmd2m","rhs_bmd4ma_vdv","rhs_sprut_vdv","rhs_zsu234_aa"];
    _Unit_Pool_A = ["RHS_Mi8MTV3_heavy_vdv","RHS_Mi8MTV3_vdv"];
  }; 
  
//-------------------------------------------------------------------------------------------------
  
// Takistan Army (OPFOR)
  case 18:
  {
    _Unit_Pool_S = ["LOP_TKA_Infantry_Crewman","LOP_TKA_Infantry_Pilot","LOP_TKA_Infantry_TL","LOP_TKA_Infantry_Rifleman_3","LOP_TKA_Infantry_Rifleman_2","LOP_TKA_Infantry_Rifleman","LOP_TKA_Infantry_Marksman","LOP_TKA_Infantry_MG_Asst","LOP_TKA_Infantry_MG","LOP_TKA_Infantry_AT_Asst","LOP_TKA_Infantry_AT","LOP_TKA_Infantry_GL","LOP_TKA_Infantry_Corpsman","LOP_TKA_Infantry_AA",""];
    _Unit_Pool_V = ["LOP_TKA_UAZ_AGS","LOP_TKA_UAZ_DshKM","LOP_TKA_UAZ_SPG","LOP_TKA_BTR60","LOP_TKA_BTR70"];
    _Unit_Pool_T = ["LOP_TKA_T34","LOP_TKA_T55","LOP_TKA_T72BB","LOP_TKA_ZSU234","LOP_TKA_BMP1D","LOP_TKA_BMP2D"];
    _Unit_Pool_A = ["LOP_TKA_Mi8MTV3_FAB","LOP_TKA_Mi8MTV3_UPK23"];
  }; 
  
//-------------------------------------------------------------------------------------------------
    
// SLA (OPFOR)
  case 19:
  {
    _Unit_Pool_S = ["LOP_SLA_Infantry_Crewman","LOP_SLA_Infantry_Pilot","LOP_SLA_Infantry_TL","LOP_SLA_Infantry_Rifleman_2","LOP_SLA_Infantry_Rifleman","LOP_SLA_Infantry_Marksman","LOP_SLA_Infantry_MG_Asst","LOP_SLA_Infantry_MG","LOP_SLA_Infantry_AT","LOP_SLA_Infantry_GL","LOP_SLA_Infantry_Corpsman","LOP_SLA_Infantry_AT_Asst","LOP_SLA_Infantry_AA"];
    _Unit_Pool_V = ["LOP_SLA_UAZ_AGS","LOP_SLA_UAZ_DshKM","LOP_SLA_UAZ_SPG","LOP_SLA_BTR60","LOP_SLA_BTR70"];
    _Unit_Pool_T = ["LOP_SLA_BMP1D","LOP_SLA_BMP2D","LOP_SLA_T72BB","LOP_SLA_ZSU234"];
    _Unit_Pool_A = ["LOP_SLA_Mi8MTV3_FAB","LOP_SLA_Mi8MTV3_UPK23"];
  }; 

//-------------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////
//////////////////////INDFOR//////////////////////////////////////
//////////////////////////////////////////////////////////////////  

// CHDKZ (INDFOR)
  case 20:
  {
    _Unit_Pool_S = ["rhsgref_ins_g_crew","rhsgref_ins_g_pilot","rhsgref_ins_g_squadleader","rhsgref_ins_g_spotter","rhsgref_ins_g_sniper","rhsgref_ins_g_engineer","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_grenadier","rhsgref_ins_g_rifleman_aksu","rhsgref_ins_g_rifleman_aks74","rhsgref_ins_g_rifleman_akm","rhsgref_ins_g_rifleman","rhsgref_ins_g_militiaman_mosin","rhsgref_ins_g_medic","rhsgref_ins_g_machinegunner","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_specialist_aa"];
    _Unit_Pool_V = ["rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_dshkm_chdkz","rhsgref_ins_g_uaz_spg9","rhsgref_ins_g_btr60","rhsgref_ins_g_btr70","rhsgref_BRDM2_ins_g","rhsgref_BRDM2_ATGM_ins_g","rhsgref_BRDM2_HQ_ins_g","rhsgref_ins_g_ural_Zu23"];
    _Unit_Pool_T = ["rhsgref_ins_g_bmd1","rhsgref_ins_g_bmd2","rhsgref_ins_g_t72bb","rhsgref_ins_g_zsu234"];
    _Unit_Pool_A = [];
  }; 

//-------------------------------------------------------------------------------------------------
  
// Partyzanci (INDFOR)
  case 21:
  {
    _Unit_Pool_S = ["rhsgref_nat_pmil_crew","rhsgref_nat_pmil_crew","rhsgref_nat_pmil_commander","rhsgref_nat_pmil_saboteur","rhsgref_nat_pmil_rifleman_m92","rhsgref_nat_pmil_rifleman","rhsgref_nat_pmil_specialist_aa","rhsgref_nat_pmil_grenadier","rhsgref_nat_pmil_rifleman_aksu","rhsgref_nat_pmil_medic","rhsgref_nat_pmil_machinegunner","rhsgref_nat_pmil_hunter","rhsgref_nat_pmil_grenadier_rpg"];
    _Unit_Pool_V = ["rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_spg9","rhsgref_nat_btr70","rhsgref_nat_ural_Zu23"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  }; 

//-------------------------------------------------------------------------------------------------
 
// Komuniści (INDFOR)
  case 22:
  {
    _Unit_Pool_S = ["LOP_UA_Infantry_Crewman","LOP_UA_Infantry_Pilot","LOP_UA_Infantry_TL","LOP_UA_Infantry_MG_Asst","LOP_UA_Infantry_MG","LOP_UA_Infantry_Marksman","LOP_UA_Infantry_Rifleman_3","LOP_UA_Infantry_Rifleman","LOP_UA_Infantry_Rifleman_2","LOP_UA_Infantry_AT","LOP_UA_Infantry_GL","LOP_UA_Infantry_Corpsman","LOP_UA_Infantry_AT_Asst"];
    _Unit_Pool_V = ["LOP_UA_UAZ_AGS","LOP_UA_UAZ_DshKM","LOP_UA_UAZ_SPG"];
    _Unit_Pool_T = ["LOP_UA_BMP1","LOP_UA_BMP2","LOP_UA_T72BA","LOP_UA_ZSU234"];
    _Unit_Pool_A = ["LOP_UA_Mi8MTV3_FAB","LOP_UA_Mi8MTV3_UPK23"];
  }; 

//-------------------------------------------------------------------------------------------------
  
// UN old (INDFOR)
  case 23:
  {
    _Unit_Pool_S = ["rhsgref_cdf_un_crew","rhsgref_cdf_un_pilot","rhsgref_cdf_un_squadleader","rhsgref_cdf_un_rifleman_lite","rhsgref_cdf_un_grenadier","rhsgref_cdf_un_rifleman","rhsgref_cdf_un_medic","rhsgref_cdf_un_machinegunner","rhsgref_cdf_un_grenadier_rpg"];
    _Unit_Pool_V = ["LOP_UN_UAZ_AGS","rhsgref_un_ural","LOP_UN_UAZ_DshKM","LOP_UN_UAZ_SPG","LOP_UN_BTR70"];
    _Unit_Pool_T = ["LOP_UN_BMP1D","LOP_UN_BMP2D","LOP_UN_ZSU234"];
    _Unit_Pool_A = ["LOP_UN_Mi8MTV3_UPK23","LOP_UN_Mi8MTV3_FAB"];
  }; 
 
//-------------------------------------------------------------------------------------------------

// UN new (INDFOR)
  case 24:
  {
    _Unit_Pool_S = ["LOP_UN_Infantry_Crewman","LOP_UN_Infantry_Pilot","LOP_UN_Infantry_TL","LOP_UN_Infantry_Rifleman_4","LOP_UN_Infantry_Rifleman_3","LOP_UN_Infantry_Rifleman_2","LOP_UN_Infantry_Rifleman","LOP_UN_Infantry_Marksman","LOP_UN_Infantry_MG_Asst","LOP_UN_Infantry_MG","LOP_UN_Infantry_AT","LOP_UN_Infantry_GL","LOP_UN_Infantry_Corpsman","LOP_UN_Infantry_AT_Asst","LOP_UN_Infantry_AA"];
    _Unit_Pool_V = ["LOP_UN_UAZ_AGS","LOP_UN_UAZ_DshKM","LOP_UN_UAZ_SPG","LOP_UN_BTR70","rhsgref_un_m1117"];
    _Unit_Pool_T = ["LOP_UN_BMP1D","LOP_UN_BMP2D","LOP_UN_ZSU234"];
    _Unit_Pool_A = ["LOP_UN_Mi8MTV3_UPK23","LOP_UN_Mi8MTV3_FAB"];
  }; 
  
//-------------------------------------------------------------------------------------------------

// Murzyny (INDFOR)
  case 25:
  {
    _Unit_Pool_S = ["I_C_Helipilot_F","I_C_Helipilot_F","LOP_AFR_Infantry_GL","I_C_Soldier_Para_7_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_8_F","LOP_AFR_Infantry_AT","LOP_AFR_Infantry_AR"];
    _Unit_Pool_V = ["LOP_AFR_Landrover_M2","LOP_AFR_Landrover_SPG9","LOP_AFR_Nissan_PKM","LOP_AFR_Offroad_M2","LOP_AFR_BTR60"];
    _Unit_Pool_T = ["LOP_AFR_T34","LOP_AFR_T55","LOP_AFR_T72BA"];
    _Unit_Pool_A = [];
  }; 
  
//-------------------------------------------------------------------------------------------------

// Ciapaci (INDFOR)
  case 26:
  {
    _Unit_Pool_S = ["LOP_AM_Infantry_Rifleman_3","LOP_AM_Infantry_Rifleman_3","LOP_AM_Infantry_SL","LOP_AM_Infantry_AR_Asst","LOP_AM_Infantry_AR","LOP_AM_Infantry_Marksman","LOP_AM_Infantry_AT","LOP_AM_Infantry_Rifleman_3","LOP_AM_Infantry_Rifleman_5","LOP_AM_Infantry_Rifleman_4","LOP_AM_Infantry_Rifleman_2","LOP_AM_Infantry_Rifleman","LOP_AM_Infantry_Rifleman_6","LOP_AM_Infantry_GL","LOP_AM_Infantry_Corpsman"];
    _Unit_Pool_V = ["LOP_AM_Landrover_M2","LOP_AM_Landrover_SPG9","LOP_AM_Nissan_PKM","LOP_AM_Offroad_M2","LOP_AM_UAZ_AGS","LOP_AM_UAZ_DshKM","LOP_AM_UAZ_SPG","LOP_AM_BTR60"];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  }; 
  
//-------------------------------------------------------------------------------------------------

// RACS (INDFOR)
  case 27:
  {
    _Unit_Pool_S = ["LOP_RACS_Infantry_Crewman","LOP_RACS_Infantry_Pilot","LOP_RACS_Infantry_TL","LOP_RACS_Infantry_Rifleman_3","LOP_RACS_Infantry_Rifleman_2","LOP_RACS_Infantry_Rifleman","LOP_RACS_Infantry_Marksman","LOP_RACS_Infantry_MG_Asst","LOP_RACS_Infantry_MG","LOP_RACS_Infantry_AT_Asst","LOP_RACS_Infantry_AT","LOP_RACS_Infantry_GL_2","LOP_RACS_Infantry_Corpsman"];
    _Unit_Pool_V = ["LOP_RACS_Landrover_M2"];
    _Unit_Pool_T = ["LOP_RACS_T72BA"];
    _Unit_Pool_A = ["LOP_RACS_MH9_armed","LOP_RACS_UH60M"];
  }; 
  
//-------------------------------------------------------------------------------------------------


  
// XX (INDFOR)
  case 30:
  {
    _Unit_Pool_S = [];
    _Unit_Pool_V = [];
    _Unit_Pool_T = [];
    _Unit_Pool_A = [];
  }; 

//-------------------------------------------------------------------------------------------------


Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray

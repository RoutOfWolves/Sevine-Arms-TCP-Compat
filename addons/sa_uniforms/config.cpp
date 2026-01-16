class CfgPatches
{
	class sa_uniforms
	{
		name = "SA Uniform Config";
		author = "RoutOfWolves";
		units[] = {};
		weapons[] = {};
		requiredAddons[] =
		{
			"TKE_Uniform_Revamp",
			"TKE_Rogue_Uniform",
			"A3_Data_F_Mark",
			"SA_Uniform",
		};
	};
};

class CfgVehicles
{
	class TKE_CombatUni_base;
	class SA_CU10_Uniform_Soldier:TKE_CombatUni_base
	{
		armor				= 2;
		armorStructural		= 4;
		explosionShielding	= 0.4;
		minTotalDamageThreshold	= 0.001;
		impactDamageMultiplier	= 0.5;
		class HitPoints
		{
			class HitFace
			{
				armor=1;
				passThrough=0.8;
				radius=0.08;
				explosionShielding=0.1;
				minimalHit=0.01;
			};
			class HitNeck:HitFace
			{
				armor=1;
				passThrough=0.8;
				radius=0.1;
				explosionShielding=0.5;
				minimalHit=0.01;
			};
			class HitHead:HitNeck
			{
				armor=1;
				passThrough=0.8;
				radius=0.2;
				explosionShielding=0.5;
				minimalHit=0.01;
				depends="HitFace max HitNeck";
			};
			class HitPelvis:HitHead
			{
				armor=6;
				passThrough=0.8;
				radius=0.24;
				explosionShielding=1;
				minimalHit=0.01;
			};
			class HitAbdomen:HitPelvis
			{
				armor=1;
				passThrough=0.8;
				radius=0.16;
				explosionShielding=1;
				minimalHit=0.01;
			};
			class HitDiaphragm:HitAbdomen
			{
				armor=1;
				passThrough=0.8;
				radius=0.18;
				explosionShielding=6;
				minimalHit=0.01;
			};
			class HitChest:HitDiaphragm
			{
				armor=1;
				passThrough=0.8;
				radius=0.18;
				explosionShielding=6;
				minimalHit=0.01;
			};
			class HitBody:HitChest
			{
				armor=1000;
				material=-1;
				passThrough=1;
				radius=0;
				explosionShielding=6;
				minimalHit=0.01;
				depends="HitPelvis max HitAbdomen max HitDiaphragm max HitChest";
			};
			class HitArms:HitBody
			{
				armor=3;
				passThrough=1;
				radius=0.1;
				explosionShielding=1;
				minimalHit=0.01;
			};
			class HitHands:HitArms
			{
				armor=3;
				passThrough=1;
				radius=0.1;
				explosionShielding=1;
				minimalHit=0.01;
				depends	= "HitArms";
			};
			class HitLegs:HitHands
			{
				armor=6;
				passThrough=0.5;
				radius=0.1;
				explosionShielding=0.5;
				minimalHit=0.01;
			};
		};
	};
	class SA_CU10G_Uniform_Soldier:SA_CU10_Uniform_Soldier
	{
		class HitPoints:HitPoints
		{
			class HitFace:HitFace{};
			class HitNeck:HitNeck{};
			class HitHead:HitHead{};
			class HitPelvis:HitPelvis{};
			class HitAbdomen:HitAbdomen{};
			class HitDiaphragm:HitDiaphragm{};
			class HitBody:HitBody{};
			class HitArms:HitArms{};
			class HitHands:HitHands{};
			class HitLegs:HitLegs{};
		};
	};
	class SA_CU10T_Uniform_Soldier:SA_CU10_Uniform_Soldier
	{
		class HitPoints:HitPoints
		{
			class HitFace:HitFace{};
			class HitNeck:HitNeck{};
			class HitHead:HitHead{};
			class HitPelvis:HitPelvis{};
			class HitAbdomen:HitAbdomen{};
			class HitDiaphragm:HitDiaphragm{};
			class HitBody:HitBody{};
			class HitArms:HitArms{};
			class HitHands:HitHands{};
			class HitLegs:HitLegs{};
		};
	};
};

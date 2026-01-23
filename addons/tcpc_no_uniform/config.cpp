class CfgPatches
{
	class tcpc_no_uniform
	{
		name = "TCPC NO Uniform Config";
		author = "RoutOfWolves";
		units[] = {};
		weapons[] = {};
		requiredAddons[] =
		{
			"TKE_Uniform_Revamp",
			"TKE_Rogue_Uniform",
			"NO_Uniform",
			"tcpc_sa_uniform",
		};
		skipWhenMissingDependencies = 1;
	};
};

class CfgVehicles
{
	class TKE_CombatUni_base;
	class SA_CU10_Uniform_Soldier:TKE_CombatUni_base
	{
		class HitPoints
		{
			class HitFace;
			class HitNeck:HitFace{};
			class HitHead:HitNeck{};
			class HitPelvis:HitHead{};
			class HitAbdomen:HitPelvis{};
			class HitDiaphragm:HitAbdomen{};
			class HitBody:HitDiaphragm{};
			class HitArms:HitBody{};
			class HitHands:HitArms{};
			class HitLegs:HitHands{};
		};
	};
	class NO_CU10_Uniform_Soldier:SA_CU10_Uniform_Soldier
	{
		class HitPoints:Hitpoints
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


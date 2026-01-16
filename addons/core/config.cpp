#include "script_version.hpp"

class CfgPatches
{
	class Template_Core
	{
		name = "Template - Core";
		author = "Lupus590";
		units[] = {};
		weapons[] = {};
		requiredAddons[] =
		{
			"CBA_Main",
		};
		VERSION_CONFIG;
	};
};

class CfgSettings
{
	class CBA
	{
		class Versioning // https://github.com/CBATeam/CBA_A3/wiki/Versioning-System
		{
			class Template_Core
			{
				main_addon = "Template_Core";
			};
		};
	};
};

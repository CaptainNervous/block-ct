#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <multicolors>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo = 
{
	name = "Block CT",
	author = "CaptainNervous",
	description = "Block CT",
	version = PLUGIN_VERSION,
	url = "http://steamcommunity.com/id/CaptainNervous"
};

public OnPluginStart()
{
	CreateConVar("sm_block_ct_version", PLUGIN_VERSION, "Block CT Version", FCVAR_PLUGIN|FCVAR_NOTIFY|FCVAR_DONTRECORD);
	
	RegConsoleCmd("jointeam", Command_JoinTeam); 
}

public Action:Command_JoinTeam(client, argc)
{
	if(!argc || !client || !IsClientInGame(client))
		return Plugin_Continue;

	decl String:m_szTeam[8];
	GetCmdArg(1, m_szTeam, sizeof(m_szTeam));
	new m_iTeam = StringToInt(m_szTeam);
	
	if(m_iTeam == CS_TEAM_CT)
	{
		CS_SwitchTeam(client, 2)
		CPrintToChat(client, "{default}[ {purple}TPM{default} ]{green} Anti-Terrorist takımına geçmeye yetkiniz yok.")
		return Plugin_Handled;
	}

	return Plugin_Continue;
}
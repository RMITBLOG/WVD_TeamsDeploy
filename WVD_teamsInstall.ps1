<#	
	.NOTES
	===========================================================================
		 Created on:   	07/08/2020 10:37
	 Created by:   	Ryan Mangan
	 Organization: 	Ryanmangansitblog.com
	 Filename:     	WVD Auto MSTeams Install 
	===========================================================================
	.DESCRIPTION
		This script is to be used with Azure Custom Scrpt Extentions to deploy MS Teams on to a Windows 10 Multi Session Host.
		
		Steps....
		1. add regkey to state environment is a WVD Environment
		2. Download the required applications to c:\temp\
		3. Install C++ run time
		4. Install MSRDCWEBRTCSvc 
	

#>

# Add registry Key
reg add "HKLM\SOFTWARE\Microsoft\Teams" /v IsWVDEnvironment /t REG_DWORD /d 1 /f
# check directory and create if missing

# Define where to store logs
[string]$temPAth = 'C:\temp\'

# Create folder if does not exist
if (!(Test-Path -Path $logPath))
{
    $paramNewItem = @{
        Path      = $temPAth
        ItemType  = 'Directory'
        Force     = $true
    }

    New-Item @paramNewItem
}

#Download C++ Runtime
invoke-WebRequest -Uri https://aka.ms/vs/16/release/vc_redist.x64.exe -OutFile "C:\temp\vc_redist.x64.exe"
Start-Sleep -s 5
#Download RDCWEBRTCSvc
invoke-WebRequest -Uri https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4AQBt -OutFile "C:\temp\MsRdcWebRTCSvc_HostSetup_1.0.2006.11001_x64.msi"
Start-Sleep -s 5
#Download Teams 
invoke-WebRequest -Uri https://statics.teams.cdn.office.net/production-windows-x64/1.4.00.2879/Teams_windows_x64.msi -OutFile "C:\temp\Teams_windows_x64.msi"
Start-Sleep -s 5

#Install C++ runtime
Start-Process -FilePath C:\temp\vc_redist.x64.exe -ArgumentList '/q', '/norestart'
Start-Sleep -s 10
#Install MSRDCWEBTRCSVC
msiexec /i C:\temp\MsRdcWebRTCSvc_HostSetup_1.0.2006.11001_x64.msi /q /n
Start-Sleep -s 10
# Install Teams
msiexec /i "C:\temp\Teams_windows_x64.msi" /l*v teamsinstall.txt ALLUSER=1 ALLUSERS=1 /q
Start-Sleep -s 10



#https://statics.teams.cdn.office.net/production-windows-x64/1.4.00.2879/Teams_windows_x64.msi
#https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4AQBt

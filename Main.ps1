function CreateRestorePoint {
  [CmdletBinding()]
  param (
    [string]$Description = "Automatic Restore Point"
  )

  Write-Output "Creating restore point: $Description"

  $RestorePointParams = @{
    Description      = $Description
    RestorePointType = 12 # MODIFY_SETTINGS
  }

  $null = Checkpoint-Computer @RestorePointParams

  Write-Output "Restore point created successfully."
}

# Call the function to create a restore point
CreateRestorePoint -Description "Pre-Tweaks Restore Point"

# Open Settings to Installed Apps section
Start-Process "ms-settings:appsfeatures"

# Open Startup Apps in Task Manager
Start-Process "taskmgr.exe" -ArgumentList "/0 /startup"

# Disable User Account Control (UAC)
Write-Output "Disabling User Account Control (UAC)..."
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value 0
Write-Output "User Account Control (UAC) has been disabled."

# Apply registry tweaks
Write-Output "Applying registry tweaks..."
$RegistryContent = @'
Windows Registry Editor Version 5.00

; Disable Power Throttling
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling]
"PowerThrottlingOff"=dword:00000001

; MMCSS Tweaks
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:0000000a
"SystemResponsiveness"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games]
"Affinity"=dword:00000000
"Background Only"="False"
"Clock Rate"=dword:00002710
"GPU Priority"=dword:00000008
"Priority"=dword:00000006
"Scheduling Category"="High"
"SFIO Priority"="High"

; Disable Full Screen Optimizations Globally
[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000000
"GameDVR_FSEBehaviorMode"=dword:00000002
"GameDVR_HonorUserFSEBehaviorMode"=dword:00000000
"GameDVR_DXGIHonorFSEWindowsCompatible"=dword:00000001
"GameDVR_EFSEFeatureFlags"=dword:00000000

; Decrease processes kill time and menu show delay
[HKEY_CURRENT_USER\Control Panel\Desktop]
"AutoEndTasks"="1"
"HungAppTimeout"="1000"
"WaitToKillAppTimeout"="2000"
"LowLevelHooksTimeout"="1000"
"MenuShowDelay"="0"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
"WaitToKillServiceTimeout"="2000"

; Disable Auto Maintenance
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance]
"MaintenanceDisabled"=dword:00000001

; Disable Hibernation
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power]
"HibernateEnabled"=dword:00000000
'@

$RegistryFilePath = "$env:TEMP\RegistryTweaks.reg"
$RegistryContent | Out-File -FilePath $RegistryFilePath -Encoding ASCII

Start-Process regedit.exe -ArgumentList "/s `"$RegistryFilePath`"" -Wait

Write-Output "Registry tweaks applied successfully."

# Run batch file to apply BCD tweaks
Write-Output "Running batch file to apply BCD tweaks..."
$BatchContent = @'
@echo off
echo Batch File By Adamx
echo Disable Dynamic Tick
echo Disable High Precision Event Timer (HPET)
echo Disable Synthetic Timers
@echo
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
pause
'@

$BatchFilePath = "$env:TEMP\BcdTweaks.bat"
$BatchContent | Out-File -FilePath $BatchFilePath -Encoding ASCII

Start-Process cmd.exe -ArgumentList "/c `"$BatchFilePath`"" -Wait

Write-Output "BCD tweaks applied successfully."

# Apply additional registry tweaks
Write-Output "Applying additional registry tweaks..."
$AdditionalRegistryContent = @'
Windows Registry Editor Version 5.00

; Registry File By Adamx
; Please and KINDLY if you are going to re-distribute or re-sell this file in any way please give proper credit since I worked on this for months <3
; youtube.com/AdamxYT

; Accounts Tab ( Disable Syncing )
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync]
"SyncPolicy"=dword:00000005

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows]
"Enabled"=dword:00000000

; Personalization Tab ( Disable Transparency )
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize]
"EnableTransparency"=dword:00000000

; Gaming Tab AND Graphics Settings Part In System Tab
; Disable Game Bar & Game DVR
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR]
"value"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR]
"AllowGameDVR"=dword:00000000

[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR]
"AppCaptureEnabled"=dword:00000000

; Enable Game Mode
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar]
"AllowAutoGameMode"=dword:00000001
"AutoGameModeEnabled"=dword:00000001

; Enable Hardware Accelerated GPU Scheduling (Windows 10 2004 + NVIDIA 10 Series Above + AMD 5000 and Above)
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers]
"HwSchMode"=dword:00000002

; Disable Variable Refresh Rate
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences]
"DirectXUserGlobalSettings"="VRROptimizeEnable=0;"

; Ease of Access Tab ( Disable Ease Of Access Features )
[HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys]
"Flags"="0"

[HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys]
"Flags"="0"

[HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
"Flags"="0"

[HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys]
"Flags"="0"

; Privacy Tab
; General Tab
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo]
"Enabled"=dword:00000000

[HKEY_CURRENT_USER\Control Panel\International\User Profile]
"HttpAcceptLanguageOptOut"=dword:00000001

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
"Start_TrackProgs"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]
"SubscribedContent-338393Enabled"=dword:00000000
"SubscribedContent-353694Enabled"=dword:00000000
"SubscribedContent-353696Enabled"=dword:00000000

; Speech Tab
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy]
"HasAccepted"=dword:00000000

; Inking & Typing Personalization Tab
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings]
"AcceptedPrivacyPolicy"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization]
"RestrictImplicitInkCollection"=dword:00000001
"RestrictImplicitTextCollection"=dword:00000001

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore]
"HarvestContacts"=dword:00000000

; Diagnostics & Feedback Tab
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack]
"ShowedToastAtLevel"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection]
"AllowTelemetry"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy]
"TailoredExperiencesWithDiagnosticDataEnabled"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey]
"EnableEventTranscript"=dword:00000000

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules]
"NumberOfSIUFInPeriod"=dword:00000000
"PeriodInNanoSeconds"=-

; Activity History Tab
[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
"PublishUserActivities"=dword:00000000
"UploadUserActivities"=dword:00000000

; App Permissions Tab
; Disable Notifications - Location - App Diagnostics - Account Info Access
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener]
"Value"="Deny"

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location]
"Value"="Deny"

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics]
"Value"="Deny"

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation]
"Value"="Deny"

; Disable Let Unnecessary Apps Run In The Background
[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications]
"GlobalUserDisabled"=dword:00000001

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search]
"BackgroundAppGlobalToggle"=dword:00000000
'@

$AdditionalRegistryFilePath = "$env:TEMP\AdditionalRegistryTweaks.reg"
$AdditionalRegistryContent | Out-File -FilePath $AdditionalRegistryFilePath -Encoding ASCII

Start-Process regedit.exe -ArgumentList "/s `"$AdditionalRegistryFilePath`"" -Wait

Write-Output "Additional registry tweaks applied successfully."

# Run Performance Options
Write-Output "Running Performance Options..."
$PerformanceOptionsContent = @'
@echo off
echo Adjusting Performance Options...
systempropertiesperformance
pause
'@

$PerformanceOptionsFilePath = "$env:TEMP\PerformanceOptions.bat"
$PerformanceOptionsContent | Out-File -FilePath $PerformanceOptionsFilePath -Encoding ASCII

Start-Process cmd.exe -ArgumentList "/c `"$PerformanceOptionsFilePath`"" -Wait

Write-Output "Performance Options adjusted successfully."

# Open Sound Settings
Write-Output "Opening Sound Settings..."

Start-Process "ms-settings:sound"

Write-Output "Sound Settings opened successfully."

# Disable Sound Enhancements
Write-Output "Disabling Sound Enhancements..."

$Script = @'
$DeviceEnumerator = New-Object -ComObject MMDeviceEnumerator
$Device = $DeviceEnumerator.GetDefaultAudioEndpoint(0, 1)
$Device.Properties["{1da5d803-d492-4edd-8c23-e0c0ff5e6f1b},24"] = $false
'@

Invoke-Command -ScriptBlock ([ScriptBlock]::Create($Script))

Write-Output "Sound Enhancements disabled successfully."

# Open Optional Features in Settings
Write-Output "Opening Optional Features in Settings..."

Start-Process "ms-settings:optionalfeatures"

Write-Output "Optional Features in Settings opened successfully."

# Run NVCleanstall
Write-Output "Running NVCleanstall..."

$NvCleanstallPath = "SourceApps/NVCleanstall_1.17.0.exe"
Start-Process -FilePath $NvCleanstallPath -Wait

Write-Output "NVCleanstall has been run successfully."

# Open Profile with NVIDIA Profile Inspector
Write-Output "Opening Base Profile with NVIDIA Profile Inspector..."

$NvidiaProfileInspectorPath = "SourceApps/nvidiaProfileInspector.exe"
$BaseProfilePath = "SourceApps/BaseProfile.nip"
Start-Process -FilePath $NvidiaProfileInspectorPath -ArgumentList $BaseProfilePath -Wait

Write-Output "Base Profile opened with NVIDIA Profile Inspector successfully."

Invoke-RestMethod "https://christitus.com/win" | Invoke-Expression

# Disable Specified Services
Write-Output "Disabling Specified Services..."

$ServicesToDisable = @(
  "tzautoupdate", # Auto Time Zone Updater
  "bthavctp", # AVCTP Service (Breaks Wireless Headphones)
  "BDESVC", # BitLocker Drive Encryption Service
  "CertPropSvc", # Certificate Propagation
  "wbengine", # Block Level Backup Engine Service
  "tapisrv", # Cellular Time
  "DiagTrack", # Connect User Experiences and Telemetry
  "MapsBroker", # Downloaded Maps Manager
  "Fax", # Fax
  "fhsvc", # File History Service
  "iphlpsvc", # IP Helper
  "kbdhid", # Microsoft Keyboard Filter
  "Netlogon", # Netlogon
  "WpcSvc", # Parental Control
  "Spooler", # Print Spooler
  "RemoteRegistry", # Remote Registry
  "lmhosts", # TCP/IP NetBIOS Helper
  "TabletInputService", # Touch Keyboard and Handwriting
  "PimIndexMaintenanceSvc", # Contact Data_ea4df
  "EFS", # Encrypting File System (EFS)
  "lfsvc", # Geolocation
  "MicrosoftEdgeElevationService", # Microsoft Edge Elevation Service
  "edgeupdate", # Microsoft Edge Update Service
  "UsoSvc", # Microsoft Update Health Service
  "seclogon", # Secondary Logon
  "SCardSvr", # All Smart Card Services
  "wbengine", # Windows Backup
  "wisvc", # Windows Insider Service
  "WSearch" # Windows Search
)

foreach ($Service in $ServicesToDisable) {
  Set-Service -Name $Service -StartupType Disabled -ErrorAction SilentlyContinue
  Stop-Service -Name $Service -Force -ErrorAction SilentlyContinue
}

Write-Output "Specified Services have been disabled successfully."

# Run Commands to Disable TCP Heuristics
Write-Output "Disabling TCP Heuristics..."

Start-Process -FilePath "cmd.exe" -ArgumentList "/c @echo off && echo Disabling TCP Heuristics... && netsh interface tcp set heuristics disabled && echo TCP Heuristics have been disabled. && pause" -Wait

Write-Output "TCP Heuristics have been disabled successfully."

# Run TCP Optimizer
Write-Output "Running TCP Optimizer..."

$TcpOptimizerPath = "SourceApps/tcpoptimizer.exe"
Start-Process -FilePath $TcpOptimizerPath -Wait

Write-Output "TCP Optimizer has been run successfully."

Write-Output "Specified Services have been disabled successfully."

# Run Commands to Disable TCP Heuristics Again
Write-Output "Disabling TCP Heuristics..."

Start-Process -FilePath "cmd.exe" -ArgumentList "/c @echo off && echo Disabling TCP Heuristics... && netsh interface tcp set heuristics disabled && echo TCP Heuristics have been disabled. && pause" -Wait

Write-Output "TCP Heuristics have been disabled successfully."

# Run TCP Optimizer Again
Write-Output "Running TCP Optimizer..."

$TcpOptimizerPath = "SourceApps/tcpoptimizer.exe"
Start-Process -FilePath $TcpOptimizerPath -Wait

Write-Output "TCP Optimizer has been run successfully."

# Show Images and Instruct User to Copy Settings
Write-Output "Please copy the settings from the following images into TCP Optimizer."

$TcpImage1Path = "SourceApps/Tcp1.png"
$TcpImage2Path = "SourceApps/Tcp2.png"

Start-Process -FilePath $TcpImage1Path
Start-Process -FilePath $TcpImage2Path

Write-Output "Settings images have been opened successfully."

# Move ISLC Folder to Desktop and Run the Executable
Write-Output "Please go to SourceApps folder and move ISLC to a folder on Desktop and run it. Set the Timer Resolution to 0.50ms and click Start. Then close the program. It is recommended to run this program every time you boot your PC."

# Apply Miscellaneous Registry Tweaks
Write-Output "Applying Miscellaneous Registry Tweaks..."

$MiscRegistryContent = @'
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel]
"GlobalTimerResolutionRequests"=dword:00000001

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters]
"KeyboardDataQueueSize"=dword:0000001e

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass\Parameters]
"MouseDataQueueSize"=dword:0000001e

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:ffffffff

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"PagingFiles"="C:\\pagefile.sys 4096 4096"

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes]
"ActivePowerScheme"="02836485-1111-1111-1111-111111111111"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"SystemResponsiveness"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
"SvcHostSplitThresholdInKB"=dword:2000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583]
"ValueMax"=dword:00000000

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh]
"AllowNewsAndInterests"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000014
'@

$MiscRegistryFilePath = "$env:TEMP\miscRegistryTweaks.reg"
$MiscRegistryContent | Out-File -FilePath $MiscRegistryFilePath -Encoding ASCII

Start-Process regedit.exe -ArgumentList "/s `"$MiscRegistryFilePath`"" -Wait

Write-Output "Miscellaneous Registry Tweaks applied successfully."

# Run Miscellaneous Batch File
Write-Output "Running Miscellaneous Batch File..."

$MiscBatchContent = @'
@echo off

REM Set the performance settings to Custom
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f

REM Disable animations in the taskbar and window titles
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "WindowAnimations" /t REG_DWORD /d 0 /f

REM Ensure thumbnails previews are enabled
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ThumbnailCacheSize" /t REG_DWORD /d 0 /f

REM Ensure smooth edges of screen fonts are enabled
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FontSmoothing" /t REG_DWORD /d 1 /f

REM Disable desktop composition (Aero Glass)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Desktop" /v "VisualFXSetting" /t REG_DWORD /d 2 /f

REM Disable fading and sliding menus
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "MenuAnimations" /t REG_DWORD /d 0 /f

REM Optional: Restart Explorer to apply changes
taskkill /f /im explorer.exe
start explorer.exe

:: Set maximum connections per 1.0 server for Explorer and Internet Explorer
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "explorer.exe" /t REG_DWORD /d 10 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "iexplore.exe" /t REG_DWORD /d 10 /f

:: Set maximum connections per server for Explorer and Internet Explorer
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "explorer.exe" /t REG_DWORD /d 10 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "iexplore.exe" /t REG_DWORD /d 10 /f

:: Set DNS, Local, Hosts, and NetBT priority
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 7 /f

:: Set Network Throttling Index and System Responsiveness
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f

:: Set MaxUserPort, TcpTimedWaitDelay, and DefaultTTL
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f

:: PowerShell commands for TCP settings
PowerShell.exe Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -EcnCapability enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -Timestamps enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTcpSetting -SettingName internet -NonSackRttResiliency disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -InitialRto 2000
PowerShell.exe Set-NetTcpSetting -SettingName internet -MinRto 300

:: PowerShell commands for offload and network settings
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Disable-NetAdapterChecksumOffload -Name *

:: netsh commands for TCP settings and MTU
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1500 store=persistent

echo Registry values and network settings have been updated.

set SrcPath=\Windows\Setup\SetTR.lnk
set DestPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

pause
'@

$MiscBatchFilePath = "$env:TEMP\miscBatchFile.bat"
$MiscBatchContent | Out-File -FilePath $MiscBatchFilePath -Encoding ASCII

Start-Process cmd.exe -ArgumentList "/c `"$MiscBatchFilePath`"" -Wait

Write-Output "Miscellaneous Batch File executed successfully."

Write-Output "Running EXM Free Tweaking Utility..."
& '.\SourceApps\EXM Free Tweaking Utility V7.1.cmd'

# Final Message to the User
Write-Output "All tweaks and optimizations have been applied successfully. Please restart your computer to ensure all changes take effect."

# Optionally, prompt the user to restart the computer
$RestartPrompt = Read-Host "Would you like to restart your computer now? (Y/N)"
if ($RestartPrompt -eq 'Y' -or $RestartPrompt -eq 'y') {
  Restart-Computer
}
else {
  Write-Output "Please remember to restart your computer later to apply all changes."
}


@echo off
::Exm free network utility V2 | Made and distributed by EXM TWEAKS, S.R.O. ® 2025
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b

:: Color Codes
set w=[97m
set p=[95m
set b=[96m
set o=[1m
%B%

:: Enabling ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul
 %p%
::Enabling Delayed Expansion
setlocal EnabledelayedExpansion > nul
cls 

for /f %%i in ('wmic path Win32_UserAccount where name^="%username%" get sid ^| findstr "S-"') do set "USER_SID=%%i"

::Enabling Restore points 
chcp 437 >nul 2>&1
powershell -NoProfile Enable-ComputerRestore -Drive 'C:\' >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
chcp 65001 >nul 2>&1

cls 
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                         %p%███████╗██╗  ██╗███╗   ███╗  ███╗  ██╗███████╗████████╗  ██╗   ██╗████████╗██╗██╗     ██╗████████╗██╗   ██╗██████╗     █████╗
echo.                                         %p%██╔════╝╚██╗██╔╝████╗ ████║  ████╗ ██║██╔════╝╚══██╔══╝  ██║   ██║╚══██╔══╝██║██║     ██║╚══██╔══╝╚██╗ ██╔╝╚════██╗   ██╔══██╗
echo.                                         %p%█████╗   ╚███╔╝ ██╔████╔██║  ██╔██╗██║█████╗     ██║     ██║   ██║   ██║   ██║██║     ██║   ██║    ╚████╔╝   ███╔═╝   ██║  ██║
echo.                                         %p%██╔══╝   ██╔██╗ ██║╚██╔╝██║  ██║╚████║██╔══╝     ██║     ██║   ██║   ██║   ██║██║     ██║   ██║     ╚██╔╝  ██╔══╝     ██║  ██║
echo.                                         %p%███████╗██╔╝╚██╗██║ ╚═╝ ██║  ██║ ╚███║███████╗   ██║     ╚██████╔╝   ██║   ██║███████╗██║   ██║      ██║   ███████╗██╗╚█████╔╝
echo.                                         %p%╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝  ╚══╝╚══════╝   ╚═╝      ╚═════╝    ╚═╝   ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝ ╚════╝    %B%
echo.                                                                            ╔════════════════════════════════════════════════════╗
echo.                                                                            ║                                                    ║
echo.                                                                            ║     %w% Checking for Administrative Privelages...   %b%  ║
echo.                                                                            ║                                                    ║
echo.                                                                            ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 1 goto welcome  
) ELSE ( 
cls 
timeout /t 1 /nobreak > NUL
chcp 437 >nul 2>&1
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
chcp 65001 >nul 2>&1
:rmenu
cls
echo. 
echo. 
echo. 
echo. 
echo.                                                    %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                           %W%   Exm is not running as Admin!
echo.                                         
echo.                                                              %W% Please close the utility and run it as administrator so the optimizations can apply properly!
echo.                                         
echo.                                                                                            %W%  If you want to Exit press %p%X  
echo.                                                    %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                 
echo.                                                         %W% If that doesnt work, you can press %p%U%w% to disable UAC, after that restart your pc and utility should work
echo.                  
echo.                                                    %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%

set /p input=:
if /i %input% == X exit
if /i %input% == U start https://discordapp.com/channels/1177410668606009444/1178430446590238860/1325530493332226198
)
) ELSE (
echo Invalid Input & goto rmenu

%b%
:welcome
CLS
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
echo. 
echo.                                                                                                   %W% EXM FREE NETWORK UTILITY V2                       
echo.
echo.                                                                                    %p% ██╗       ██╗███████╗██╗      █████╗  █████╗ ███╗   ███╗███████╗ 
echo.                                                                                    %p% ██║  ██╗  ██║██╔════╝██║     ██╔══██╗██╔══██╗████╗ ████║██╔════╝ 
echo.                                                                                    %p% ╚██╗████╗██╔╝█████╗  ██║     ██║  ╚═╝██║  ██║██╔████╔██║█████╗   
echo.                                                                                    %p%  ████╔═████║ ██╔══╝  ██║     ██║  ██╗██║  ██║██║╚██╔╝██║██╔══╝   
echo.                                                                                    %p%  ╚██╔╝ ╚██╔╝ ███████╗███████╗╚█████╔╝╚█████╔╝██║ ╚═╝ ██║███████╗ 
echo.                                                                                    %p%   ╚═╝   ╚═╝  ╚══════╝╚══════╝ ╚════╝  ╚════╝ ╚═╝     ╚═╝╚══════╝  
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                %o% Warning
echo.
echo.                                           We are not responsible for any problems/Damages with your PC this may cause, if you encounter any, don't be afraid to reach out in our discord server
echo.
echo.                                           It's prohibited to resell any of our free tools, it will lead to consequences, the utility is open sourced and the code may be used for non profit
echo.  
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                          Instructions * Faq
echo.
echo.                                            Press a NUMBER on your keyboard followed by ENTER to select an option, Please Read All warnings, don't just blindly press buttons without reading.
echo.
echo.                                                    You can find the tutorial, more information about the utility and much more in the EXM Tweaks Discord Server (discord.gg/exm)
echo.  
echo.                                                                        Made and distributed by EXM TWEAKS, S.R.O. ® 2025 * Version 2.0 * Updated 9th of January 2025
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                               
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w%            Press any key to continue...                   %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
echo. 
pause > nul
CLS

 
:: Restore Point
:restorepoint
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.   
echo.                                                                                               %W% EXM FREE NETWORK UTILITY V2                        
echo.                                                  
echo.                                                          %p%██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███████╗  ██████╗  █████╗ ██╗███╗  ██╗████████╗         
echo.                                                          %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝        
echo.                                                          %p%██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝█████╗    ██████╔╝██║  ██║██║██╔██╗██║   ██║            
echo.                                                          %p%██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██╔══╝    ██╔═══╝ ██║  ██║██║██║╚████║   ██║           
echo.                                                          %p%██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║███████╗  ██║     ╚█████╔╝██║██║ ╚███║   ██║           
echo.                                                          %p%╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚══════╝  ╚═╝      ╚════╝ ╚═╝╚═╝  ╚══╝   ╚═╝           
echo.                                                   %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                         %w% Do you want to Create a Restore Point?                                 
echo.                                                                                                                                                                 
echo.                                                                                                                                                                 
echo.                                                                           %p%[%w%1%p%]%w% Make A restore Point             %p%[%w%2%p%]%w% Skip to menu
echo.
echo. 
echo.                                                                                                %p%[%w%R%p%]%w% Use a restore point
echo.                                                                                                                                                                 
echo.                                                   %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                              %W% Allows you to revert your PC to the same settings as it was when making the restore point         
echo.                                                                       %W% You can use a restore point later on in the utility, if you wish to do so                
echo.                                                   %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto createRP
if /i %input% == 2 goto nmenu
if /i %input% == R goto RESTORE
::secretskiptomenu
if /i %input% == m goto nmenu
) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto restorepoint

:createRP
cls 
echo.
echo.
echo.
echo.                                                                  %p%██████╗ ███████╗ ██████╗████████╗ █████╗ ██████╗ ███████╗  ██████╗  █████╗ ██╗███╗  ██╗████████╗
echo.                                                                  %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗ ██║╚══██╔══╝
echo.                                                                  %p%██████╔╝█████╗  ╚█████╗    ██║   ██║  ██║██████╔╝█████╗    ██████╔╝██║  ██║██║██╔██╗██║   ██║   
echo.                                                                  %p%██╔══██╗██╔══╝   ╚═══██╗   ██║   ██║  ██║██╔══██╗██╔══╝    ██╔═══╝ ██║  ██║██║██║╚████║   ██║   
echo.                                                                  %p%██║  ██║███████╗██████╔╝   ██║   ╚█████╔╝██║  ██║███████╗  ██║     ╚█████╔╝██║██║ ╚███║   ██║   
echo.                                                                  %p%╚═╝  ╚═╝╚══════╝╚═════╝    ╚═╝    ╚════╝ ╚═╝  ╚═╝╚══════╝  ╚═╝      ╚════╝ ╚═╝╚═╝  ╚══╝   ╚═╝   
echo.
echo. %w% Creating a restore point... %b%                                                       
chcp 437 >nul
powershell "Checkpoint-Computer -Description 'EXM Tweaks Restore Point'
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully, press "OK" to continue', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 
cls

goto Nmenu

:restore
cls
rstrui.exe
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto menu

:exit
cls
echo.
echo.
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('! Make sure to restart your pc after using, so the tweaks properly apply !, thanks for using the exm utility. Press "ok" to exit', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1
pause > nul
cls
exit


:net
:nmenu
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                                     %p%  ███████╗██╗  ██╗███╗   ███╗  ███╗  ██╗███████╗████████╗  ██╗   ██╗████████╗██╗ ██╗     ██╗████████╗██╗   ██╗  ██████╗     █████╗ 
echo.                                                     %p%  ██╔════╝╚██╗██╔╝████╗ ████║  ████╗ ██║██╔════╝╚══██╔══╝  ██║   ██║╚══██╔══╝██║ ██║     ██║╚══██╔══╝╚██╗ ██╔╝  ╚════██╗   ██╔══██╗
echo.                                                     %p%  █████╗   ╚███╔╝ ██╔████╔██║  ██╔██╗██║█████╗     ██║     ██║   ██║   ██║   ██║ ██║     ██║   ██║    ╚████╔╝     ███╔═╝   ██║  ██║
echo.                                                     %p%  ██╔══╝   ██╔██╗ ██║╚██╔╝██║  ██║╚████║██╔══╝     ██║     ██║   ██║   ██║   ██║ ██║     ██║   ██║     ╚██╔╝    ██╔══╝     ██║  ██║
echo.                                                     %p%  ███████╗██╔╝╚██╗██║ ╚═╝ ██║  ██║ ╚███║███████╗   ██║     ╚██████╔╝   ██║   ██║ ███████╗██║   ██║      ██║     ███████╗██╗╚█████╔╝
echo.                                                     %p%  ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝  ╚══╝╚══════╝   ╚═╝      ╚═════╝    ╚═╝   ╚═╝ ╚══════╝╚═╝   ╚═╝      ╚═╝     ╚══════╝╚═╝ ╚════╝ 
echo.                                                       %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w% 
echo.                                                                                                                                                      
echo.                                                                                           %p%%w%%p%%w%                 %p%[%w%B%p%]%w% Bufferbloat Test  
echo.    
echo.                                                                                           %p%%w%%p%%w%                 %p%[%w%A%p%]%w% Apply all (1-12) 
echo.         
echo.                                                                     %p%[%w%1%p%]%w% Set DNS, Local, Hosts, and NetBT priorities            %p%[%w%2%p%]%w% Set Network Throttling Index
echo.
echo.                                                                     %p%[%w%3%p%]%w% Set MaxUserPort, TcpTimedWaitDelay, and DefaultTTL     %p%[%w%4%p%]%w% Tweak TCP Settings and disable limiting
echo.
echo.                                                                     %p%[%w%5%p%]%w% Tweak MTU Settings                                     %p%[%w%6%p%]%w% Configure offload and network settings 
echo.
echo.                                                                     %p%[%w%7%p%]%w% Disable IPv6                                           %p%[%w%8%p%]%w% Disable Internet Probing
echo.                                                                                                                                                                                   
echo.                                                                     %p%[%w%9%p%]%w% Disable Internet addons                                %p%[%w%10%p%]%w% Disable Nagiles Algorithm
echo. 
echo.                                                                     %p%[%w%11%p%]%w% Enable Task Offload                                   %p%[%w%12%p%]%w% Optimize MLD , ICMP Chimney, DCA, and More
echo.
echo.                                                                     %p%[%w%13%p%]%w% Set a QOS Policy                                      %p%[%w%14%p%]%w% Optimize NIC Settings
echo.
echo.                                                                     %p%[%w%15%p%]%w% Toggle bufferbloat                                    %p%[%w%16%p%]%w% Coming soon!
echo.
echo.                                                      %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w% 
echo.
echo.                                                                     %p%[%w%R%p%]%w% Revert (1-12)                                          %p%[%w%P%p%]%w%  Completely optimize your PC  
echo.
echo.                                                                     %p%[%w%X%p%]%w% Exit                                                   %p%[%w%D%p%]%w% EXM Tweaks Discord            
echo.
echo.                                                                      %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2025 * Version 2.0 * Updated 9th of January 2025 
echo.
echo.                                                      %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w% 
echo.                                                                 
echo.

set /p input=:
if /i %input% == A goto nALL
if /i %input% == 1 goto n1
if /i %input% == 2 goto n2
if /i %input% == 3 goto n3
if /i %input% == 4 goto n4
if /i %input% == 5 goto n5
if /i %input% == 6 goto n6
if /i %input% == 7 goto n7
if /i %input% == 8 goto n8
if /i %input% == 9 goto n9
if /i %input% == 10 goto n10
if /i %input% == 11 goto n11
if /i %input% == 12 goto n12
if /i %input% == 13 goto qos
if /i %input% == 14 goto n14
if /i %input% == 15 goto n15

if /i %input% == R goto Revert
if /i %input% == B START https://www.waveform.com/tools/bufferbloat
if /i %input% == X goto Exit
if /i %input% == P start https://exmtweaks.com 
if /i %input% == D start https://discord.gg/exm

) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto nmenu

:nALL
cls
echo. 
echo. 
echo. 
echo.                                                                %p%███╗  ██╗███████╗████████╗ ██╗       ██╗ █████╗ ██████╗ ██╗  ██╗
echo.                                                                %p%████╗ ██║██╔════╝╚══██╔══╝ ██║  ██╗  ██║██╔══██╗██╔══██╗██║ ██╔╝
echo.                                                                %p%██╔██╗██║█████╗     ██║    ╚██╗████╗██╔╝██║  ██║██████╔╝█████═╝ 
echo.                                                                %p%██║╚████║██╔══╝     ██║     ████╔═████║ ██║  ██║██╔══██╗██╔═██╗ 
echo.                                                                %p%██║ ╚███║███████╗   ██║     ╚██╔╝ ╚██╔╝ ╚█████╔╝██║  ██║██║ ╚██╗
echo.                                                                %p%╚═╝  ╚══╝╚══════╝   ╚═╝      ╚═╝   ╚═╝   ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
echo. 
echo. 
echo. 
echo %w% Enabling Task Offloads%b%
netsh int ip set global taskoffload=enabled >nul 2>&1
echo.
echo %w% - Setting Network Throttling Index%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
echo.
echo %w% - Setting MaxUserPort, TcpTimedWaitDelay, and DefaultTTL...%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f
echo.
echo %w% - Configuring TCP settings and MTU with netsh (it will show an error on 2 of them if you have wifi or ethernet disabled)%b%
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
echo.
chcp 437 >nul 2>&1
echo %w% - Configuring offload and network settings %b%
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Disable-NetAdapterChecksumOffload -Name *
chcp 65001 >nul 2>&1
echo.
echo %w% - Disabling ipv6%b%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
echo.
echo %w%- Disabling Active Probing%b%
reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 0 /f
echo.
echo %w%- Disabling Internet addons
rem Set registry values for Ext Settings
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /t REG_SZ /d "*" /f

rem Set registry values for Ext Stats
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF90-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF91-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF94-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{333C7BC4-460F-11D0-BC04-0080C7055A83}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{373984C9-B845-449B-91E7-45AC83036ADE}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{6BF52A52-394A-11D3-B153-00C04F79FAA6}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2049-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2051-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A05-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A06-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A07-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A08-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A0A-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{D2517915-48CE-4286-970F-921E881B8C5C}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{EE09B103-97E0-11CF-978F-00A02463E06F}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F32-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F33-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F34-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F35-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F36-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F39-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
echo.
echo %w% - Disabling Nagiles algorithm %b%
sc config Winmgmt start= demand >nul 2>&1
sc start Winmgmt >nul 2>&1
echo %w% - Enabling TCPNoDelay %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f
echo.
echo %w% Optimizing MLD and ICMP%b%
netsh int ip set global dhcpmediasense=disabled >nul 2>&1
netsh int ip set global mediasenseeventlog=disabled >nul 2>&1
netsh int ip set global mldlevel=none >nul 2>&1
netsh int ip set global icmpredirects=disabled >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=disabled >nul 2>&1
netsh int tcp set global rsc=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set heuristics wsh=disabled >nul 2>&1
netsh int tcp set security mpp=disabled >nul 2>&1
netsh int tcp set security profiles=disabled >nul 2>&1
echo.
echo %w% - Disabling TCP heuristics / Disabling Network Limiting %b%
netsh int tcp set heuristics Disabled


echo.
echo.
echo.
echo.                                                                           %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                           %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                           %b%╚═══════════════════════════════════════════════════════════════╝
echo.


pause > nul
cls
goto NMenu

:revert
CLS
echo.
echo.
echo.
echo.                                                                %p%██████╗ ███████╗██╗   ██╗███████╗██████╗ ████████╗██╗███╗  ██╗ ██████╗          
echo.                                                                %p%██╔══██╗██╔════╝██║   ██║██╔════╝██╔══██╗╚══██╔══╝██║████╗ ██║██╔════╝          
echo.                                                                %p%██████╔╝█████╗  ╚██╗ ██╔╝█████╗  ██████╔╝   ██║   ██║██╔██╗██║██║  ██╗          
echo.                                                                %p%██╔══██╗██╔══╝   ╚████╔╝ ██╔══╝  ██╔══██╗   ██║   ██║██║╚████║██║  ╚██╗         
echo.                                                                %p%██║  ██║███████╗  ╚██╔╝  ███████╗██║  ██║   ██║   ██║██║ ╚███║╚██████╔╝██╗██╗██╗
echo.                                                                %p%╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═╝╚═╝╚═╝
echo.
echo.

:: Addons
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF90-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF91-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF94-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{333C7BC4-460F-11D0-BC04-0080C7055A83}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{373984C9-B845-449B-91E7-45AC83036ADE}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{6BF52A52-394A-11D3-B153-00C04F79FAA6}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2049-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2051-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A05-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A06-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A07-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A08-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A0A-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{D2517915-48CE-4286-970F-921E881B8C5C}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{EE09B103-97E0-11CF-978F-00A02463E06F}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F32-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F33-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F34-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F35-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F36-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F39-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /f >nul 2>&1

::DnsPriority
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /f >nul 2>&1

::Network Throttling Index
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /f >nul 2>&1

:: MaxUserPort, TcpTimedWaitDelay, and DefaultTTL
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /f >nul 2>&1

::TCP Hueretics
netsh int tcp set heuristics Enabled >nul 2>&1

:: TCP settings and MTU with netsh
netsh int tcp set supplemental internet congestionprovider=default >nul 2>&1
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1492 store=persistent >nul 2>&1
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1280 store=persistent >nul 2>&1
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent >nul 2>&1
netsh interface ipv6 set subinterface "Ethernet" mtu=1280 store=persistent >nul 2>&1

:: Active Probing
reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 1 /f >nul 2>&1

chcp 65001 >nul 2>&1
:: Disable Task Offloads
netsh int ip set global taskoffload=enabled >nul 2>&1

::  offload and network settings 
chcp 437 >nul 2>&1
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing enabled >nul 2>&1
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling enabled >nul 2>&1
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney enabled >nul 2>&1
PowerShell.exe Enable-NetAdapterLso -Name * >nul 2>&1
PowerShell.exe Enable-NetAdapterChecksumOffload -Name * >nul 2>&1
chcp 65001 >nul 2>&1

:: Re-enable Nagle's Algorithm, reset Interface Metric
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
    Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v InterfaceMetric /f
    Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /f
    Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /f
    Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /f
)>nul 2>&1

:: MLD
netsh int ip set global dhcpmediasense=enabled >nul 2>&1
netsh int ip set global mediasenseeventlog=enabled >nul 2>&1
netsh int ip set global mldlevel=default >nul 2>&1
netsh int ip set global icmpredirects=enabled >nul 2>&1
netsh int tcp set global chimney=disabled >nul 2>&1
netsh int tcp set global dca=disabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global rsc=enabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=5 >nul 2>&1
netsh int tcp set global timestamps=enabled >nul 2>&1
netsh int tcp set global ecncapability=enabled >nul 2>&1
netsh int tcp set heuristics enabled >nul 2>&1
netsh int tcp set heuristics wsh=enabled >nul 2>&1
netsh int tcp set security mpp=enabled >nul 2>&1
netsh int tcp set security profiles=enabled >nul 2>&1

echo.
echo.
echo.
echo.                                                                      %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                      %b%║%w% * Reverted all network tweaks, press any key to continue...   %b%║
echo.                                                                      %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto nmenu

:n11
echo %w% Enabling Task Offloads%b%
netsh int ip set global taskoffload=enabled >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu


:n15
cls
echo.
echo.
echo.
echo.                                              %p%██████╗ ██╗   ██╗███████╗███████╗███████╗██████╗ ██████╗ ██╗      █████╗  █████╗ ████████╗
echo.                                              %p%██╔══██╗██║   ██║██╔════╝██╔════╝██╔════╝██╔══██╗██╔══██╗██║     ██╔══██╗██╔══██╗╚══██╔══╝
echo.                                              %p%██████╦╝██║   ██║█████╗  █████╗  █████╗  ██████╔╝██████╦╝██║     ██║  ██║███████║   ██║   
echo.                                              %p%██╔══██╗██║   ██║██╔══╝  ██╔══╝  ██╔══╝  ██╔══██╗██╔══██╗██║     ██║  ██║██╔══██║   ██║   
echo.                                              %p%██████╦╝╚██████╔╝██║     ██║     ███████╗██║  ██║██████╦╝███████╗╚█████╔╝██║  ██║   ██║   
echo.                                              %p%╚═════╝  ╚═════╝ ╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝ ╚════╝ ╚═╝  ╚═╝   ╚═╝   
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                                %p%[%w%1%p%]%w% Less bufferbloat but lower network speed 	      
echo. 
echo.                                                                %p%[%w%2%p%]%w% Normal speed and normal bufferbloat (default)
echo. 
echo.
echo.                                                                              %p%[%w%M%p%]%w% Back to menu
echo. 
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                    This will either enable or disable autotuning depending on the option you choose
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════════════"%w%
         
set /p input=:
if /i %input% == 1 goto disableautotuning
if /i %input% == 2 goto enableautotuning
if /i %input% == M goto nmenu
) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu

:RedirectMenu
goto n15

:disableautotuning
echo %w% - Disabling autotuning%b%
netsh int tcp set global autotuninglevel=disabled
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:enableautotuning
echo %w% - Enabling autotuning%b%
netsh int tcp set global autotuninglevel=normal
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n6
echo %w% -Configuring offload and network settings %b%
chcp 437 >nul 2>&1
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Disable-NetAdapterChecksumOffload -Name *
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n12
echo %w% Optimizing MLD and ICMP%b%
netsh int ip set global dhcpmediasense=disabled >nul 2>&1
netsh int ip set global mediasenseeventlog=disabled >nul 2>&1
netsh int ip set global mldlevel=none >nul 2>&1
netsh int ip set global icmpredirects=disabled >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=disabled >nul 2>&1
netsh int tcp set global rsc=disabled >nul 2>&1
netsh int tcp set global maxsynretransmissions=2 >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1
netsh int tcp set global ecncapability=disabled >nul 2>&1
netsh int tcp set heuristics disabled >nul 2>&1
netsh int tcp set heuristics wsh=disabled >nul 2>&1
netsh int tcp set security mpp=disabled >nul 2>&1
netsh int tcp set security profiles=disabled >nul 2>&1

echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n1
echo %w% -  Setting DNS, Local, Hosts, and NetBT priorities...%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 6 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 4 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 5 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 7 /f
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n2
echo %w% - Setting Network Throttling Index%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.

pause > nul
cls
goto NMenu

:n3
echo %w% - Setting MaxUserPort, TcpTimedWaitDelay, and DefaultTTL...%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
echo."
pause > nul
cls
goto NMenu

:n4
chcp 437 >nul 2>&1
echo %w% - Configuring TCP settings with PowerShell%b%
PowerShell.exe Set-NetTcpSetting -SettingName internet -EcnCapability enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -Timestamps enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTcpSetting -SettingName internet -NonSackRttResiliency disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -InitialRto 2000
PowerShell.exe Set-NetTcpSetting -SettingName internet -MinRto 300

echo %w% - Disabling TCP heuristics / Disabling Network Limiting %b%
netsh int tcp set heuristics Disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled

chcp 65001 >nul 2>&1
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
echo.
pause > nul
cls
goto NMenu


:n7
chcp 437 >nul 2>&1
echo %w% - Disabling ipv6%b%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
chcp 65001 >nul 2>&1
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu


:n5
chcp 437 >nul 2>&1
echo %w% - Configuring TCP settings and MTU with netsh %b%
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
chcp 65001 >nul 2>&1
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n10

echo %w% - Disabling Nagiles algorithm %b%
sc config Winmgmt start= demand >nul 2>&1
sc start Winmgmt >nul 2>&1

echo %w% - Enabling TCPNoDelay %b% 
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f

echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n14
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('!WARNING! You can only use this if you are on ethernet, if you are on wifi, press "N" on the next page', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
:nicethernet
cls
echo.
echo.
echo.
echo.                                                                                 %p%███╗  ██╗██╗ █████╗ 
echo.                                                                                 %p%████╗ ██║██║██╔══██╗
echo.                                                                                 %p%██╔██╗██║██║██║  ╚═╝
echo.                                                                                 %p%██║╚████║██║██║  ██╗
echo.                                                                                 %p%██║ ╚███║██║╚█████╔╝
echo.                                                                                 %p%╚═╝  ╚══╝╚═╝ ╚════╝ 
echo.                                              %b%"═══════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                ONLY DO THIS ON ETHERNET
echo.
echo.                                                     %p%[%w%1%p%]%w% Optimize NIC Settings       %p%[%w%2%p%]%w% Revert NIC settings
echo. 
echo.
echo.                                                                              %p%[%w%M%p%]%w% Back to menu
echo. 
echo.                                              %b%"════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                  Optimizes NIC (network interface card settings) to decrease ping and help your network
echo.                                              %b%"═════════════════════════════════════════════════════════════════════════════════════"%w%
         
set /p input=:
if /i %input% == 1 goto nic
if /i %input% == 2 goto revertnic
if /i %input% == M goto nmenu
) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu

:RedirectMenu
goto nicethernet

:revertnic
echo %w% - Reverting NIC Settings... %b%

for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
    Reg.exe delete "%%n" /v "AdvancedEEE" /f
    Reg.exe delete "%%n" /v "*EEE" /f
    Reg.exe delete "%%n" /v "EEE" /f
    Reg.exe delete "%%n" /v "EnablePME" /f
    Reg.exe delete "%%n" /v "EEELinkAdvertisement" /f

    Reg.exe delete "%%n" /v "AutoPowerSaveModeEnabled" /f
    Reg.exe delete "%%n" /v "DisableDelayedPowerUp" /f
    Reg.exe delete "%%n" /v "AutoDisableGigabit" /f
    Reg.exe delete "%%n" /v "EnableGreenEthernet" /f
    Reg.exe delete "%%n" /v "EnableSavePowerNow" /f
    Reg.exe delete "%%n" /v "EnablePowerManagement" /f
    Reg.exe delete "%%n" /v "NicAutoPowerSaver" /f
    Reg.exe delete "%%n" /v "PowerDownPll" /f
    Reg.exe delete "%%n" /v "PowerSavingMode" /f
    Reg.exe delete "%%n" /v "ReduceSpeedOnPowerDown" /f
    Reg.exe delete "%%n" /v "S5NicKeepOverrideMacAddrV2" /f

    Reg.exe delete "%%n" /v "EnableDynamicPowerGating" /f
    Reg.exe delete "%%n" /v "EnableConnectedPowerGating" /f

    Reg.exe delete "%%n" /v "GigaLite" /f
    Reg.exe delete "%%n" /v "ULPMode" /f

    Reg.exe delete "%%n" /v "EnableWakeOnLan" /f
    Reg.exe delete "%%n" /v "WakeOnDisconnect" /f
    Reg.exe delete "%%n" /v "*WakeOnMagicPacket" /f
    Reg.exe delete "%%n" /v "S5WakeOnLan" /f
    Reg.exe delete "%%n" /v "*WakeOnPattern" /f
    Reg.exe delete "%%n" /v "WakeOnLink" /f
    Reg.exe delete "%%n" /v "WolShutdownLinkSpeed" /f

    Reg.exe delete "%%n" /v "JumboPacket" /f

    Reg.exe delete "%%n" /v "TransmitBuffers" /f
    Reg.exe delete "%%n" /v "ReceiveBuffers" /f

    Reg.exe delete "%%n" /v "IPChecksumOffloadIPv4" /f
    Reg.exe delete "%%n" /v "LsoV1IPv4" /f
    Reg.exe delete "%%n" /v "LsoV2IPv4" /f
    Reg.exe delete "%%n" /v "LsoV2IPv6" /f
    Reg.exe delete "%%n" /v "PMARPOffload" /f
    Reg.exe delete "%%n" /v "PMNSOffload" /f
    Reg.exe delete "%%n" /v "TCPChecksumOffloadIPv4" /f
    Reg.exe delete "%%n" /v "TCPChecksumOffloadIPv6" /f
    Reg.exe delete "%%n" /v "UDPChecksumOffloadIPv6" /f
    Reg.exe delete "%%n" /v "UDPChecksumOffloadIPv4" /f

    Reg.exe delete "%%n" /v "RSS" /f
	Reg.exe delete "%%n" /v "*FlowControl" /f 
	Reg.exe delete "%%n" /v "FlowControlCap" /f
	Reg.exe delete "%%n" /v "RxAbsIntDelay" /f 
	Reg.exe delete "%%n" /v "TxIntDelay" /f 
	Reg.exe delete "%%n" /v "TxAbsIntDelay" /f 
	Reg.exe delete "%%n" /v "FatChannelIntolerant" /f 
)
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:nic

echo %w%- Disabling EEE (Energy Efficient Ethernet) %b%
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
    Reg.exe add "%%n" /v "AdvancedEEE" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "*EEE" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EEE" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EnablePME" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f 
	echo %w%- Disabling Power Saving Modes, Power Managment and Much more  %b%
	Reg.exe add "%%n" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "DisabledelayedPowerUp" /t REG_SZ /d "2" /f 
	Reg.exe add "%%n" /v "AutoDisablingGigabit" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EnablePowerManagement" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "NicAutoPowerSaver" /t REG_SZ /d "2" /f
	Reg.exe add "%%n" /v "PowerDownPll" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "PowerSavingMode" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f 
	echo %w%- Disabling Power Gating %b%
	Reg.exe add "%%n" /v "EnabledynamicPowerGating" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "EnableConnectedPowerGating" /t REG_SZ /d "0" /f 
	echo %w%- Disabling Giga Lite %b%
	Reg.exe add "%%n" /v "GigaLite" /t REG_SZ /d "0" /f 
	echo %w%- Disabling Ultra Low Power Mode %b%
	Reg.exe add "%%n" /v "ULPMode" /t REG_SZ /d "0" /f 
	echo %w%- Disabling WakeOns %b%
	Reg.exe add "%%n" /v "EnableWakeOnLan" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "WakeOnDisconnect" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "S5WakeOnLan" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f 
	echo %w%- Disabling Jumbo Frame/Packet %b%
	Reg.exe add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f 
	echo %w%- Configuring Buffer Sizes %b%
	Reg.exe add "%%n" /v "TransmitBuffers" /t REG_SZ /d "2048" /f 
	Reg.exe add "%%n" /v "ReceiveBuffers" /t REG_SZ /d "1024" /f 
	echo %w%- Configuring and Disabling Offloads %b%
	Reg.exe add "%%n" /v "IPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "LsoV1IPv4" /t REG_SZ /d "0" /f  
	Reg.exe add "%%n" /v "LsoV2IPv4" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "LsoV2IPv6" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "PMARPOffload" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "PMNSOffload" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "UDPChecksumOffloadIPv6" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "UDPChecksumOffloadIPv4" /t REG_SZ /d "0" /f 
	echo %w%- Enabling RSS in NIC %b%
	Reg.exe add "%%n" /v "RSS" /t REG_SZ /d "1" /f 
	Reg.exe add "%%n" /v "*NumRssQueues" /t REG_SZ /d "2" /f 
	Reg.exe add "%%n" /v "RSSProfile" /t REG_SZ /d "3" /f 
	echo %w%- Disabling Flow Control %b%
	Reg.exe add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f 
	echo %w%- Removing Interrupt Delays %b%
	Reg.exe add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f 
	Reg.exe add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f 
	echo %w%- Removing Adapter Notification Sending %b%
	Reg.exe add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f 
	)

echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n8
chcp 437 >nul 2>&1
echo %w%- Disabling Active Probing%b%
reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\services\NlaSvc\Parameters\Internet" /v "EnableActiveProbing" /t REG_DWORD /d 0 /f
chcp 65001 >nul 2>&1

echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:n9
chcp 437 >nul 2>&1
echo %w%- Disabling Internet addons
rem Set registry values for Ext Settings
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF90-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF91-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{2933BF94-7B36-11D2-B20E-00C04F983E60}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{333C7BC4-460F-11D0-BC04-0080C7055A83}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{373984C9-B845-449B-91E7-45AC83036ADE}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{6BF52A52-394A-11D3-B153-00C04F79FAA6}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2049-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{884E2051-217D-11DA-B2A4-000E7BBB2B09}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A05-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A06-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A07-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A08-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{88D96A0A-F192-11D4-A65F-0040963251E5}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{D2517915-48CE-4286-970F-921E881B8C5C}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{EE09B103-97E0-11CF-978F-00A02463E06F}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F32-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F33-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F34-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F35-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F36-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F5078F39-C551-11D3-89B9-0000F81FE221}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /t REG_SZ /d "*" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Flags" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Settings\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}" /v "Version" /t REG_SZ /d "*" /f

rem Set registry values for Ext Stats
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF90-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF91-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{2933BF94-7B36-11D2-B20E-00C04F983E60}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{3050F819-98B5-11CF-BB82-00AA00BDCE0B}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{333C7BC4-460F-11D0-BC04-0080C7055A83}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{373984C9-B845-449B-91E7-45AC83036ADE}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{64AB4BB7-111E-11D1-8F79-00C04FC2FBE1}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{6BF52A52-394A-11D3-B153-00C04F79FAA6}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2049-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{884E2051-217D-11DA-B2A4-000E7BBB2B09}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A05-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A06-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A07-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A08-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{88D96A0A-F192-11D4-A65F-0040963251E5}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{8E4062D9-FE1B-4B9E-AA16-5E8EEF68F48E}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{D2517915-48CE-4286-970F-921E881B8C5C}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{EE09B103-97E0-11CF-978F-00A02463E06F}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F32-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F33-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F34-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F35-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F36-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F5078F39-C551-11D3-89B9-0000F81FE221}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F12-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Ext\Stats\{F6D90F14-9C73-11D3-B32E-00C04F990BB4}\iexplore" /v "Flags" /t REG_DWORD /d 4 /f
chcp 65001 >nul 2>&1

echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto NMenu

:qos
cls
echo.
echo.
echo.
echo.                                                                      %p% ██████╗  █████╗  ██████╗  ██████╗  █████╗ ██╗     ██╗ █████╗ ██╗   ██╗╗
echo.                                                                      %p%██╔═══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║     ██║██╔══██╗╚██╗ ██╔╝
echo.                                                                      %p%██║██╗██║██║  ██║╚█████╗   ██████╔╝██║  ██║██║     ██║██║  ╚═╝ ╚████╔╝ 
echo.                                                                      %p%╚██████╔╝██║  ██║ ╚═══██╗  ██╔═══╝ ██║  ██║██║     ██║██║  ██╗  ╚██╔╝  
echo.                                                                      %p% ╚═██╔═╝ ╚█████╔╝██████╔╝  ██║     ╚█████╔╝███████╗██║╚█████╔╝   ██║   
echo.                                                                      %p%   ╚═╝    ╚════╝ ╚═════╝   ╚═╝      ╚════╝ ╚══════╝╚═╝ ╚════╝    ╚═╝   
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                         If the number 4 fix doesnt work, you will have to unfortunatly skip this step 
echo.
echo.                                                                                                                                                               
echo.                                                            %p%[%w%1%p%]%w% Start PSCHED          %p%[%w%2%p%]%w% Enable MS-Pacer            %p%[%w%3%p%]%w% Open GPEDIT   
echo.  
echo.
echo.                                                              %p%%w%%p%%w%        %p%[%w%4%p%]%w% Download GPEDIT (only Run this if you cant open GPEDIT)  
echo. 
echo.
echo.                                                              %p%%w%%p%%w%                           %p%[%w%M%p%]%w% Back to menu   
echo.
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                              %W%QoS policy defines throttling limits determines the rate of outbound network traffic
echo.                                                   %W% It basically will make it so your router will prioritize that task over others, decreasing your ping by a lot
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto q1
if /i %input% == 2 goto q2
if /i %input% == 3 goto q3
if /i %input% == 4 goto q4
if /i %input% == M goto nmenu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto qos

:q2
chcp 437 >nul 2>&1
echo %w%- Enabling MSPacer %b%
powershell -NoProfile -Command "Enable-NetAdapterBinding -Name "*" -ComponentID ms_pacer"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q1
echo %w%- Enabling PSCHED %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "Start" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q3
echo %w%- Start GPEDIT %b%
start gpedit.msc
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

:q4
chcp 437 >nul 2>&1
powershell "&  {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have to restart your pc after this', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"


start https://discord.com/channels/1177410668606009444/1267815844189306951/1328747836229156946
echo %w% This fix takes you to a discord message in my discord server, if it doesnt load, simply go to the #free utility page, the fix is there %B%

chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                                                  %b%╔═══════════════════════════════════════════════════════════════╗
echo.                                                                                  %b%║    %w% * Operation Completed * Press any key to continue...      %b%║
echo.                                                                                  %b%╚═══════════════════════════════════════════════════════════════╝
echo.
pause > nul
cls
goto :qos

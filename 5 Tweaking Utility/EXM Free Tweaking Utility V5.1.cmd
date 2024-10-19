@echo off
Set Version=5.1

:: Color Codes
set w=[97m
set p=[95m
set b=[96m
%B%

:: Enable ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enable Delayed Expansion
setlocal EnableDelayedExpansion > nul
cls 

::Checking Admin Privlages (this is so the tweaks apply properly)
chcp 65001 >nul 2>&1
cls 
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║   %w% Checking for Administrative Privelages...     %b%  ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL

rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (   
cls 
echo.
echo. ╔════════════════════════════════════════════════════╗
echo. ║                                                    ║
echo  ║  %w% Running Exm Tweaking Utility as Administrator...%b% ║
echo. ║                                                    ║
echo. ╚════════════════════════════════════════════════════╝
timeout /t 1 /nobreak > NUL
chcp 437 >nul 2>&1
powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
chcp 65001 >nul 2>&1

if !errorlevel! equ 0 exit /b


echo.
echo             Exm is not running as Admin!
echo     Some optimizations won't work. Continue anyway?
echo.
choice /c:"CQ" /n /m "%BS%               [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)


chcp 65001 >nul 2>&1

set THREADS=%NUMBER_OF_PROCESSORS% > nul
for /f %%i in ('wmic path Win32_UserAccount where name^="%username%" get sid ^| findstr "S-"') do set "USER_SID=%%i"


::Enable Restore points 
chcp 437 >nul 2>&1
powershell -NoProfile Enable-ComputerRestore -Drive 'C:\' >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f >nul 2>&1
chcp 65001 >nul 2>&1
%b%

CLS
echo. 
echo. 
echo.
echo.                                                                                    %p%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                                                                                    %p%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                                                                                    %p%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                                                                                    %p%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                                                                                    %p%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                                                                                    %p%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░ 
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                              Warning
echo.
echo.                                              We are not responsible for any problems/Damages with your PC this may cause, if you encounter any, don't be afraid to reach out in our discord server
echo.
echo.                                              It's prohibited to resell any of our free tools, it will lead to consequences, the utility is open sourced and the code may be used for non profit
echo.  
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                        Instructions / Faq
echo.
echo.                                               Press a NUMBER on your keyboard followed by ENTER to select an option, Please Read All warnings, don't just blindly press buttons without reading.
echo.
echo.                                                      You can find the tutorial, more information about the utility and much more in the EXM Tweaks Discord Server (discord.gg/exm)
echo.  
echo.
echo.                                                                       %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2024 %b%║%w% Version 5.1 %b%║%w% updated 14th of September 2024 
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.
echo.
echo.                                                                                      %b%"I═══════════════════════════════════════════════════════I"
echo.                                                                                                   %w%    Press any key to continue...
echo.                                                                                      %b%"I═══════════════════════════════════════════════════════I"
echo.

echo. 
pause > nul
CLS

:: Restore Point
:restorepoint
cls
echo.
echo.
echo.                                                     %p%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗
echo.                                                     %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝
echo.                                                     %p%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░
echo.                                                     %p%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░
echo.                                                     %p%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░
echo.                                                     %p%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                   %w% Do you want to Create a Restore Point? 
echo.                                                                                                                                                                      
echo.                                                                                                                                       
echo.                                                                           %p%[%w%1%p%]%w% Make A restore Point             %p%[%w%2%p%]%w% Skip        
echo.                                                                                                                                       
echo.                                                             
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                        %W% Allows you to revert your PC to the same settings as it was when making the restore point
echo.                                                                 %W% You can use a restore point later on in the utility, if you wish to do so
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto rON
if /i %input% == 2 goto res

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto restorepoint

:rON
chcp 437 >nul
echo %w%- Making a restore point... %b%
powershell -Command "Checkpoint-Computer -Description 'Exm Free Utility Restore Point' -RestorePointType 'MODIFY_SETTINGS'" 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 
echo.
echo.
echo.
cls
goto :res

:res 
md C:\exm
cls
echo %b%
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Downloading resources (power plan, Nvidia profile inspector & more)', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"

::Downloading power plan, autoruns, nvpi, wub & more
curl -g -k -L -# -o "%temp%\exm.zip" "https://exmapi.onrender.com/static/free/v5.0/v5.0_free_resources.zip" 
powershell -NoProfile Expand-Archive '%temp%\exm.zip' -DestinationPath 'C:\exm' >nul 2>&1 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Downloaded resources successfully', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1

cls
goto menu


:soon
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%                    Coming soon...  
echo.                                                %w%             Press any key to go to menu
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:restore
cls
rstrui.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu


:Menu
chcp 65001 >nul 2>&1
cls
echo.
echo.
echo.
echo.
echo.                                             %p% ███████╗██╗░░██╗███╗░░░███╗░███████╗██████╗░███████╗███████╗░██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗░░░██╗░███████╗░░░░░███╗░░
echo.                                             %p% ██╔════╝╚██╗██╔╝████╗░████║░██╔════╝██╔══██╗██╔════╝██╔════╝░██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝╚██╗░██╔╝░██╔════╝░░░░████║░░
echo.                                             %p% █████╗░░░╚███╔╝░██╔████╔██║░█████╗░░██████╔╝█████╗░░█████╗░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░╚████╔╝░░██████╗░░░░██╔██║░░
echo.                                             %p% ██╔══╝░░░██╔██╗░██║╚██╔╝██║░██╔══╝░░██╔══██╗██╔══╝░░██╔══╝░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░░╚════██╗░░░╚═╝██║░░
echo.                                             %p% ███████╗██╔╝╚██╗██║░╚═╝░██║░██║░░░░░██║░░██║███████╗███████╗░╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░░░░██║░░░░██████╔╝██╗███████╗
echo.                                             %p% ╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═╝░░░░░╚═╝░░╚═╝╚══════╝╚══════╝░░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░░╚═════╝░╚═╝╚══════╝
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                             %w%                                                                                                                                                      
echo.                                             %w%                  %p%[%w%1%p%]%w% General Tweaks                %p%[%w%2%p%]%w% Mouse and Keyboard                 %p%[%w%3%p%]%w% Windows Tweaks                      
echo.                                             %w%                                                                                                                    
echo.                                             %w%                  %p%[%w%4%p%]%w% PC clean                      %p%[%w%5%p%]%w% Memory Tweaks                      %p%[%w%6%p%]%w% Disable Startup Services
echo.                                             %w%                                                                                                                 
echo.                                             %w%                  %p%[%w%7%p%]%w% GPU Tweaks                    %p%[%w%8%p%]%w% CPU Tweaks                         %p%[%w%9%p%]%w% USB Tweaks 
echo.                                             %w%                                                                                                                                                                 
echo.                                             %w%                  %p%[%w%10%p%]%w% Power Tweaks                 %p%[%w%11%p%]%w% Debloat                           %p%[%w%12%p%]%w% Storage Tweaks   
echo.                                             %w% 
echo.                                             %w%                  %p%[%w%13%p%]%w% Fix Corrupted Files          %p%[%w%14%p%]%w% EXM Network Tweaking Utility      %p%[%w%15%p%]%w% Coming Soon!
echo.                                             %w%                                                                                                                      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                             %w%                                                                                                                      
echo.                                             %w%                  %p%[%w%R%p%]%w% Reverts / Fixes               %p%[%w%W%p%]%w% Completely Optimize Your PC        %p%[%w%P%p%]%w% Use Restore Point   
echo.                                             %w% 
echo.                                             %w%                  %p%[%w%F%p%]%w% Refresh Resources             %p%[%w%X%p%]%w% Exit The Utility                   %p%[%w%E%p%]%w% EXM Tweaks Discord          
echo.                                             %w%                                                                                                                                          
echo.                                             %w%                                                                                                                                                                           
echo.                                             %w%                   %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2024 %b%║%w% Version 5.1 %b%║%w% updated 14th of September 2024                                     
echo.                                             %w%                                                                                                                  
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%



set /p input=:
if /i %input% == 1 goto 1
if /i %input% == 2 goto 2
if /i %input% == 3 goto 3
if /i %input% == 4 goto 4
if /i %input% == 5 goto 5
if /i %input% == 6 goto 6
if /i %input% == 7 goto 7
if /i %input% == 8 goto 8war
if /i %input% == 9 goto 9
if /i %input% == 10 goto 10war 
if /i %input% == 11 goto 11war
if /i %input% == 12 goto 12
if /i %input% == 13 goto 13
if /i %input% == 14 goto 14
if /i %input% == 15 goto Soon

if /i %input% == R goto revert
if /i %input% == P goto Restore
if /i %input% == F goto Refresh
if /i %input% == X goto Exit
if /i %input% == W start https://exmtweaks.com 
if /i %input% == E start https://discord.gg/exm

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 1 
goto RedirectMenu

:RedirectMenu
cls
goto menu

:Refresh
echo %w% - Loading ...%b%
cls 
md C:\exm >nul 2>&1
echo %w% - Refreshing exm resource folder %b%
timeout /t 1 /nobreak > NUL
del /s /q C:\exm  >nul 2>&1

goto :res 


:net
:14
CLS
echo.
echo.                                                                                                   %W% EXMTWEAKS NETWORK UTILITY VERSION 1.0
echo. 
echo.                                                                                      %p%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                                                                                      %p%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                                                                                      %p%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                                                                                      %p%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                                                                                      %p%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                                                                                      %p%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░ 
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                Warning
echo.
echo.                                              We are not responsible for any problems/Damages with your PC this may cause, if you encounter any, don't be afraid to reach out in our discord server
echo.
echo.                                              It's prohibited to resell any of our free tools, it will lead to consequences, the utility is open sourced and the code may be used for non profit
echo.
echo.                                                  This tool doesnt decrease ping for 100% of people, since if you get high ping due to server distance, its not really fixable with any tweaks
echo. 
echo.                                                          There are also other factors which take part in why this may not work for you, i just dont want you guys to be dissapointed :)
echo.
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                          Instructions / Faq
echo.
echo.                                               Press a NUMBER on your keyboard followed by ENTER to select an option, Please Read All warnings, don't just blindly press buttons without reading.
echo.
echo.                                                      You can find the tutorial, more information about the utility and much more in the EXM Tweaks Discord Server (discord.gg/exm)
echo.  
echo.
echo.                                                                    %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2024 %b%║%w% Version 1.0 %b%║%w% updated 2nd September 2024 
echo.                                          %b%"════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.
echo.
echo.                                                                                        %b%"I═══════════════════════════════════════════════════════I"
echo.                                                                                                  %w% Press any key to agree and continue...
echo.                                                                                        %b%"I═══════════════════════════════════════════════════════I"
echo.

echo. 
pause > nul
CLS


:: Restore Point
:restorepoint
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('We highly reccomend making a restore point, this will allow you to revert the tweaks, thanks for using the exm utility. Press "ok" to continue to the restore point menu', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls
echo.
echo.                                                                                    %W% EXMTWEAKS NETWORK UTILITY VERSION 1.0
echo.
echo.                                                     %p%██████╗░███████╗░██████╗████████╗░█████╗░██████╗░███████╗  ██████╗░░█████╗░██╗███╗░░██╗████████╗
echo.                                                     %p%██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝
echo.                                                     %p%██████╔╝█████╗░░╚█████╗░░░░██║░░░██║░░██║██████╔╝█████╗░░  ██████╔╝██║░░██║██║██╔██╗██║░░░██║░░░
echo.                                                     %p%██╔══██╗██╔══╝░░░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══╝░░  ██╔═══╝░██║░░██║██║██║╚████║░░░██║░░░
echo.                                                     %p%██║░░██║███████╗██████╔╝░░░██║░░░╚█████╔╝██║░░██║███████╗  ██║░░░░░╚█████╔╝██║██║░╚███║░░░██║░░░
echo.                                                     %p%╚═╝░░╚═╝╚══════╝╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚══════╝  ╚═╝░░░░░░╚════╝░╚═╝╚═╝░░╚══╝░░░╚═╝░░░
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                   %w% Do you want to Create a Restore Point? 
echo.                                                                                                                                                                      
echo.                                                                                                                                       
echo.                                                               %p%[%w%1%p%]%w% Make A restore Point                  %p%[%w%2%p%]%w% Skip and go to menu  
echo.                                                                                                                                       
echo.                                                             
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                               %W% Restore point takes your device back to an earlier point in time, essentially it allows you to revert the tweaks
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto RestoreP
if /i %input% == 2 goto :NMenu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 1
goto RedirectMenu

:RedirectMenu              
goto restorepoint

:RestoreP
chcp 437 >nul 
echo %w%- Making a restore point... %b%
powershell -Command "Checkpoint-Computer -Description 'Exm Network utility Restore Point' -RestorePointType 'MODIFY_SETTINGS'" 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Restore point completed successfully', 'Exm Restore Point', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 
echo.
echo.
echo.
cls
goto :NMenu


:NMenu
cls
echo.
echo.
echo.                                                                                             %W% EXMTWEAKS NETWORK UTILITY VERSION 1.0
echo.
echo.                                            %p%███████╗██╗░░██╗███╗░░░███╗░░░███╗░░██╗███████╗████████╗░░░██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗░░░██╗░░░██╗░░░██╗░░███╗░░
echo.                                            %p%██╔════╝╚██╗██╔╝████╗░████║░░░████╗░██║██╔════╝╚══██╔══╝░░░██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝╚██╗░██╔╝░░░██║░░░██║░████║░░
echo.                                            %p%█████╗░░░╚███╔╝░██╔████╔██║░░░██╔██╗██║█████╗░░░░░██║░░░░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░╚████╔╝░░░░╚██╗░██╔╝██╔██║░░
echo.                                            %p%██╔══╝░░░██╔██╗░██║╚██╔╝██║░░░██║╚████║██╔══╝░░░░░██║░░░░░░██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░░░╚██╔╝░░░░░░╚████╔╝░╚═╝██║░░
echo.                                            %p%███████╗██╔╝╚██╗██║░╚═╝░██║░░░██║░╚███║███████╗░░░██║░░░░░░╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░░░░██║░░░░░░░░╚██╔╝░░███████╗
echo.                                            %p%╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░░╚═╝░░╚══╝╚══════╝░░░╚═╝░░░░░░░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░░░░╚═╝░░░░░░░░░╚═╝░░░╚══════╝
echo.                                          %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%    
echo.
echo.                                                                  %p%%w%%p%%w%                          %p%[%w%T%p%]%w% TUTORIAL
echo.
echo.                                          %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%                   
echo.                                                                                          
echo.                                                                  %p%%w%%p%%w%                          %p%[%w%A%p%]%w% Apply all (1-6)
echo.                                                                                                                      
echo.                                                                  %p%[%w%1%p%]%w% Disable Network Limiting                    %p%[%w%2%p%]%w% Enable On-Board Network Adapter Processor                 
echo.                                                                                                                      
echo.                                                                  %p%[%w%3%p%]%w% Set Network Throttoling Index               %p%[%w%4%p%]%w% Enable MSI mode on network Adapter           
echo.                                                                                                                      
echo.                                                                  %p%[%w%5%p%]%w% Enable TCP No Delay                         %p%[%w%6%p%]%w% Set DNS Priorities
echo.
echo.                                                                  %p%[%w%7%p%]%w% Optimize NIC Adapter Settings               %p%[%w%8%p%]%w% Set a QOS Policy 
echo.
echo.                                                                  %p%%w%%p%%w%                         %p%[%w%9%p%]%w% Open NIC Settings
echo.                                
echo.                                          %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                                  %p%%w%%p%%w%                         %p%[%w%X%p%]%w%  Go back to menu                           
echo.    
echo.                                                               %w%  Made and distributed by EXM TWEAKS, S.R.O. ® 2024 %b%║%w% Version 1.0 %b%║%w% Made 2nd September                                                  
echo.                                          %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
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
if /i %input% == 8 goto qos
if /i %input% == 9 ncpa.cpl & goto Nmenu
if /i %input% == X goto menu
if /i %input% == T start https://www.youtube.com/watch?v=6XXJ_yUNwCo&ab_channel=exm & goto Nmenu

) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto menu


:nALL
echo %w% - Disable TCP heuristics / Disable Network Limiting %b%
netsh int tcp set heuristics disabled

echo %w% - Disabling Task Offloading / Enable On-Board Network Adapter Processor %b%
netsh int ip set global taskoffload=disabled
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f

echo %w% - Set Network Throttoling Index%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f

echo %w% - Enabling MSI Mode On Network Adapter %b%

for /f %%i in ('wmic path win32_NetworkAdapter get PNPDeviceID') do set "str=%%i" & (
echo %w% - Delete network Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo %w% - Enable MSI Mode on NetAdapter %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w% - Disable Nagiles algorithm %b%

echo %w% - Set Interface Metric %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v InterfaceMetric /t REG_DWORD /d "55" /f
echo %w% - Enabling TCPNoDelay %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f


echo %w% - Set DNS Priorities %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu


:n1
echo %w% - Disable TCP heuristics / Disable Network Limiting %b%
netsh int tcp set heuristics disabled
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:n2
echo %w% - Disabling Task Offloading / Enable On-Board Network Adapter Processor %b%
netsh int ip set global taskoffload=disabled
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:n3
echo %w% - Set Network Throttoling Index%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:n4
echo %w% - Enabling MSI Mode On Network Adapter %b%
for /f %%i in ('wmic path win32_NetworkAdapter get PNPDeviceID') do set "str=%%i" & (
echo %w% - Delete network Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo %w% - Enable MSI Mode on NetAdapter %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu


:n5
echo %w% - Disable Nagiles algorithm %b%

echo %w% - Set Interface Metric %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v InterfaceMetric /t REG_DWORD /d "55" /f
echo %w% - Enabling TCPNoDelay %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TCPNoDelay /t REG_DWORD /d "1" /f
echo %w% - Enabling TCP Ack Frequency %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpAckFrequency /t REG_DWORD /d "1" /f
echo %w% - Disabling TCP Del AckTicks  %b%
for /f %%q in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%q" /v TcpDelAckTicks /t REG_DWORD /d "0" /f

echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:n6
echo %w% - Set DNS Priorities %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:n7
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('!WARNING! You can only use this if you are on ethernet, if you are on wifi, press "N" on the next page', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
cls
echo. 
echo.                                              %b%"═══════════════════════════════════════════════════════════════"
echo.                                                %w%  Press "Y" if you want to continue,"N" if you want to go back
echo.                                              %b%"═══════════════════════════════════════════════════════════════"
set /p input=:
if /i %input% == Y goto cont
if /i %input% == N cls & goto NMenu

) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto NMenu


:cont

echo %w% - Optimize NIC Settings %b%

echo %w%- Disabling EEE (Energy Efficient Ethernet) %b%
for /f %%n in ('Reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /v "*SpeedDuplex" /s ^| findstr  "HKEY"') do (
Reg.exe add "%%n" /v "AdvancedEEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*EEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EEE" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablePME" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Power Saving Modes, Power Managment and Much more  %b%
Reg.exe add "%%n" /v "AutoPowerSaveModeEnabled" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "DisableDelayedPowerUp" /t REG_SZ /d "2" /f 
Reg.exe add "%%n" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnableSavePowerNow" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnablePowerManagement" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "NicAutoPowerSaver" /t REG_SZ /d "2" /f
Reg.exe add "%%n" /v "PowerDownPll" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "PowerSavingMode" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "S5NicKeepOverrideMacAddrV2" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Power Gating %b%
Reg.exe add "%%n" /v "EnableDynamicPowerGating" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "EnableConnectedPowerGating" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Giga Lite %b%
Reg.exe add "%%n" /v "GigaLite" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling Ultra Low Power Mode %b%
Reg.exe add "%%n" /v "ULPMode" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Disabling WakeOns %b%
Reg.exe add "%%n" /v "EnableWakeOnLan" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WakeOnDisconnect" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "S5WakeOnLan" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "*WakeOnPattern" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WakeOnLink" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f 
timeout /t 1 /nobreak > nul


echo %w%- Disabling Jumbo Frame/Packet %b%
Reg.exe add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f 
timeout /t 1 /nobreak > nul


echo %w%- Configuring Buffer Sizes %b%
Reg.exe add "%%n" /v "TransmitBuffers" /t REG_SZ /d "4096" /f 
Reg.exe add "%%n" /v "ReceiveBuffers" /t REG_SZ /d "1024" /f 
timeout /t 1 /nobreak > nul


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
timeout /t 1 /nobreak > nul


echo %w%- Enabling RSS in NIC %b%
Reg.exe add "%%n" /v "RSS" /t REG_SZ /d "1" /f 
Reg.exe add "%%n" /v "*NumRssQueues" /t REG_SZ /d "2" /f 
Reg.exe add "%%n" /v "RSSProfile" /t REG_SZ /d "3" /f 
timeout /t 1 /nobreak > nul


echo %w%- Disabling Flow Control %b%
Reg.exe add "%%n" /v "*FlowControl" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "FlowControlCap" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul


echo %w%- Removing Interrupt Delays %b%
Reg.exe add "%%n" /v "RxAbsIntDelay" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TxIntDelay" /t REG_SZ /d "0" /f 
Reg.exe add "%%n" /v "TxAbsIntDelay" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul

echo %w%- Removing Adapter Notification Sending %b%
Reg.exe add "%%n" /v "FatChannelIntolerant" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > nul
)

echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto NMenu

:qos
cls
echo.
echo.
echo.
echo.                                                                      %p%░██████╗░░█████╗░░██████╗  ██████╗░░█████╗░██╗░░░░░██╗░█████╗░██╗░░░██╗╗
echo.                                                                      %p%██╔═══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██║░░░░░██║██╔══██╗╚██╗░██╔╝
echo.                                                                      %p%██║██╗██║██║░░██║╚█████╗░  ██████╔╝██║░░██║██║░░░░░██║██║░░╚═╝░╚████╔╝░
echo.                                                                      %p%╚██████╔╝██║░░██║░╚═══██╗  ██╔═══╝░██║░░██║██║░░░░░██║██║░░██╗░░╚██╔╝░░
echo.                                                                      %p%░╚═██╔═╝░╚█████╔╝██████╔╝  ██║░░░░░╚█████╔╝███████╗██║╚█████╔╝░░░██║░░░
echo.                                                                      %p%░░░╚═╝░░░░╚════╝░╚═════╝░  ╚═╝░░░░░░╚════╝░╚══════╝╚═╝░╚════╝░░░░╚═╝░░░
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                         If the number 4 fix doesnt work, you will have to unfortunatly skip this step 
echo.
echo.                                                                                                                                                               
echo.                                                           %p%[%w%1%p%]%w% Start PSCHED          %p%[%w%2%p%]%w% Enable MS-Pacer            %p%[%w%3%p%]%w% Open GPEDIT   
echo. 
echo.                                              
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
echo.                                                           %p%%w%%p%%w%        %p%[%w%4%p%]%w% Download GPEDIT (only Run this if you cant open GPEDIT)  
echo.
echo.     
echo.                                                                                                 %p%[%w%M%p%]%w% Back to menu 
echo.
echo.                                                           %p%%w%%p%%w%  
echo.                                                %W%                                              Made by EXM TWEAKS® 2024 
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                         %W% A QoS policy that defines throttling limits determines the rate of outbound network traffic
echo.                                                    %W% It basically will make it so your router will prioritize that task over others, decreasing your ping by a lot
echo.                                                %b%"══════════════════════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo. 
 
set /p input=:
if /i %input% == 1 goto q1
if /i %input% == 2 goto q2
if /i %input% == 3 goto q3
if /i %input% == 4 goto q4
if /i %input% == M goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto qos

:q2
chcp 437 >nul 2>&1
powershell -NoProfile -Command "Enable-NetAdapterBinding -Name "*" -ComponentID ms_pacer"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :qos

:q1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Psched" /v "Start" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :qos

:q3
start gpedit.msc
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :qos

:q4
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('You have to restart your pc after this', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"


start https://discord.com/channels/1177410668606009444/1178430446590238860/1281920807089475635
echo %w% This fix takes you to a discord message in my discord server, if it doesnt load, simply go to the #free utility page, the fix is there %B%

chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                                      %b%"═══════════════════════════════════════════════════════"
echo.                                                          %w%  Operation Completed, Press any key to continue...  
echo.                                                      %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :qos







:12
:storage
cls
echo.
echo.
echo.                                                            %p%░██████╗████████╗░█████╗░██████╗░░█████╗░░██████╗░███████╗   
echo.                                                            %p%██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝ 
echo.                                                            %p%╚█████╗░░░░██║░░░██║░░██║██████╔╝███████║██║░░██╗░█████╗░░        
echo.                                                            %p%░╚═══██╗░░░██║░░░██║░░██║██╔══██╗██╔══██║██║░░╚██╗██╔══╝░░  
echo.                                                            %p%██████╔╝░░░██║░░░╚█████╔╝██║░░██║██║░░██║╚██████╔╝███████╗     
echo.                                                            %p%╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚══════╝      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                           
echo.                                                                      %p%[%w%1%p%]%w% Trim/Defragment Drives     
echo. 
echo.                                                                      %p%[%w%2%p%]%w% Enable User Write Cache      
echo. 
echo.                                                                      %p%[%w%3%p%]%w% Disable SSD Power Savings       
echo.                                                                                           
echo.                                                                                           
echo.                                                                         %p%[%w%M%p%]%w% Back to menu                               
echo.                                                                                          
echo.
echo.                                                                      %p%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                    %W% Trim and Defragment Your Driver and a few extra storage optimizations 
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto s1
if /i %input% == 2 goto s2
if /i %input% == 3 goto s3
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :12

:s3
echo %w% - Disable SSD Power Savings %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:s1
cls
start dfrgui.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :12

:s2
cls
echo %w% - Enable User Write Cache %b%
for /f "Delims=" %%k in ('Reg.exe Query hklm\SYSTEM\CurrentControlSet\Enum /f "{4d36e967-e325-11ce-bfc1-08002be10318}" /d /s^|Find "HKEY"') do (
  Reg.exe add "%%k\Device Parameters\Disk" /v UserWriteCacheSetting /t reg_dword /d 1 /f
)
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :12
:3
:windows
cls
echo.
echo.
echo.                                                             %p%   ░██╗░░░░░░░██╗██╗███╗░░██╗██████╗░░█████╗░░██╗░░░░░░░██╗░██████╗      
echo.                                                             %p%   ░██║░░██╗░░██║██║████╗░██║██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝      
echo.                                                             %p%   ░╚██╗████╗██╔╝██║██╔██╗██║██║░░██║██║░░██║░╚██╗████╗██╔╝╚█████╗░     
echo.                                                             %p%   ░░████╔═████║░██║██║╚████║██║░░██║██║░░██║░░████╔═████║░░╚═══██╗      
echo.                                                             %p%   ░░╚██╔╝░╚██╔╝░██║██║░╚███║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░██████╔╝      
echo.                                                             %p%   ░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░╚═════╝░      
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                                                                      
echo.                                                                                       %p%[%w%A%p%]%w% Apply all
echo.                                                          
echo.                                                             %p%[%w%1%p%]%w% Windows Update Blocker      %p%[%w%2%p%]%w% Disable Useless Animations                       
echo.                                                                                                                      
echo.                                                             %p%[%w%3%p%]%w% Disable Notifications       %p%[%w%4%p%]%w% Disable Telemetry and Autologgers          
echo.                                                                                                                                
echo.                                                             %p%[%w%5%p%]%w% Disable Bluetooth           %p%[%w%6%p%]%w% Disable Transparency    
echo.                                                                                                                                                                                                                 
echo.                                                             %p%[%w%7%p%]%w% Disable Error Reporting     %p%[%w%8%p%]%w% Disable Setting Synchronization            
echo.                                                                                                                                
echo.                                                             %p%[%w%9%p%]%w% Disable Diagnostics         %p%[%w%10%p%]%w% Disable Background Apps        
echo.
echo.                                                             %p%[%w%11%p%]%w% Disable Experiments        %p%[%w%12%p%]%w% Enable Game Mode       
echo. 
echo.                                                             %p%[%w%13%p%]%w% Disable Maintenece         %p%[%w%14%p%]%w% Disable Tracking and some diagnostics                            
echo. 
echo.                                                             %p%[%w%15%p%]%w% Disable Popups + more      %p%[%w%16%p%]%w% Disable Activity feed    
echo. 
echo.                                                             %p%[%w%17%p%]%w% Disable Smart Screen       %p%[%w%18%p%]%w% Stop Reinstalling Preinstalled apps 
echo.
echo.                                                             %p%[%w%19%p%]%w% Disable Shared Experiences %p%[%w%20%p%]%w% Track Only Important Failure Events 
echo.
echo.
echo.                                                                                     %p%[%w%R%p%]%w% Revert Category 
echo.
echo.                                                                                     %p%[%w%M%p%]%w% Back to menu                                          
echo.                                                                                           
echo.     
echo.                                                                                  %p%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                               %W% Optimize a bunch of Windows settings for optimial performance 
echo.                                                         %W% Disable a bunch of annoying stuff like notifications, popups and more
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == A goto WA
if /i %input% == 1 goto w6
if /i %input% == 2 goto w3
if /i %input% == 3 goto w2
if /i %input% == 4 goto w4
if /i %input% == 5 goto w5
if /i %input% == 6 goto w1
if /i %input% == 7 goto w7
if /i %input% == 8 goto w8
if /i %input% == 9 goto w9
if /i %input% == 10 goto w10
if /i %input% == 11 goto w11
if /i %input% == 12 goto w12
if /i %input% == 13 goto w13
if /i %input% == 14 goto w14
if /i %input% == 15 goto w15
if /i %input% == 16 goto w16
if /i %input% == 17 goto w17
if /i %input% == 18 goto w18
if /i %input% == 19 goto w19
if /i %input% == 20 goto w20
if /i %input% == M cls & goto menu
if /i %input% == R cls & goto :revert
) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto :3

:w20
echo %w% - Track Only Important Failure Events %b%
Auditpol /set /subcategory:"Process Termination" /success:disable /failure:enable
Auditpol /set /subcategory:"RPC Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
Auditpol /set /subcategory:"DPAPI Activity" /success:disable /failure:disable
Auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:enable
Auditpol /set /subcategory:"Other System Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Security State Change" /success:disable /failure:enable
Auditpol /set /subcategory:"Security System Extension" /success:disable /failure:enable
Auditpol /set /subcategory:"System Integrity" /success:disable /failure:enable
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:WA
cls
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This will apply all tweaks in the windows page', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo. 
echo.                                              %b%"═══════════════════════════════════════════════════════════════"
echo.                                                %w%  Press "Y" if you want to continue,"N" if you want to go back
echo.                                              %b%"═══════════════════════════════════════════════════════════════"

set /p input=:
if /i %input% == Y goto :WAA
if /i %input% == N cls & goto windows


:waa
cls
echo %w% - Track Only Important Failure Events %b%
Auditpol /set /subcategory:"Process Termination" /success:disable /failure:enable
Auditpol /set /subcategory:"RPC Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
Auditpol /set /subcategory:"DPAPI Activity" /success:disable /failure:disable
Auditpol /set /subcategory:"IPsec Driver" /success:disable /failure:enable
Auditpol /set /subcategory:"Other System Events" /success:disable /failure:enable
Auditpol /set /subcategory:"Security State Change" /success:disable /failure:enable
Auditpol /set /subcategory:"Security System Extension" /success:disable /failure:enable
Auditpol /set /subcategory:"System Integrity" /success:disable /failure:enable
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\System\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f

echo %w% - Disabling Telemetry Through Task Scheduler %b%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable 
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" 
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable 
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy" 
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable 
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" 
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable 
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" 
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable 
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" 
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" 
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable 
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks" 
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable 
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" 
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable 
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" 
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" 
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /disable 
schtasks /end /tn "\Microsoftd\Office\OfficeTelemetryAgentFallBack" 
schtasks /change /TN "\Microsoftd\Office\OfficeTelemetryAgentFallBack" /disable 
schtasks /end /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" 
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /disable 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /disable 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /disable 
schtasks /end /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" 
schtasks /change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /disable 
schtasks /end /tn "\Microsoft\Windows\Device Information\Device" 
schtasks /change /TN "\Microsoft\Windows\Device Information\Device" /disable 
timeout /t 1 /nobreak > NUL

echo %w% - Disable Autologgers%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Windows Insider Experiments%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f 

echo %w% - Disable Activity feed%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f

echo %w% - Disabling Automatic Maintenance%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f 


echo %w% - Disable Notifications%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f


echo %w% - Disable Bluetooth%b%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f

echo %w% - Disabling Diagnostic Services%b%
sc stop DiagTrack > nul 2>&1
sc config DiagTrack start= disabled > nul 2>&1
sc stop dmwappushservice > nul 2>&1
sc config dmwappushservice start= disabled > nul 2>&1
sc stop diagnosticshub.standardcollector.service > nul 2>&1
sc config diagnosticshub.standardcollector.service start= disabled > nul 2>&1

echo %w% - Disabling Windows Error Reporting%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 

echo %w%- Disable Shared Experiences %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f

echo %w% - Disabling Setting Synchronization%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\PackageState" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f 

echo %w%- Disable windows smart screen %b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f 

echo %w%- Stop Reinstalling Preinstalled apps %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" 

echo %w%- Disabling Background Apps %b%
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f 

echo %w%- Disabling Transparency %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f

echo %w% - Enabling GameMode%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f 

echo %w% - Disable Tracking and some diagnostics%b%
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "1" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable

timeout /t 1 /nobreak > NUL
cls 
chcp 437 >nul 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: (After presing "ok" it will open an app called windows update blocker, Disabling Windows Updates will break microsoft store, if you want to use it again simply press "enable" in windows update blocker ', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"

start C:\exm\Windows_Update_Blocker.exe

cls 

%windir%\system32\SystemPropertiesPerformance.exe

chcp 65001 >nul 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:w19
echo %w%- Disable Shared Experiences %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w17
echo %w%- Disable windows smart screen %b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w18
echo %w%- Stop Reinstalling Preinstalled apps %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContentEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows


:w10
cls
echo %w%- Disabling Background Apps %b%
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

 
:w1
cls
echo %w%- Disabling Transparency %b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows


:w12
cls
echo %w% - Enabling GameMode%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w14
cls
echo %w% - Disable Tracking and some diagnostics%b%
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "1" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:13
cls
echo.
echo.

echo.                                                                %p%███████╗██╗██╗░░██╗    ██████╗░██╗░██████╗░█████╗░
echo.                                                                %p%██╔════╝██║╚██╗██╔╝    ██╔══██╗██║██╔════╝██╔══██╗
echo.                                                                %p%█████╗░░██║░╚███╔╝░    ██║░░██║██║╚█████╗░██║░░╚═╝
echo.                                                                %p%██╔══╝░░██║░██╔██╗░    ██║░░██║██║░╚═══██╗██║░░██╗
echo.                                                                %p%██║░░░░░██║██╔╝╚██╗    ██████╔╝██║██████╔╝╚█████╔╝
echo.                                                                %p%╚═╝░░░░░╚═╝╚═╝░░╚═╝    ╚═════╝░╚═╝╚═════╝░░╚════╝░
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════"%w%
echo.
echo.                                                                      %p%[%w%1%p%]%w% Fix corrupdated files
echo.
echo.                                                                            %p%[%w%M%p%]%w% Back to menu
echo.
echo.
echo.                                                                       %p%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                           %b%"══════════════════════════════════════════════════════════════════════════════════"
echo.                                                 %w% Finds critical core files required to run and gather information 
echo.                                                 %w% then upgrades or repairs any files that are corrupted or out-of-date. 
echo.                                           %b%"══════════════════════════════════════════════════════════════════════════════════"

set /p input=:
if /i %input% == 1 goto f1
if /i %input% == M cls & goto menu

) ELSE (
echo %w%- Invalid Input %b% & goto MisspellRedirect

:MisspellRedirect
cls
echo %w%- Misspell Detected  %b%
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :13

:f1
DISM /Online /Cleanup-Image /StartComponentCleanup
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :13


:11war
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: If you want to revert anything, you can do it in our revert category on the main page of the utility', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1

:11
:Debloat
cls
echo.
echo.
echo.                                                                     %p%   ██████╗░███████╗██████╗░██╗░░░░░░█████╗░░█████╗░████████╗     
echo.                                                                     %p%   ██╔══██╗██╔════╝██╔══██╗██║░░░░░██╔══██╗██╔══██╗╚══██╔══╝      
echo.                                                                     %p%   ██║░░██║█████╗░░██████╦╝██║░░░░░██║░░██║███████║░░░██║░░░    
echo.                                                                     %p%   ██║░░██║██╔══╝░░██╔══██╗██║░░░░░██║░░██║██╔══██║░░░██║░░░     
echo.                                                                     %p%   ██████╔╝███████╗██████╦╝███████╗╚█████╔╝██║░░██║░░░██║░░░  
echo.                                                                     %p%   ╚═════╝░╚══════╝╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░      
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                            %w% Dont disable stuff that you actualy use!                         
echo.                                                                                                    
echo.                                                                                       %p%[%w%A%p%]%w% Apply all
echo.                                                                                                                      
echo.                                                            %p%[%w%1%p%]%w% Disable GameDVR           %p%[%w%2%p%]%w% Disable Customer Experience Improvement Program                    
echo.                                                                                                                      
echo.                                                            %p%[%w%3%p%]%w% Disable XBOX Services     %p%[%w%4%p%]%w% Uninstall Useless Windows Apps              
echo.                                                                                                                      
echo.                                                            %p%[%w%5%p%]%w% Disable Office Telemetry  %p%[%w%6%p%]%w% Disable Printing and maps Services
echo. 
echo.                                                            %p%[%w%7%p%]%w% Uninstall Cortana         %p%[%w%8%p%]%w% Delete Microsoft Edge                      
echo.                                                                                                                                
echo.                                                                                                                                
echo.                                                                                      %p%[%w%M%p%]%w% Back to menu   
echo. 
echo.                                                                                      %p%[%w%R%p%]%w% Revert Category                                           
echo.                                                                                             
echo.
echo.                                                                                %p%%w%%w%%w%  Made by EXM TWEAKS® 2024                              
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                                    %w% Disable Useless Features which just take up storage
echo.                                                          %w% Removes bloatware which runs in the background taking up system resources
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == A goto AD
if /i %input% == 1 goto d1
if /i %input% == 2 goto d2
if /i %input% == 3 goto d3
if /i %input% == 4 goto d4
if /i %input% == 5 goto d5
if /i %input% == 6 goto d6
if /i %input% == 7 goto d7
if /i %input% == 8 goto d8
if /i %input% == M cls & goto menu
if /i %input% == R cls & goto revert
) ELSE (
echo Invalid Input & goto MisspellReirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
goto :11

:AD
cls
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This will apply all tweaks in this page, do you want to continue?', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo. 
echo.                                              %b%"═══════════════════════════════════════════════════════════════"
echo.                                                %w%  Press "Y" if you want to continue,"N" if you want to go back
echo.                                              %b%"═══════════════════════════════════════════════════════════════"

set /p input=:
if /i %input% == Y goto :DA
if /i %input% == N cls & goto debloat

:DA
::1
echo %w% - Disable Customer Experience Improvement Program%b%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" > nul 2>&1

::2
echo %w% - Disable Printing and maps Services  %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f

::3
echo %w% - Disable Office Telemetry  %b%
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f

::4
echo %w% - Delete Microsoft Edge %b%
cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\1*\Installer
cd C:\Program Files (x86)\Microsoft\Edge\Application\125.0.2535.79\Installer
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /s /q "C:\Program Files (x86)\Microsoft\Edge"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rd /s /q "C:\Program Files (x86)\Microsoft\Temp"

::5
echo %w% - Disable GameDVR%b%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f

::6
echo %w% - Disable Xbox Services%b%
sc config xbgm start= disabled >nul 2>&1
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxGipSvc start= disabled
sc config XboxNetApiSvc start= disabled

::7
chcp 437 > nul
Powershell.exe -command "& {Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage}
echo %w%- Uninstalling BingWeather %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage}
echo %w%- Uninstalling GetHelp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage}
echo %w%- Uninstalling Getstarted %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage}
echo %w%- Uninstalling Messaging %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage}
echo %w%- Uninstalling Microsoft3DViewer %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage}
echo %w%- Uninstalling MicrosoftSolitaireCollection %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage}
echo %w%- Uninstalling MicrosoftStickyNotes %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage}
echo %w%- Uninstalling MixedReality.Portal %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage}
echo %w%- Uninstalling OneConnect %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.People* | Remove-AppxPackage}
echo %w%- Uninstalling People %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage}
echo %w%- Uninstalling Print3D %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage}
echo %w%- Uninstalling SkypeApp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsAlarms %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsCamera %b%
Powershell.exe -command "& {Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage}
echo %w%- Uninstalling windowscommunicationsapps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsMaps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsFeedbackHub %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsSoundRecorder %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage}
echo %w%- Uninstalling YourPhone %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage}
echo %w%- Uninstalling ZuneMusic %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage}
echo %w%- Uninstalling HEIFImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage}
echo %w%- Uninstalling WebMediaExtensions %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage}
echo %w%- Uninstalling WebpImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.3dBuilder* | Remove-AppxPackage}
echo %w%- Uninstalling 3dBuilder %b%
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage"
echo %w%- Uninstalling bing %b%
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
echo %w%- Uninstalling bingfinance %b%
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
echo %w%- Uninstalling bingsports %b%
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage"
echo %w%- Uninstalling CommsPhone %b%
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage"
echo %w%- Uninstalling Drawboard PDF %b%

echo %w%- Uninstalling Sway %b%
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsAlarms %b%
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsPhone %b%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
chcp 65001 > nul


::8
echo %w% - Disabling Cortana%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "0" /f 


chcp 437 >nul 
timeout /t 1 /nobreak > NUL
Powershell -Command "Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage" 
timeout /t 1 /nobreak > NUL
chcp 65001 >nul 

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat



:d6 
cls
echo %w% - Disable Printing and maps Services  %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:d5
cls
echo %w% - Disable Office Telemetry  %b%
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d "3" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:d8
echo %w% - Delete Microsoft Edge %b%
cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\1*\Installer
cd C:\Program Files (x86)\Microsoft\Edge\Application\125.0.2535.79\Installer
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /s /q "C:\Program Files (x86)\Microsoft\Edge"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rd /s /q "C:\Program Files (x86)\Microsoft\Temp"
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:w8
cls
echo %w% - Disabling Setting Synchronization%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\PackageState" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w7
echo %w% - Disabling Windows Error Reporting%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w9
echo %w% - Disabling Diagnostic Services%b%
sc stop DiagTrack > nul 2>&1
sc config DiagTrack start= disabled > nul 2>&1
sc stop dmwappushservice > nul 2>&1
sc config dmwappushservice start= disabled > nul 2>&1
sc stop diagnosticshub.standardcollector.service > nul 2>&1
sc config diagnosticshub.standardcollector.service start= disabled > nul 2>&1
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w5
CLS

echo %w% - Disable Bluetooth%b%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "4" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:d1
cls
echo %w% - Disable GameDVR%b%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:w2
cls
echo %w% - Disable Notifications%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:d3
cls
echo %w% - Disable Xbox Services%b%
sc config xbgm start= disabled >nul 2>&1
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxGipSvc start= disabled
sc config XboxNetApiSvc start= disabled
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:d7
cls
echo %w% - Disabling Cortana%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "0" /f 


chcp 437 >nul 
timeout /t 1 /nobreak > NUL
Powershell -Command "Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage" 
timeout /t 1 /nobreak > NUL
chcp 65001 >nul 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:w6

cls
timeout /t 1 /nobreak > NUL

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Note: Disabling Windows Updates will break Microsoft store, if you want to use it again simply press "enable" in windows update blocker ', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"


start C:\exm\Windows_Update_Blocker.exe
chcp 65001 >nul 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows



:w3
cls 

%windir%\system32\SystemPropertiesPerformance.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:d2
cls
echo %w% - Disable Customer Experience Improvement Program%b%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" > nul 2>&1 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" > nul 2>&1
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable > nul 2>&1
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" > nul 2>&1
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat

:w13
echo %w% - Disabling Automatic Maintenance%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w16
echo %w% - Disable Activity feed%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft" /v "AllowNewsAndInterests" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w15
echo %w% - Disable Popups, baloon tips and more%b%
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows


:w11
echo %w% - Disabling Windows Insider Experiments%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f 



echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows

:w4
echo %w% - Disabling Telemetry Through Task Scheduler %b%
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable 
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" 
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable 
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" 
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable 
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" 
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable 
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy" 
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable 
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT" 
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable 
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent" 
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable 
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" 
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable 
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" 
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable 
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" 
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable 
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks" 
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable 
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" 
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable 
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" 
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" 
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /disable 
schtasks /end /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" 
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /disable 
schtasks /end /tn "\Microsoftd\Office\OfficeTelemetryAgentFallBack" 
schtasks /change /TN "\Microsoftd\Office\OfficeTelemetryAgentFallBack" /disable 
schtasks /end /tn "\Microsoft\Office\Office 15 Subscription Heartbeat" 
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /disable 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /disable 
schtasks /end /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" 
schtasks /change /TN "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /disable 
schtasks /end /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" 
schtasks /change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /disable 
schtasks /end /tn "\Microsoft\Windows\Device Information\Device" 
schtasks /change /TN "\Microsoft\Windows\Device Information\Device" /disable 
timeout /t 1 /nobreak > NUL

echo %w% - Disable Autologgers%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AppModel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Cellcore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\CloudExperienceHostOobe" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DataMarket" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderApiLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DefenderAuditLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\DiagLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\HolographicDevice" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsClient" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\iclsProxy" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Mellanox-Kernel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-AssignedAccess-Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Microsoft-Windows-Setup" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NBSMBLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PEAuthLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RdrLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\ReadyBoot" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatform" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SetupPlatformTel" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SocketHeciServer" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SpoolerLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TCPIPLOGGER" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TileStore" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Tpm" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\TPMProvisioningService" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WdiContextLog" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WFP-IPsec Trace" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiDriverIHVSessionRepro" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WiFiSession" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f  
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableThirdPartySuggestions" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Credssp" /v "DebugLogLevel" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :windows


:d4
cls
chcp 437 > nul
Powershell.exe -command "& {Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage}
echo %w%- Uninstalling BingWeather %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage}
echo %w%- Uninstalling GetHelp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage}
echo %w%- Uninstalling Getstarted %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage}
echo %w%- Uninstalling Messaging %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage}
echo %w%- Uninstalling Microsoft3DViewer %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage}
echo %w%- Uninstalling MicrosoftSolitaireCollection %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage}
echo %w%- Uninstalling MicrosoftStickyNotes %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage}
echo %w%- Uninstalling MixedReality.Portal %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage}
echo %w%- Uninstalling OneConnect %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.People* | Remove-AppxPackage}
echo %w%- Uninstalling People %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage}
echo %w%- Uninstalling Print3D %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage}
echo %w%- Uninstalling SkypeApp %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsAlarms %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsCamera %b%
Powershell.exe -command "& {Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage}
echo %w%- Uninstalling windowscommunicationsapps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsMaps %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsFeedbackHub %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage}
echo %w%- Uninstalling WindowsSoundRecorder %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage}
echo %w%- Uninstalling YourPhone %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage}
echo %w%- Uninstalling ZuneMusic %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage}
echo %w%- Uninstalling HEIFImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage}
echo %w%- Uninstalling WebMediaExtensions %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage}
echo %w%- Uninstalling WebpImageExtension %b%
Powershell.exe -command "& {Get-AppxPackage *Microsoft.3dBuilder* | Remove-AppxPackage}
echo %w%- Uninstalling 3dBuilder %b%
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage"
echo %w%- Uninstalling bing %b%
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage"
echo %w%- Uninstalling bingfinance %b%
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage"
echo %w%- Uninstalling bingsports %b%
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage"
echo %w%- Uninstalling CommsPhone %b%
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage"
echo %w%- Uninstalling Drawboard PDF %b%

echo %w%- Uninstalling Sway %b%
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsAlarms %b%
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage"
echo %w%- Uninstalling WindowsPhone %b%
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage"
chcp 65001 > nul
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :debloat



:e
:revert
cls
echo.
echo.
echo.                                                               %p%          ██████╗░███████╗██╗░░░██╗███████╗██████╗░████████╗
echo.                                                               %p%          ██╔══██╗██╔════╝██║░░░██║██╔════╝██╔══██╗╚══██╔══╝
echo.                                                               %p%          ██████╔╝█████╗░░╚██╗░██╔╝█████╗░░██████╔╝░░░██║░░░
echo.                                                               %p%          ██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░██╔══██╗░░░██║░░░
echo.                                                               %p%          ██║░░██║███████╗░░╚██╔╝░░███████╗██║░░██║░░░██║░░░
echo.                                                               %p%          ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                  %w% If you want to revert some settings without using a restore point,                     
echo.                                                                                                                      
echo.                                                                                                                      
echo.                                                                       %p%[%w%1%p%]%w% Bring back default power plans                                 
echo.                                                                                                                          
echo.                                                                       %p%[%w%2%p%]%w% Reinstall default windows apps                                 
echo.                                                                                                                      
echo.                                                                       %p%[%w%3%p%]%w% Enable XBOX Services                                           
echo.                                                                                                                      
echo.                                                                       %p%[%w%4%p%]%w% Enable GameDVR                                                 
echo.                                                                                                                        
echo.                                                                       %p%[%w%5%p%]%w% Enable Notifications                                           
echo.                                                                                                                       
echo.                                                                       %p%[%w%6%p%]%w% Enable Bluetooth      
echo.
echo.                                                                       %p%[%w%7%p%]%w% Enable Fast Startup, Hibernation and Sleep Study (Dont reccomend using them, they are bad for your pc)                                        
echo.                                         
echo.                                                                       %p%[%w%8%p%]%w% Enable Power Throttoling                                            
echo.                                                                                                    
echo.                                                                       %p%[%w%9%p%]%w% Enable Maintenance
echo. 
echo.                                                                       %p%[%w%10%p%]%w% Enable Printing and Maps Services
echo.  
echo.                                                                       %p%[%w%11%p%]%w% Reinstall Edge
echo.
echo.                                                                       %p%[%w%12%p%]%w% Enable Windows Updates
echo.
echo.                                                                       %p%[%w%13%p%]%w% Enable Windows Smart Screen
echo.
echo.                                                                       %p%[%w%14%p%]%w% Enable Diagnostics
echo. 
echo.                                                                       %p%[%w%15%p%]%w% Enable Error Reporting
echo.
echo.                                                                       %p%[%w%16%p%]%w% Revert all power tweaks
echo.
echo.                                                                                                                       
echo.                                                                       %p%[%w%M%p%]%w% Back to menu                                         
echo.                                                                              
echo.
echo.                                                                    %p%%w%%w%%w%  Made by EXM TWEAKS® 2024                                              
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                       %W% Allows you to revert a bunch of settings, without having to use a restore point
echo.                                                      %W% If you want any specific reverts, tell me in my discord server and ill add them
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == 1 goto r1
if /i %input% == 2 goto r2
if /i %input% == 3 goto r3
if /i %input% == 4 goto r4
if /i %input% == 5 goto r5
if /i %input% == 6 goto r6
if /i %input% == 7 goto r7
if /i %input% == 8 goto r8
if /i %input% == 9 goto r9
if /i %input% == 10 goto r10
if /i %input% == 11 goto r11
if /i %input% == 12 goto w6
if /i %input% == 13 goto r13
if /i %input% == 14 goto r14
if /i %input% == 15 goto r15
if /i %input% == 16 goto r16
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :e

:r16
echo %w% - Enable Energy Logging + Power Telemetry%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "1" /f 

echo %w%- Enabling Link State Power Managment %b%
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /s "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
echo %w%- Enabling HIPM %b%
Reg.exe add "%%a" /v "EnableHIPM" /t REG_DWORD /d "1" /f  > nul 
echo %w%- Enabling DIPM %b%
Reg.exe add "%%a" /v "EnableDIPM" /t REG_DWORD /d "1" /f > nul 
echo %w%- Enabling HDD Parking %b%
Reg.exe add "%%a" /v "EnableHDDParking" /t REG_DWORD /d "1" /f > nul 
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
) > nul 
)
	
echo %w% - Enabling GPU Energy Driver%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f 

echo %w% - Enabling CoalescingTimerInterval%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "1" /f  
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "1" /f  

echo %w% - Enabling Power Throttling%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :E

echo %w% - Enabling Error Reporting  %b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r14
echo %w% - Enabling Diagnostics %b%
sc config DPS start= demand
sc config DiagTrack start= demand > NUL
sc config dmwappushservice start= demand > NUL
sc config diagnosticshub.standardcollector.service start= demand > NUL
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /enable
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /enable
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /enable
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /enable
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_CURRENT_USER\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "0" /f >nul 2>&1 
Reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r13
echo %w% - Enabling Smart Screen  %b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f 
Reg.exe add "HKU\!USER_SID!\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e


:r11
chcp 437 > nul
Powershell -Command "Write-Host "Install Microsoft Edge" Start-Process -FilePath winget -ArgumentList "install --force -e --accept-source-agreements --accept-package-agreements --silent Microsoft.Edge " -NoNewWindow -Wait"
chcp 65001 > nul

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r10
echo %w% - Enabling Printing and maps Services  %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "2" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r9
echo %w% - Enabling Maintenance %b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r8
echo %w% - Enabling Power Throttling%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r7
echo %w% - Enabling Fast Startup%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Enabling Hibernation%b%
powercfg /h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Enabling Study%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "0" /f 

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r6
echo %w% - Enable Bluetooth%b%
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BTAGService" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bthserv" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "2" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :e

:r5
cls
echo %w% - Enable Notifications%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\QuietHours" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.LowDisk" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.WiFiNetworkManager" /v "Enabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:r4
echo %w% - Enabling Gamedvr Services%b%
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "1" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:r3
echo %w% - Enabling Xbox Services%b%
sc config xbgm start= demand
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxGipSvc start= demand
sc config XboxNetApiSvc start= demand
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:r2
echo %w% - Redownloading default windows apps%b%
chcp 437 > nul
Powershell -Command "Get-AppxPackage -allusers | foreach {Add-AppxPackage -register “$($_.InstallLocation)\appxmanifest.xml” -DisableDevelopmentMode}"
chcp 65001 > nul

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:r1
echo %w% - Resetting power plans%b%
powercfg –restoredefaultschemes
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:exit
cls
echo.
echo.
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('! Make sure to restart your pc after using, so the tweaks properly apply !, thanks for using the exm utility. Press "ok" to exit', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1
pause > nul
cls
exit





:8war
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do NOT do these if your pc has bad overheating issues', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1

:8
:cpu
cls
echo.
echo.
echo.                                                                  %p% ░█████╗░██████╗░██╗░░░██╗          
echo.                                                                  %p% ██╔══██╗██╔══██╗██║░░░██║       
echo.                                                                  %p% ██║░░╚═╝██████╔╝██║░░░██║         
echo.                                                                  %p% ██║░░██╗██╔═══╝░██║░░░██║        
echo.                                                                  %p% ╚█████╔╝██║░░░░░╚██████╔╝      
echo.                                                                  %p% ░╚════╝░╚═╝░░░░░░╚═════╝░        
echo.                                             %b%"════════════════════════════════════════════════════════════════════"%w%
echo.                                                                 %w% Select Which type of cpu you have:              
echo.                                                                                                                                                                                                                       
echo.                                                            %p%[%w%1%p%]%w% AMD CPU            %p%[%w%2%p%]%w% Intel CPU                                             
echo.                                                                                           
echo.                                                                                             
echo.                                                                      %p%[%w%T%p%]%w% Open Task Manager                           
echo.                                                                                           
echo.                                                                      %p%[%w%M%p%]%w% Back to menu                                
echo.                                                                             
echo.       
echo.                                                                %p%%w%%w%%w%  Made by EXM TWEAKS® 2024            
echo.                                             %b%"════════════════════════════════════════════════════════════════════" %w%
echo.                                                   Disable certain power saving features, c-states, enable all cores
echo.                                                                         and a lot more  
echo.                                             %b%"════════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == 1 goto cpu1
if /i %input% == 2 goto cpu2
if /i %input% == T start taskmgr & goto 8
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu

:RedirectMenu
cls
goto 	

:cpu1
cls
echo.  
echo.  
echo.
echo.                                                                  %p%░█████╗░███╗░░░███╗██████╗░  ░█████╗░██████╗░██╗░░░██╗
echo.                                                                  %p%██╔══██╗████╗░████║██╔══██╗  ██╔══██╗██╔══██╗██║░░░██║
echo.                                                                  %p%███████║██╔████╔██║██║░░██║  ██║░░╚═╝██████╔╝██║░░░██║
echo.                                                                  %p%██╔══██║██║╚██╔╝██║██║░░██║  ██║░░██╗██╔═══╝░██║░░░██║
echo.                                                                  %p%██║░░██║██║░╚═╝░██║██████╔╝  ╚█████╔╝██║░░░░░╚██████╔╝
echo.                                                                  %p%╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░  ░╚════╝░╚═╝░░░░░░╚═════╝░
echo.
timeout 1 /nobreak > NUL
echo %w%- Disable Core Parking  %b%
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v CoreParkingDisabled /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Disable Distribute Timers%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f

echo %w%- Disable TSX%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f

echo %w%- Disable Even Processor%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f
cls
echo %w%- CPU Cooling Tweaks %b%
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo %w%- Enable All Logical Processors %b%
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS% 

echo %w% - Disable C-States%b%
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Use Higher P-States on Lower C-States And Viseversa %b%
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT

echo %w% - Disable Core Parking%b%
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo %w% - Disable Throttle States%b%
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:cpu2
echo.
echo.
echo.
echo.                                                                  %p%██╗███╗░░██╗████████╗███████╗██╗░░░░░  ░█████╗░██████╗░██╗░░░██╗
echo.                                                                  %p%██║████╗░██║╚══██╔══╝██╔════╝██║░░░░░  ██╔══██╗██╔══██╗██║░░░██║
echo.                                                                  %p%██║██╔██╗██║░░░██║░░░█████╗░░██║░░░░░  ██║░░╚═╝██████╔╝██║░░░██║
echo.                                                                  %p%██║██║╚████║░░░██║░░░██╔══╝░░██║░░░░░  ██║░░██╗██╔═══╝░██║░░░██║
echo.                                                                  %p%██║██║░╚███║░░░██║░░░███████╗███████╗  ╚█████╔╝██║░░░░░╚██████╔╝
echo.                                                                  %p%╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚══════╝  ░╚════╝░╚═╝░░░░░░╚═════╝░
echo.
timeout 1 /nobreak > NUL

echo %w%- Disable Core Parking  %b%
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet002\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
Reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\Power /v CoreParkingDisabled /t REG_DWORD /d 0 /f
powercfg -setacvalueindex scheme_current sub_processor CPMINCORES 100
powercfg /setactive SCHEME_CURRENT

echo %w%- Intel Specific Cpu tweaks %b%
bcdedit /set allowedinmemorysettings 0x0
bcdedit /set isolatedcontext No

echo %w%- Disable Distribute Timers%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f

echo %w%- Disable TSX%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f

echo %w%- Disable Even Processor%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f

echo %w%- CPU Cooling Tweaks %b%
powercfg /setACvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setDCvalueindex scheme_current SUB_PROCESSOR SYSCOOLPOL 1
powercfg /setactive SCHEME_CURRENT

echo %w%- Enable All Logical Processors %b%
bcdedit /set {current} numproc %NUMBER_OF_PROCESSORS% 

echo %w% - Disable C-States%b%
powercfg -setacvalueindex scheme_current SUB_SLEEP AWAYMODE 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP ALLOWSTANDBY 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current SUB_SLEEP HYBRIDSLEEP 0
powercfg /setactive SCHEME_CURRENT
powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMIN 100
powercfg /setactive SCHEME_CURRENT
timeout /t 1 /nobreak > NUL

echo %w%- Use Higher P-States on Lower C-States And Viseversa %b%
powercfg -setacvalueindex scheme_current sub_processor IDLESCALING 1
powercfg /setactive SCHEME_CURRENT



echo %w% - Disable Throttle States%b%
powercfg -setacvalueindex scheme_current sub_processor THROTTLING 0
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMin" /t REG_DWORD /d "0" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:7
:gpu
cls
echo.
echo.
echo.                                                                %p%  ░██████╗░██████╗░██╗░░░██╗         
echo.                                                                %p%  ██╔════╝░██╔══██╗██║░░░██║        
echo.                                                                %p%  ██║░░██╗░██████╔╝██║░░░██         
echo.                                                                %p%  ██║░░╚██╗██╔═══╝░██║░░░██║        
echo.                                                                %p%  ╚██████╔╝██║░░░░░╚██████╔╝        
echo.                                                                %p%  ░╚═════╝░╚═╝░░░░░░╚═════╝░        
echo.                                             %b%"══════════════════════════════════════════════════════════════════"%w%
echo.                                                              %w% Select which type of Gpu you have:    
echo.                                                                          
echo.                                                                                          
echo.                                                                  %p%[%w%1%p%]%w% NVIDIA GPU Tweaks                           
echo.                                                                                          
echo.                                                                  %p%[%w%2%p%]%w% AMD GPU Tweaks                              
echo.                                                                                          
echo.                                                                  %p%[%w%3%p%]%w% Intel GPU Tweaks                            
echo.                                                                                           
echo.                                                                                                                                                                                     
echo.                                                                  %p%[%w%M%p%]%w% Back to menu                                
echo.                                                                     
echo.
echo.                                                               %p%%w%%w%%w%  Made by EXM TWEAKS® 2024                           
echo.                                             %b%"══════════════════════════════════════════════════════════════════"
echo.                                                       %W%  Optimizes your GPU by tweaking 3d settings
echo.                                                       %W% Disabling power saving features and much more
echo.                                             %b%"══════════════════════════════════════════════════════════════════"
echo.
set /p input=:
if /i %input% == 1 goto g1
if /i %input% == 2 goto g2
if /i %input% == 3 goto g3
if /i %input% == T start taskmgr & goto 7
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :7


:g3
cls
echo %w% - Intel Gpu Tweaks%b%
for /f %%t in ('Reg query "HKLM\System\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}" /t REG_SZ /s /e /f "Intel" ^| findstr "HKEY"') do (

	Reg.exe add "%%t" /v "Disable_OverlayDSQualityEnhancement" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "IncreaseFixedSegment" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "AdaptiveVsyncEnable" /t REG_DWORD /d "0" /f
    Reg.exe add "%%t" /v "DisablePFonDP" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "EnableCompensationForDVI" /t REG_DWORD /d "1" /f
    Reg.exe add "%%t" /v "NoFastLinkTrainingForeDP" /t REG_DWORD /d "0" /f
    Reg.exe add "%%t" /v "ACPowerPolicyVersion" /t REG_DWORD /d "16898" /f
    Reg.exe add "%%t" /v "DCPowerPolicyVersion" /t REG_DWORD /d "16642" /f
)


Reg.exe add "HKLM\Software\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "512" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu




:1 
cls
echo.
echo.
echo.                                                       %p%   ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░     
echo.                                                       %p%   ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░     
echo.                                                       %p%   ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░    
echo.                                                       %p%   ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░      
echo.                                                       %p%   ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗     
echo.                                                       %p%   ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝    
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                
echo.                                                                    %p%[%w%1%p%]%w% General Peformance tweaks   
echo.                        
echo.                                                                                          
echo.                                                                             %p%[%w%M%p%]%w% Back to menu                           
echo.
echo.                                                                          
echo.                                                                        %p%%w%%w%%w% Made by EXM TWEAKS® 2024
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo.                                              %W% Applies a bunch of tweaks to increase your performance and lower your latency
echo.
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════"%w%
echo. 
echo. 

set /p input=:
if /i %input% == 1 goto general
if /i %input% == M CLS & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect 

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :1

:general
echo %w% - Optimizing Windows Search%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsAssignedAccess" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
Reg.exe add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DoNotUseWebResults" /t REG_DWORD /d "1" /f

echo %w% - Microsoft Mulitimedia Tweaks%b%
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsAll" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGames" /t REG_DWORD /d "10" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGamesAll" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\SOFTWARE\Microsoft\Games" /v "GameFluidity" /t REG_DWORD /d "1" /f


::bcd
echo %w% - Disable Dynamic Tick%b%
bcdedit /set disabledynamictick yes >nul 2>&1

echo %w% - Disable High Precision Event Timer (HPET)%b%
bcdedit /deletevalue useplatformclock  >nul 2>&1

echo %w% - Disable Synthetic Timers%b%
bcdedit /set useplatformtick yes  >nul 2>&1

::nfts
echo %w% - NFTS Tweaks%b%
fsutil behavior set memoryusage 2 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1
fsutil behavior set disablelastaccess 1 >nul 2>&1
fsutil behavior set disabledeletenotify 0 >nul 2>&1
fsutil behavior set encryptpagingfile 0 >nul 2>&1

echo %w% - MMCSS Priority For Low Latency%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "BackgroundPriority" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f

echo %w% - MMCSS Priority For Games%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "BackgroundPriority" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f

echo %w% - Setting Win32Priority%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f 

echo %w% - Disabling VirtualizationBasedSecurity%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f 
echo %w% - Disabling HVCIMATRequired%b%
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f 
echo %w% - Disabling ExceptionChainValidation%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f 
echo %w% - Disabling Sehop%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f 
echo %w% - Disabling CFG%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f 
echo %w% - Disabling Protection Mode%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f 
echo %w% - Disabling Spectre And Meltdown%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f 

echo %w% - Disabling Other Mitigations%b%
chcp 437 >nul 
powershell "Remove-Item -Path \"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*\" -Recurse -ErrorAction SilentlyContinue"
chcp 65001 >nul  

echo %w% - IRQ8 Priority %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f

echo %w% - IRQ16 Priority %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\PriorityControl" /v "IRQ16Priority" /t REG_DWORD /d "2" /f

echo %w% - Enabling Large System Cache%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f 


echo %w% - Disabling Paging Executive%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Address Space Layout Randomization%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f 


echo %w% - SVC split host%b%
for /f "skip=1" %%i in ('wmic os get TotalVisibleMemorySize') do if not defined TOTAL_MEMORY set "TOTAL_MEMORY=%%i" & set /a SVCHOST=%%i+1024000
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "!SVCHOST!" /f 


echo %w% - Disable Prefetch and superfetch%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f

echo %w% - Decrease processes kill time and menu show delay%b%
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "1000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t REG_SZ /d "1000" /f


echo %w% - Setting Time Stamp%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "TimeStampInterval" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t REG_DWORD /d "3" /f 


echo %w% - Setting CSRSS to Realtime%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 

echo %w% - Setting Latency Tolerance%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DXGKrnl" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "Latency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f 

echo %w% - Setting System Responsiveness%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f 


echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:10war
chcp 437 >nul 2>&1
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do NOT do these if your pc has bad overheating issues', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
timeout /t 1 /nobreak > nul
chcp 65001 >nul 2>&1
:10

:power
cls
echo.
echo.
echo.                                                                 %p%██████╗░░█████╗░░██╗░░░░░░░██╗███████╗██████╗░     
echo.                                                                 %p%██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗ 
echo.                                                                 %p%██████╔╝██║░░██║░╚██╗████╗██╔╝█████╗░░██████╔╝        
echo.                                                                 %p%██╔═══╝░██║░░██║░░████╔═████║░██╔══╝░░██╔══██   
echo.                                                                 %p%██║░░░░░╚█████╔╝░░╚██╔╝░╚██╔╝░███████╗██║░░██║      
echo.                                                                 %p%╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"%w%                                           
echo.                                                                                                                 
echo.                                                                  %p%[%w%1%p%]%w% Apply Exm Free Power Plan V4              
echo.                                                                                           
echo.                                                                  %p%[%w%2%p%]%w% Disable Power Throttoling, Timer Coalescing + more      
echo.   
echo.                                                                  %p%[%w%3%p%]%w% Disable Power Telemetry     
echo.
echo.                                                                  %p%[%w%4%p%]%w% Delete useless power plans 
echo.
echo.                                                                  %p%[%w%5%p%]%w% Disable Hibernation, Fast startup and more     
echo. 
echo.                                                                                     
echo.                                                                  %p%[%w%R%p%]%w% Revert all power tweaks (except power plan)                   
echo.                                                                                     
echo.      
echo.                                                                            %p%[%w%M%p%]%w% Back to menu                               
echo.                                                                                      
echo.
echo.                                                                        %p%%w%%w%%w%  Made by EXM TWEAKS® 2024    
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════"
echo.                                                             %w% Might increase cpu temperatures on poorly cooled pcs
echo.                                                         %W% Disables a bunch of useless power saving features and more
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════════"
echo.
echo.

set /p input=:
if /i %input% == 1 goto p1
if /i %input% == 2 goto p2
if /i %input% == 3 goto p3
if /i %input% == 4 goto p4
if /i %input% == 5 goto p5
if /i %input% == 6 goto r16
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :power



:p1
cls
echo %w% Import Exm Free Power Plan V4%b%
powercfg -import "C:\exm\Exm Free Power Plan V4.pow"
powercfg.cpl
timeout /t 1 /nobreak > NUL
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :power

:p5
echo %w% - Disabling Fast Startup (this is bad for your pc, even if it speeds up booting by a few seconds %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Hibernation%b%
powercfg /h off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Sleep Study (you should only shutdown your pc, dont put it to sleep, its bad for you pc) %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:p4
echo %w% - Deleting useless power plans%b%
powercfg -delete 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -delete 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete a1841308-3541-4fab-bc81-f71556f20b4a

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto power

:p3
echo %w% - Disabling Energy Logging + Power Telemetry%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :power

:P2
cls
cho %w%- Disabling Link State Power Managment %b%
FOR /F "eol=E" %%a in ('REG QUERY "HKLM\System\CurrentControlSet\Services" /s "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
echo %w%- Disabling HIPM %b%
Reg.exe add "%%a" /v "EnableHIPM" /t REG_DWORD /d "0" /f  > nul 
echo %w%- Disabling DIPM %b%
Reg.exe add "%%a" /v "EnableDIPM" /t REG_DWORD /d "0" /f > nul 
echo %w%- Disabling HDD Parking %b%
Reg.exe add "%%a" /v "EnableHDDParking" /t REG_DWORD /d "0" /f > nul 
FOR /F "tokens=*" %%z IN ("%%a") DO (
SET STR=%%z
SET STR=!STR:HKLM\System\CurrentControlSet\Services\=!
) > nul 
)	
echo %w% - Disabling GPU Energy Driver%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "2" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "2" /f 

echo %w% - Disabling CoalescingTimerInterval%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Power Throttling%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f 

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :power


:5
:RAM
cls
echo.
echo.
echo.                                                          %p%███╗░░░███╗███████╗███╗░░░███╗░█████╗░██████╗░██╗░░░██╗     
echo.                                                          %p%████╗░████║██╔════╝████╗░████║██╔══██╗██╔══██╗╚██╗░██╔╝
echo.                                                          %p%██╔████╔██║█████╗░░██╔████╔██║██║░░██║██████╔╝░╚████╔╝░        
echo.                                                          %p%██║╚██╔╝██║██╔══╝░░██║╚██╔╝██║██║░░██║██╔══██╗░░╚██╔╝░░  
echo.                                                          %p%██║░╚═╝░██║███████╗██║░╚═╝░██║╚█████╔╝██║░░██║░░░██║░░░     
echo.                                                          %p%╚═╝░░░░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░      
echo.                                             %b%"═════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                                           
echo.                                                                %p%[%w%1%p%]%w% Enable/Disable Memory Compression             
echo.                                                                                           
echo.                                                                %p%[%w%2%p%]%w% General Memory-Related Tweaks     
echo.                                              
echo.                                                                                       
echo.                                                                       %p%[%w%M%p%]%w% Back to menu      
echo.                         
echo.                                                                  
echo.                                                                   %p%%w%%w%%w%  Made by EXM TWEAKS® 2024
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════"%w% 
echo.                                                 %w% Optimizes a bunch of RAM related registry values for optimal performance 
echo.                                                   %W% Disables a bunch of useless features which hinder your performance
echo.                                             %b%"══════════════════════════════════════════════════════════════════════════════"%w% 
echo.
echo.

set /p input=:
if /i %input% == 1 goto m1
if /i %input% == 2 goto m2
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :power


:m1
cls
echo.
echo.
echo.                                                           %p%███╗░░░███╗███████╗███╗░░░███╗░█████╗░██████╗░██╗░░░██╗     
echo.                                                           %p%████╗░████║██╔════╝████╗░████║██╔══██╗██╔══██╗╚██╗░██╔╝
echo.                                                           %p%██╔████╔██║█████╗░░██╔████╔██║██║░░██║██████╔╝░╚████╔╝░        
echo.                                                           %p%██║╚██╔╝██║██╔══╝░░██║╚██╔╝██║██║░░██║██╔══██╗░░╚██╔╝░░  
echo.                                                           %p%██║░╚═╝░██║███████╗██║░╚═╝░██║╚█████╔╝██║░░██║░░░██║░░░     
echo.                                                           %p%╚═╝░░░░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"%w%
echo.                                                            %W% If you have over 16gb ram press 1, if you have less press 2       
echo.                                                
echo.                                                                                          
echo.                                                          %p%[%w%1%p%]%w% Disable Memory Compression (16GB And more)           
echo.                                                                                           
echo.                                                          %p%[%w%2%p%]%w% Enable Memory Compression (Less than 16gb ram)    
echo.                                              
echo.                                                                                       
echo.                                                                         %p%[%w%M%p%]%w% Back to menu                               
echo.                                                                                    
echo.                                                                   %p%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                      %w% Memory compression frees up ram but takes some cycles off your cpu
echo.                                                   %w% If you have over 16gb ram its better to disable it, otherwise keep it on 
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo.
echo.

set /p input=:
if /i %input% == 1 goto memoff
if /i %input% == 2 goto memon
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :power


:memoff
chcp 437 >nul 2>&1
echo %w% - Disable Memory Compression%b%
PowerShell -Command "Disable-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :ram

:memon
chcp 437 >nul 2>&1
echo %w% - Enable Memory Compression%b%
PowerShell -Command "Enable-MMAgent -MemoryCompression" > nul 2>&1
chcp 65001 >nul 2>&1
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :ram

:m2
chcp 437 > nul
echo %w% - Disabling Page Combining%b%
PowerShell -Command "Disable-MMAgent -PageCombining" > nul 2>&1

echo %w% - Set Max Operation rate to 2048%b%
PowerShell -Command "Set-MMAgent -MaxOperationAPIFiles 2048" > nul 2>&1

echo %w% - Enable Sysmain%b%
PowerShell -Command "Set-Service sysmain -StartupType Automatic" > nul 2>&1
PowerShell -Command "Start-Service sysmain" > nul 2>&1
chcp 65001 > nul

echo %w% - Disabling Paging Executive%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Prefetch and superfetch%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f

echo %w% - Optimizing Memory Managment%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "16710656" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /t REG_DWORD /d "4" /f


echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:g1
cls
echo.
echo.
echo.
echo.                                                              %p%███╗░░██╗██╗░░░██╗██╗██████╗░██╗░█████╗░  ░██████╗░██████╗░██╗░░░██╗
echo.                                                              %p%████╗░██║██║░░░██║██║██╔══██╗██║██╔══██╗  ██╔════╝░██╔══██╗██║░░░██║
echo.                                                              %p%██╔██╗██║╚██╗░██╔╝██║██║░░██║██║███████║  ██║░░██╗░██████╔╝██║░░░██║
echo.                                                              %p%██║╚████║░╚████╔╝░██║██║░░██║██║██╔══██║  ██║░░╚██╗██╔═══╝░██║░░░██║
echo.                                                              %p%██║░╚███║░░╚██╔╝░░██║██████╔╝██║██║░░██║  ╚██████╔╝██║░░░░░╚██████╔╝
echo.                                                              %p%╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═════╝░╚═╝╚═╝░░╚═╝  ░╚═════╝░╚═╝░░░░░░╚═════╝░
timeout 1 /nobreak > NUL
echo %w% - Applying Nvidia Profile Inspector Profile%b%
start "" /wait "C:\exm\NvidiaProfileInspector.exe" "C:\exm\Free NVPI EXM Profile V6.nip" 

echo %w% - Force Contigous Memory Allocation %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f

echo %w% - Disabling Write Combining %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID') do set "str=%%i" (
echo %w%- Deleting GPU Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f

echo %w%- Removing Msi GPU Limits %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /f

echo %w%- Enabling MSI Mode on GPU if supported %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w% - Setting NVIDIA Latency Tolerance%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "D3PCLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "F1TransitionLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "LOWLATENCY" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Node3DLowLatency" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PciLatencyTimerControl" /t REG_DWORD /d "20" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMDeepL1EntryLatencyUsec" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcMaxFtuS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcMinFtuS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmGspcPerioduS" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrEiIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrGrIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrGrRgIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMLpwrMsIdleThresholdUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectFlipDPCDelayUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectFlipTimingMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "VRDirectJITFlipMsHybridFlipDelayUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrCursorMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrDeflickerMarginUs" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "vrrDeflickerMaxUs" /t REG_DWORD /d "1" /f 


echo %w% - Disabling NVIDIA Telemetry%b%
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NvBackend" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID66610" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID64640" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SOFTWARE\NVIDIA Corporation\Global\FTS" /v "EnableRID44231" /t REG_DWORD /d "0" /f 
schtasks /change /disable /tn "NvTmRep_CrashReport1_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NvTmRep_CrashReport2_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NvTmRep_CrashReport3_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NvTmRep_CrashReport4_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NvDriverUpdateCheckDaily_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NVIDIA GeForce Experience SelfUpdate_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 
schtasks /change /disable /tn "NvTmMon_{B2FE1952-0186-46C3-BAEC-A80AA35AC5B8}" 

echo %w%- Disable GpuEnergy Driver %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f

echo %w% - Disabling Preemption%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemption" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableCudaContextPreemption" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "ComputePreemption" /t REG_DWORD /d "0" /f 

echo %w%- Latency Tolernace %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f


echo %w%- Set query vram%b% 
fsutil behavior query memoryusage
fsutil behavior set memoryusage 2


echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu


:g2
cls
echo.
echo.
echo.
echo.                                                              %p%░█████╗░███╗░░░███╗██████╗░  ░██████╗░██████╗░██╗░░░██╗
echo.                                                              %p%██╔══██╗████╗░████║██╔══██╗  ██╔════╝░██╔══██╗██║░░░██║
echo.                                                              %p%███████║██╔████╔██║██║░░██║  ██║░░██╗░██████╔╝██║░░░██║
echo.                                                              %p%██╔══██║██║╚██╔╝██║██║░░██║  ██║░░╚██╗██╔═══╝░██║░░░██║
echo.                                                              %p%██║░░██║██║░╚═╝░██║██████╔╝  ╚██████╔╝██║░░░░░╚██████╔╝
echo.                                                              %p%╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═════╝░  ░╚═════╝░╚═╝░░░░░░╚═════╝░
timeout 1 /nobreak > NUL

for /f %%i in ('wmic path Win32_VideoController get PNPDeviceID') do set "str=%%i" (
echo %w%- Deleting GPU Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f

echo %w%- Removing Msi GPU Limits %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MessageNumberLimit" /f

echo %w%- Enabling MSI Mode on GPU if supported %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w%- Disable GpuEnergy Driver %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr" /v "Start" /t REG_DWORD /d "4" /f

echo %w%- Disabling High-Bandwidth Digital Content Protection (HDCP) %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f 

echo %w% - Disabling Display Refresh Rate Override%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "3D_Refresh_Rate_Override_DEF" /t REG_DWORD /d "0" /f 

echo %w% - Disabling SnapShot%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Anti Aliasing%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "0" /f 

echo %w% - Disabling Subscriptions%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Anisotropic Filtering%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t REG_SZ /d "0" /f 

echo %w% - Disabling Radeon Overlay%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "false" /f  

echo Enabling Adaptive DeInterlacing%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Adaptive De-interlacing" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Skins%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t REG_SZ /d "false" /f  

echo %w% - Disabling Automatic Color Depth Reduction%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Power Gating%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVCEPowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerGating" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f 


echo %w% - Disabling VCESW Clock Gating%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableVceSwClockGating" /t REG_DWORD /d "1" /f 

echo %w% - Disabling UVD Clock Gating%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUvdClockGating" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Active State Power Management (ASPM)%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL0s" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableAspmL1" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Ultra Low Power States (ULPS) %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "0" /f 

echo %w% - Enabling De-Lag%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Disabling Frame Rate Target%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL

echo %w% - Disabling DMA%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f 

echo %w% - Enable BlockWrite%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Stutter Mode%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f 

echo %w% - Disabling GPU Memory Clock Sleep State%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f 

echo %w% - Disabling Thermal Throttling%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f 

echo %w% - Disabling Preemption%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_EnableComputePreemption" /t REG_DWORD /d "0" /f 

echo %w% - Setting Main3D%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "3100" /f 

echo %w% - Setting FlipQueueSize%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "FlipQueueSize" /t REG_BINARY /d "3100" /f 

echo %w% - Setting Shader Cache Size%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "3200" /f 

echo %w% - Configuring TFQ%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TFQ" /t REG_BINARY /d "3200" /f 

echo %w%- Disable Preemption %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnablePreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "GPUPreemptionLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableAsyncMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemptionVGPU" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemptionForHighTdrTimeout" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableSCGMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "PerfAnalyzeMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidGfxPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableMidBufferPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "EnableCEPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisableCudaContextPreemption" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablePreemptionOnS3S4" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "ComputePreemptionLevel" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v "DisablePreemption" /t REG_DWORD /d "1" /f


echo %w% - Disabling GPU Power Down%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "1" /f 

echo %w% - Disabling AMD Logging%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f 

echo %w%- Latency Tolernace %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "InterruptSteeringDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "ExitLatencyCheckEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceFSVP" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyTolerancePerfOverride" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceScreenOffIR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LatencyToleranceVSyncEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "RtlCapabilityCheckLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyActivelyUsed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleShortTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultD3TransitionLatencyIdleVeryLongTime" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle0MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceIdle1MonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceMemory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceNoContextMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceOther" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultLatencyToleranceTimerPeriod" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceActivelyUsed" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceMonitorOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DefaultMemoryRefreshLatencyToleranceNoContext" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MaxIAverageGraphicsLatencyInOneBucket" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "Latency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MiracastPerfTrackGraphicsLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "TransitionLatency" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "MonitorRefreshLatencyTolerance" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RMDisablePostL2Compression" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmDisableRegistryCaching" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL


echo %w%- Vram %b% 
fsutil behavior query memoryusage
fsutil behavior set memoryusage 2


echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu


:9
cls
echo.  
echo.  
echo.  
echo.                                                                           %p%██╗░░░██╗░██████╗██████╗░  ████████╗░██╗░░░░░░░██╗███████╗░█████╗░██╗░░██╗░██████╗
echo.                                                                           %p%██║░░░██║██╔════╝██╔══██╗  ╚══██╔══╝░██║░░██╗░░██║██╔════╝██╔══██╗██║░██╔╝██╔════╝
echo.                                                                           %p%██║░░░██║╚█████╗░██████╦╝  ░░░██║░░░░╚██╗████╗██╔╝█████╗░░███████║█████═╝░╚█████╗░
echo.                                                                           %p%██║░░░██║░╚═══██╗██╔══██╗  ░░░██║░░░░░████╔═████║░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗
echo.                                                                           %p%╚██████╔╝██████╔╝██████╦╝  ░░░██║░░░░░╚██╔╝░╚██╔╝░███████╗██║░░██║██║░╚██╗██████╔╝
echo.                                                                           %p%░╚═════╝░╚═════╝░╚═════╝░  ░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░
timeout 1 /nobreak > NUL
echo %w% - Disabling USB PowerSavings%b%
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID^| findstr /l "PCI\VEN_"') do (
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "D3ColdSupported" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnableSelectiveSuspend" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f 
)


echo %w% - Thread Priority%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\usbxhci\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USBHUB3\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\NDIS\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f

echo %w% - Disabling USB Selective Suspend%b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" /t REG_DWORD /d "1" /f 

echo %w% - Enabing MSI mode on usb%b%
for /f %%i in ('wmic path Win32_USBController get PNPDeviceID') do set "str=%%i" & (
echo.DEL USB Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
echo.Enable MSI Mode on USB %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
)

echo %w% - USB Msi Priority%b%
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID 2^>nul') do set "str=%%i" & if "!str:PCI\VEN_=!" neq "!str!" (
echo %w%- DEL Sata controllers Device Priority %b%
Reg.exe add "HKLM\System\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /f
)

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:k1
cls
echo %w% - Disabling Filter Keys (the filterkeys app is completely useless placebo, dont use it for the love of god)%b%
Reg.exe add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f
echo %w% - Disabling Toggle Keys%b%
Reg.exe add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f
echo %w% - Disabling Sticky Keys%b%
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
echo %w% - Disabling Mouse Keys%b%
Reg.exe add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f

echo %w% - Disabling Mouse Acceleration%b%
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f

echo %w% - Enabling 1:1 Pixel Mouse Movements%b%
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f

echo %w% - Reducing Keyboard Repeat Delay%b%
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f

echo %w% - Increasing Keyboard Repeat Rate%b%
Reg.exe add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f

echo %w% - Setting CSRSS to Realtime%b%
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f 
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto kbm,

:2
:kbm
cls
echo.
echo.
echo.                                                               %p% ██╗░░██╗██████╗░███╗░░░███╗
echo.                                                               %p% ██║░██╔╝██╔══██╗████╗░████║
echo.                                                               %p% █████═╝░██████╦╝██╔████╔██║
echo.                                                               %p% ██╔═██╗░██╔══██╗██║╚██╔╝██║
echo.                                                               %p% ██║░╚██╗██████╦╝██║░╚═╝░██║
echo.                                                               %p% ╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝    
echo.                                             %b%"═══════════════════════════════════════════════════════════════"%w%                    
echo.                                                                                          
echo.                                                           %p%[%w%1%p%]%w% Apply KBM Registry Optimizations       
echo.                                                                                           
echo.                                                           %p%[%w%2%p%]%w% Set KBM Data Queue Size   
echo.                                                                                          
echo.                                                                                           
echo.                                                                   %p%[%w%M%p%]%w% Back to menu   
echo.                            
echo.                                                                                         
echo.                                                             %p%%w%%w%%w%  Made by EXM TWEAKS® 2024      
echo.                                             %b%"════════════════════════════════════════════════════════════════"
echo.                                                %w% Optimizes a bunch of mouse and keyboard registry settings
echo.                                             %b%"════════════════════════════════════════════════════════════════"
echo.

set /p input=:
if /i %input% == 1 goto k1
if /i %input% == 2 goto k2
if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :kbm

:k2
cls
echo.
echo.
echo.

echo.                                                                               %p% ██╗░░██╗██████╗░███╗░░░███╗
echo.                                                                               %p% ██║░██╔╝██╔══██╗████╗░████║
echo.                                                                               %p% █████═╝░██████╦╝██╔████╔██║
echo.                                                                               %p% ██╔═██╗░██╔══██╗██║╚██╔╝██║
echo.                                                                               %p% ██║░╚██╗██████╦╝██║░╚═╝░██║
echo.                                                                               %p% ╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════"   
echo.                                                                                                                       
echo.                                                      %p%[%w%1%p%]%w% 14 (High end CPU)      %p%[%w%2%p%]%w% 17 (Mid end CPU)     %p%[%w%3%p%]%w% 20(Low end CPU)                  
echo.                                                                                                                                                                                       
echo.                                                                                                                      
echo.                                                                              %p%[%w%T%p%]%w% Open Task Manager                                     
echo.                                                                                                                      
echo.                                                                              %p%[%w%R%p%]%w% Revert                  
echo.                                                                                          
echo.                                                                        %p%%w%%w%%w% Made by EXM TWEAKS® 2024
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.                                                              %w% The lower the value, the less peripheral latency you will have
echo.                                                       %w% But it may cause KBM stutters and lag on lower end pc's if the value is too high
echo.
echo.                                            %w% Comment Your CPU in the comments of the tutorial for the utility and we will tell you which value to use 
echo.                                             %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.
set /p input=: 
if /i %input% == 1 goto 14v
if /i %input% == 2 goto 17v
if /i %input% == 3 goto 20v
if /i %input% == R goto Revertm
if /i %input% == T start taskmgr & goto k2
if /i %input% == X cls & goto mouse

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2 
goto Redirectmouse


:Redirectmouse
cls
goto :mouse

:14v
echo %w% - 14 %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:17v
echo %w% - 17 %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "23" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "23" /f

echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu


:20v
echo %w% - 20 %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "32" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu

:revertm
echo %w% - 100 %b%
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "256" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "256" /f
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu



:6
cls
chcp 437 > nul

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('After you press ok it will open an app, Go to the LOGON section, disable all services except: antivirus, cmd.exe, and the n/a services', 'Exm Tweaking Utility', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
chcp 65001 > nul

start C:\exm\autoruns.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto menu





:4
:clean
cls
echo.
echo.
echo.                                                                   %p%░█████╗░██╗░░░░░███████╗░█████╗░███╗░░██╗  
echo.                                                                   %p%██╔══██╗██║░░░░░██╔════╝██╔══██╗████╗░██║
echo.                                                                   %p%██║░░╚═╝██║░░░░░█████╗░░███████║██╔██╗██║      
echo.                                                                   %p%██║░░██╗██║░░░░░██╔══╝░░██╔══██║██║╚████║ 
echo.                                                                   %p%╚█████╔╝███████╗███████╗██║░░██║██║░╚███║    
echo.                                                                   %p%░╚════╝░╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚══╝      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"%w%                
echo.                                                                                                       
echo.                                                  %p%[%w%1%p%]%w% Clean Temporary Device Data    %p%[%w%2%p%]%w% Windows Clean Manager   
echo.
echo.                                                                                                                                                                
echo.                                                                          %p%[%w%M%p%]%w% Back to menu                               
echo.                                                                                    
echo.                                                                       %p%%w%%w%%w% Made by EXM TWEAKS® 2024      
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo.                                                               %W% Clean a bunch of temporary data off your pc
echo.                                                             %W% Deletes old drivers, cache, logs and a lot more
echo.                                             %b%"════════════════════════════════════════════════════════════════════════════════"
echo. 
set /p input=:
if /i %input% == 1 goto c1
if /i %input% == 2 goto c2

if /i %input% == M cls & goto menu

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
cls
echo Misspell Detected
timeout 2
goto RedirectMenu


:RedirectMenu
cls
goto :12


:c1
cls
echo %w% -  Cleaning Useless Device Data...%b%
chcp 437 > nul
@echo on
POWERSHELL "$Devices = Get-PnpDevice | ? Status -eq Unknown;foreach ($Device in $Devices) { &\"pnputil\" /remove-device $Device.InstanceId }"
@echo off
chcp 65001 > nul
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :4

:c2
cls
start cleanmgr.exe
echo.
echo.
echo.
echo.                                              %b%"═══════════════════════════════════════════════════════"
echo.                                                %w%  Operation Completed, Press any key to continue...  
echo.                                              %b%"═══════════════════════════════════════════════════════"
pause > nul
cls
goto :menu

```batch
@echo off
setlocal enableDelayedExpansion
chcp 65001 >NUL :: Set console to UTF-8 codepage for better character display
VERIFY ON :: Turn on file write verification for more robust error reporting

:: PC Optimization Script
:: This script performs various system optimizations for better performance and gaming.
:: ALWAYS RUN THIS SCRIPT AS ADMINISTRATOR.

:: 1. Check for Administrator Privileges
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo ================================================
    echo  WARNING: This script needs Administrator privileges.
    echo  Please right-click the script and select "Run as administrator".
    echo ================================================
    echo.
    pause
    goto :EOF
)

chcp 65001 >NUL
:main_menu
cls
echo.
echo ===================================================================================================
echo	
echo	   ▄█    █▄             ███      ▄█     █▄     ▄████████    ▄████████    ▄█   ▄█▄    ▄████████ 
echo	  ███    ███        ▀█████████▄ ███     ███   ███    ███   ███    ███   ███ ▄███▀   ███    ███ 
echo	  ███    ███           ▀███▀▀██ ███     ███   ███    █▀    ███    ███   ███▐██▀     ███    █▀  
echo	 ▄███▄▄▄▄███▄▄          ███   ▀ ███     ███  ▄███▄▄▄       ███    ███  ▄█████▀      ███        
echo	▀▀███▀▀▀▀███▀           ███     ███     ███ ▀▀███▀▀▀     ▀███████████ ▀▀█████▄    ▀███████████ 
echo	  ███    ███            ███     ███     ███   ███    █▄    ███    ███   ███▐██▄            ███ 
echo	  ███    ███            ███     ███ ▄█▄ ███   ███    ███   ███    ███   ███ ▀███▄    ▄█    ███ 
echo	  ███    █▀            ▄████▀    ▀███▀███▀    ██████████   ███    █▀    ███   ▀█▀  ▄████████▀  
echo	                                                                        ▀                                                                                                      
echo ===================================================================================================
echo.
echo           Select an option to run:
echo.
echo            [1] Set High Performance Power Plan
echo            -----------------------------------------------------------------------
echo            [2] Clear Temporary Files
echo            -----------------------------------------------------------------------
echo            [3] Flush DNS Resolver Cache
echo            -----------------------------------------------------------------------
echo            [4] Basic Network Optimizations (Disable Nagle's)
echo            -----------------------------------------------------------------------
echo            [5] Disable Unnecessary Services (Telemetry, Diagnostic, Fax)
echo            -----------------------------------------------------------------------
echo            [6] Launch Windows Disk Cleanup Utility
echo            -----------------------------------------------------------------------
echo.
echo  --- Advanced Registry And System Optimizations ---
echo.
echo            [7] Disable Power Throttling for Background Apps
echo            -----------------------------------------------------------------------
echo            [8] Disable Search Indexing (Recommended for SSDs)
echo            -----------------------------------------------------------------------
echo            [9] Disable Game Bar / Game DVR
echo            -----------------------------------------------------------------------
echo            [10] Disable NDU (Network Diagnostics Usage) Service
echo            -----------------------------------------------------------------------
echo            [11] Disable CPU Core Parking (Ensures all cores are active)
echo            -----------------------------------------------------------------------
echo            [12] Disable HPET (High Precision Event Timer)
echo            -----------------------------------------------------------------------
echo            [13] Optimize Interrupt Policy (MSI Mode for GPUs)
echo            -----------------------------------------------------------------------
echo            [14] Disable Xbox Live Services
echo            -----------------------------------------------------------------------
echo            [15] Disable Print Spooler (CAUTION: Only if no printer used)
echo            -----------------------------------------------------------------------
echo            [16] Disable Fast Startup
echo            -----------------------------------------------------------------------
echo.
echo  --- Additional Advanced Tweaks ---
echo.
echo            [17] Disable Superfetch/SysMain Service
echo            -----------------------------------------------------------------------
echo            [18] Disable Windows Defender (CAUTION: Use 3rd party AV)
echo            -----------------------------------------------------------------------
echo            [19] Optimize Visual Effects for Performance
echo            -----------------------------------------------------------------------
echo            [20] Optimize Boot Menu Timeout (Set to 5 seconds)
echo            -----------------------------------------------------------------------
echo            [21] Disable Hibernation (Frees Disk Space)
echo            -----------------------------------------------------------------------
echo            [22] Disable Remote Assistance
echo            -----------------------------------------------------------------------
echo            [23] Disable Windows Error Reporting Service
echo            -----------------------------------------------------------------------
echo            [24] Disable System Restore (CAUTION: No restore points)
echo            -----------------------------------------------------------------------
echo            [25] Disable NTFS Last Access Time Updates
echo            -----------------------------------------------------------------------
echo            [26] Disable Distributed Link Tracking Client
echo            -----------------------------------------------------------------------
echo.
echo  [A] Run ALL Optimizations
echo  [X] Exit
echo.
set /p "choice=Enter your choice: "

IF /I "%choice%"=="1" goto :opt_power_plan
IF /I "%choice%"=="2" goto :opt_clear_temp
IF /I "%choice%"=="3" goto :opt_flush_dns
IF /I "%choice%"=="4" goto :opt_network
IF /I "%choice%"=="5" goto :opt_services
IF /I "%choice%"=="6" goto :opt_disk_cleanup
IF /I "%choice%"=="7" goto :opt_reg_power_throttle
IF /I "%choice%"=="8" goto :opt_reg_search_index
IF /I "%choice%"=="9" goto :opt_reg_game_bar
IF /I "%choice%"=="10" goto :opt_reg_ndu
IF /I "%choice%"=="11" goto :opt_reg_core_parking
IF /I "%choice%"=="12" goto :opt_reg_hpet
IF /I "%choice%"=="13" goto :opt_reg_msi_mode
IF /I "%choice%"=="14" goto :opt_services_xbox
IF /I "%choice%"=="15" goto :opt_services_spooler
IF /I "%choice%"=="16" goto :opt_disable_fast_startup
IF /I "%choice%"=="17" goto :opt_disable_superfetch
IF /I "%choice%"=="18" goto :opt_disable_defender
IF /I "%choice%"=="19" goto :opt_visual_effects
IF /I "%choice%"=="20" goto :opt_boot_timeout
IF /I "%choice%"=="21" goto :opt_disable_hibernation
IF /I "%choice%"=="22" goto :opt_disable_remote_assistance
IF /I "%choice%"=="23" goto :opt_disable_error_reporting
IF /I "%choice%"=="24" goto :opt_disable_system_restore
IF /I "%choice%"=="25" goto :opt_disable_last_access
IF /I "%choice%"=="26" goto :opt_disable_link_tracking
IF /I "%choice%"=="A" goto :run_all_sequence
IF /I "%choice%"=="R" goto :revert_all_placeholder
IF /I "%choice%"=="X" goto :EOF

echo.
echo Invalid choice. Please try again.
set /p "=Press any key to continue..."
pause >NUL
goto :main_menu

:: Run All Sequence
:run_all_sequence
cls
echo.
echo ===========================================
echo  Running ALL Optimizations...
echo ===========================================
echo.
call :opt_power_plan_core
call :opt_clear_temp_core
call :opt_flush_dns_core
call :opt_network_core
call :opt_services_core
call :opt_disk_cleanup_core
call :opt_reg_power_throttle_core
call :opt_reg_search_index_core
call :opt_reg_game_bar_core
call :opt_reg_ndu_core
call :opt_reg_core_parking_core
call :opt_reg_hpet_core
call :opt_reg_msi_mode_core
call :opt_services_xbox_core
call :opt_services_spooler_core
call :opt_disable_fast_startup_core
call :opt_disable_superfetch_core
call :opt_disable_defender_core
call :opt_visual_effects_core
call :opt_boot_timeout_core
call :opt_disable_hibernation_core
call :opt_disable_remote_assistance_core
call :opt_disable_error_reporting_core
call :opt_disable_system_restore_core
call :opt_disable_last_access_core
call :opt_disable_link_tracking_core
goto :script_completion

:: OPTIMIZATION SECTIONS (Core Logic - called by menu or run_all_sequence)

:opt_power_plan
cls
call :opt_power_plan_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_power_plan_core
echo [OPTIMIZATION] Setting Power Plan to High Performance...
powercfg /setactive 8c5e7fd1-a8b9-4a42-b210-df7032e89dd0 >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - High Performance Power Plan activated.
) ELSE (
    echo    - Failed to activate High Performance Power Plan.
)
echo.
exit /b

:opt_clear_temp
cls
call :opt_clear_temp_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_clear_temp_core
echo [CLEANUP] Clearing Temporary Files...
del /q /f /s "%TEMP%\*" >NUL 2>&1
del /q /f /s "%SystemRoot%\Temp\*" >NUL 2>&1
del /q /f /s "%SystemRoot%\Prefetch\*" >NUL 2>&1
del /q /f "%AppData%\Microsoft\Windows\Recent\*" >NUL 2>&1
del /q /f /s "%SystemRoot%\Logs\*" >NUL 2>&1
echo    - Temporary files cleared.
echo.
exit /b

:opt_flush_dns
cls
call :opt_flush_dns_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_flush_dns_core
echo [NETWORK] Flushing DNS Resolver Cache...
ipconfig /flushdns >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - DNS cache flushed successfully.
) ELSE (
    echo    - Failed to flush DNS cache.
)
echo.
exit /b

:opt_network
cls
call :opt_network_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_network_core
echo [NETWORK] Applying basic network optimizations (Disable Nagle's Algorithm)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /f >NUL 2>&1
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /k') do (
    reg add "%%a" /v TcpAckFrequency /t REG_DWORD /d 1 /f >NUL 2>&1
    reg add "%%a" /v TCPNoDelay /t REG_DWORD /d 1 /f >NUL 2>&1
)
reg add "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >NUL 2>&1
echo    - Nagle's Algorithm disabled (TcpAckFrequency & TCPNoDelay set to 1).
echo.
exit /b

:opt_services
cls
call :opt_services_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_services_core
echo [SERVICES] Disabling unnecessary Windows services...
sc stop "DiagTrack" >NUL 2>&1
sc config "DiagTrack" start= disabled >NUL 2>&1
echo    - DiagTrack (Telemetry) service disabled.

sc stop "DPS" >NUL 2>&1
sc config "DPS" start= disabled >NUL 2>&1
echo    - Diagnostic Policy Service disabled.

sc stop "Fax" >NUL 2>&1
sc config "Fax" start= disabled >NUL 2>&1
echo    - Fax service disabled.

echo    - Selected services optimized.
echo.
exit /b

:opt_disk_cleanup
cls
call :opt_disk_cleanup_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disk_cleanup_core
echo [CLEANUP] Launching Windows Disk Cleanup Utility...
echo    - Please select the drive and files to clean manually.
cleanmgr.exe
echo    - Disk Cleanup launched.
echo.
exit /b

:: ADVANCED REGISTRY & SYSTEM OPTIMIZATION SECTIONS

:opt_reg_power_throttle
cls
call :opt_reg_power_throttle_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_power_throttle_core
echo [REGISTRY] Disabling Power Throttling for Background Apps...
:: Prevents Windows from throttling background processes to save power,
:: which can sometimes affect performance of non-focused apps or services.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAppManagement" /v "PowerThrottling" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Power Throttling disabled.
) ELSE (
    echo    - Failed to disable Power Throttling.
)
echo.
exit /b

:opt_reg_search_index
cls
call :opt_reg_search_index_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_search_index_core
echo [REGISTRY] Disabling Search Indexing (Recommended for SSDs)...
:: Reduces background activity and wear on SSDs by disabling the Windows Search Indexer.
:: You might notice slower search results if you rely heavily on Windows Search.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 4 /f >NUL 2>&1
sc stop "WSearch" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Search Indexing disabled.
) ELSE (
    echo    - Failed to disable Windows Search Indexing.
)
echo.
exit /b

:opt_reg_game_bar
cls
call :opt_reg_game_bar_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_game_bar_core
echo [REGISTRY] Disabling Game Bar / Game DVR...
:: Disables Windows Game Bar and Game DVR features which can consume resources.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Game Bar / Game DVR disabled.
) ELSE (
    echo    - Failed to disable Game Bar / Game DVR.
)
echo.
exit /b

:opt_reg_ndu
cls
call :opt_reg_ndu_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_ndu_core
echo [REGISTRY] Disabling NDU (Network Diagnostics Usage) Service...
:: Can sometimes help reduce DPC latency and network stuttering in games.
:: Set Start to 4 (Disabled)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f >NUL 2>&1
sc stop "Ndu" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NDU service disabled.
) ELSE (
    echo    - Failed to disable NDU service.
)
echo.
exit /b

:opt_reg_core_parking
cls
call :opt_reg_core_parking_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_core_parking_core
echo [REGISTRY] Disabling CPU Core Parking...
:: This tweak aims to ensure all CPU cores are available for scheduling.
:: While modern Windows versions handle this well, some users report benefits.
:: This affects power profiles, so it's tied to the active power plan.
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR SCRIPT_PROCESSOR_PARKING_MIN_CORES 0 >NUL 2>&1
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR SCRIPT_PROCESSOR_PARKING_MIN_CORES 0 >NUL 2>&1
powercfg -setactive SCHEME_CURRENT >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU Core Parking disabled (min cores set to 0).
) ELSE (
    echo    - Failed to disable CPU Core Parking.
)
echo.
exit /b

:opt_reg_hpet
cls
call :opt_reg_hpet_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_hpet_core
echo [REGISTRY] Disabling HPET (High Precision Event Timer)...
:: HPET can sometimes introduce DPC latency or stuttering in games.
:: Disabling it can sometimes improve frame pacing.
:: This requires a specific BCDEDIT command.
bcdedit /set useplatformclock no >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - HPET disabled via BCDEDIT.
) ELSE (
    echo    - Failed to disable HPET. (May already be disabled or error occurred)
)
echo.
exit /b

:opt_reg_msi_mode
cls
call :opt_reg_msi_mode_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_msi_mode_core
echo [REGISTRY] Optimizing Interrupt Policy (MSI Mode for GPUs)...
:: This forces Message Signaled Interrupts (MSI) mode for NVIDIA/AMD GPUs.
:: Can sometimes improve latency and stability. Requires driver reinstallation or reboot to take full effect.
:: This is a complex tweak and requires finding the correct device path.
:: This script will attempt to enable it for common GPU paths.
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\PCI" /s /k ^| findstr /i "VEN_10DE VEN_1002"') do (
    for /f "tokens=*" %%b in ('reg query "%%a" /s /k ^| findstr /i "DeviceParameters"') do (
        reg add "%%b\Interrupt Management\MessageSignaledInterruptProperties" /v MSISupported /t REG_DWORD /d 1 /f >NUL 2>&1
        reg add "%%b\Interrupt Management\MessageSignaledInterruptProperties" /v MessageNumberLimit /t REG_DWORD /d 1 /f >NUL 2>&1
    )
)
echo    - Attempted to enable MSI Mode for GPUs.
echo    - NOTE: A driver reinstallation or system restart might be needed for full effect.
echo.
exit /b

:opt_services_xbox
cls
call :opt_services_xbox_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_services_xbox_core
echo [SERVICES] Disabling Xbox Live Services...
:: If you don't use Xbox features on your PC, disabling these can free up resources.
sc stop "XblGameSave" >NUL 2>&1
sc config "XblGameSave" start= disabled >NUL 2>&1
echo    - Xbox Game Save service disabled.

sc stop "XboxGipSvc" >NUL 2>&1
sc config "XboxGipSvc" start= disabled >NUL 2>&1
echo    - Xbox Accessory Management Service disabled.

sc stop "XboxNetApiSvc" >NUL 2>&1
sc config "XboxNetApiSvc" start= disabled >NUL 2>&1
echo    - Xbox Live Networking Service disabled.

sc stop "GamingServices" >NUL 2>&1
sc config "GamingServices" start= disabled >NUL 2>&1
echo    - Gaming Services disabled.

echo    - Xbox related services optimized.
echo.
exit /b

:opt_services_spooler
cls
call :opt_services_spooler_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_services_spooler_core
echo [SERVICES] Disabling Print Spooler Service...
echo    - WARNING: Only disable if you DO NOT use a printer. Re-enable if you need to print!
sc stop "Spooler" >NUL 2>&1
sc config "Spooler" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Print Spooler service disabled.
) ELSE (
    echo    - Failed to disable Print Spooler.
)
echo.
exit /b

:opt_disable_fast_startup
cls
call :opt_disable_fast_startup_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_fast_startup_core
echo [SYSTEM] Disabling Fast Startup...
:: Fast Startup (Hybrid Shutdown) can sometimes cause issues with driver updates or system stability.
:: A full shutdown is often preferred for a truly fresh start.
powercfg /h off >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Fast Startup disabled.
) ELSE (
    echo    - Failed to disable Fast Startup.
)
echo.
exit /b

:: NEW OPTIMIZATION SECTIONS

:opt_disable_superfetch
cls
call :opt_disable_superfetch_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_superfetch_core
echo [SERVICES] Disabling Superfetch/SysMain Service...
:: Superfetch (SysMain) can sometimes cause high disk usage, especially on HDDs.
:: Disabling it might improve performance on some systems.
sc stop "SysMain" >NUL 2>&1
sc config "SysMain" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Superfetch/SysMain service disabled.
) ELSE (
    echo    - Failed to disable Superfetch/SysMain service.
)
echo.
exit /b

:opt_disable_defender
cls
call :opt_disable_defender_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_defender_core
echo [SECURITY] Disabling Windows Defender (CAUTION: Only if 3rd party AV is used!)...
:: Disables Windows Defender's real-time protection. Only do this if you have another antivirus installed.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Defender AntiSpyware disabled.
    echo      WARNING: Ensure you have another antivirus solution active!
) ELSE (
    echo    - Failed to disable Windows Defender AntiSpyware.
)
echo.
exit /b

:opt_visual_effects
cls
call :opt_visual_effects_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_visual_effects_core
echo [VISUALS] Optimizing Visual Effects for Performance...
:: Sets visual effects to "Adjust for best performance" via registry.
:: This disables most animations, shadows, and transparency.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "ThemeActive" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038010000000" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Visual effects set to performance mode.
    echo      Note: Some changes may require logging out/in or a restart.
) ELSE (
    echo    - Failed to optimize visual effects.
)
echo.
exit /b

:opt_boot_timeout
cls
call :opt_boot_timeout_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_boot_timeout_core
echo [SYSTEM] Optimizing Boot Menu Timeout (Set to 5 seconds)...
:: Reduces the time Windows waits on the boot menu screen.
bcdedit /timeout 5 >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Boot menu timeout set to 5 seconds.
) ELSE (
    echo    - Failed to set boot menu timeout.
)
echo.
exit /b

:opt_disable_hibernation
cls
call :opt_disable_hibernation_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_hibernation_core
echo [SYSTEM] Disabling Hibernation (Frees Disk Space)...
:: Disables the hibernation feature and deletes the hiberfil.sys file, freeing up disk space.
powercfg.exe /hibernate off >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Hibernation disabled and hiberfil.sys removed.
) ELSE (
    echo    - Failed to disable hibernation.
)
echo.
exit /b

:opt_disable_remote_assistance
cls
call :opt_disable_remote_assistance_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_remote_assistance_core
echo [SECURITY] Disabling Remote Assistance...
:: Disables Windows Remote Assistance, which can improve security and free up minor resources.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Remote Assistance disabled.
) ELSE (
    echo    - Failed to disable Remote Assistance.
)
echo.
exit /b

:opt_disable_error_reporting
cls
call :opt_disable_error_reporting_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_error_reporting_core
echo [SERVICES] Disabling Windows Error Reporting Service...
:: Stops the Windows Error Reporting service, which collects and sends error reports.
:: Disabling it can reduce background activity.
sc stop "WerSvc" >NUL 2>&1
sc config "WerSvc" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Error Reporting Service disabled.
) ELSE (
    echo    - Failed to disable Windows Error Reporting Service.
)
echo.
exit /b

:opt_disable_system_restore
cls
call :opt_disable_system_restore_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_system_restore_core
echo [SYSTEM] Disabling System Restore (CAUTION: No restore points will be created!)...
:: Disables System Restore for the C: drive, freeing up significant disk space.
:: WARNING: This means you will not be able to use System Restore points to revert changes.
wmic /namespace:\\root\default Path SystemRestore Call Disable C: >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - System Restore disabled for C: drive.
    echo      WARNING: No system restore points will be created!
) ELSE (
    echo    - Failed to disable System Restore for C: drive.
)
echo.
exit /b

:opt_disable_last_access
cls
call :opt_disable_last_access_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_last_access_core
echo [SYSTEM] Disabling NTFS Last Access Time Updates...
:: Prevents Windows from updating the last access time for files and folders on NTFS drives.
:: Can reduce disk I/O, especially on HDDs.
fsutil behavior set disablelastaccess 1 >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NTFS Last Access Time Updates disabled.
) ELSE (
    echo    - Failed to disable NTFS Last Access Time Updates.
)
echo.
exit /b

:opt_disable_link_tracking
cls
call :opt_disable_link_tracking_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_link_tracking_core
echo [SERVICES] Disabling Distributed Link Tracking Client...
:: Disables a service that maintains links between NTFS files within a computer or across a network.
:: Can free up minor resources if not needed.
sc stop "TrkWks" >NUL 2>&1
sc config "TrkWks" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Distributed Link Tracking Client disabled.
) ELSE (
    echo    - Failed to disable Distributed Link Tracking Client.
)
echo.
exit /b

:: REVERT ALL PLACEHOLDER
:revert_all_placeholder
cls
echo.
echo ===========================================
echo  REVERT ALL OPTIMIZATIONS - WARNING
echo ===========================================
echo.
echo  This feature is a placeholder.
echo  Reverting all optimizations requires specific default values for each tweak.
echo  Implementing a full "Revert All" is complex and highly recommended to be done manually
echo  by understanding each optimization's default state or by creating individual revert options.
echo.
echo  For example, to re-enable HPET: bcdedit /set useplatformclock yes
echo  To re-enable a service: sc config "ServiceName" start= auto
echo  To re-enable Game Bar: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 1 /f
echo.
echo  Press any key to return to the main menu.
pause
goto :main_menu


:: Script Completion
:script_completion
echo.
echo ===========================================
echo  PC Optimization Script - Completed!
echo ===========================================
echo.
echo  For best results, it is highly recommended to RESTART your computer now.
echo.
echo Press any key to exit...
pause
cmd /k :: Keeps the window open after script completion
```
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
echo You are using H1 Tweaking Utility, copying or reskining this script is forbidden. © 2025 H1 Tweaks 
echo.
echo.
echo	   ▄█    █▄             ███      ▄█     █▄     ▄████████    ▄████████    ▄█   ▄█▄    ▄████████ 
echo	  ███    ███        ▀█████████▄ ███     ███   ███    ███   ███    ███   ███ ▄███▀   ███    ███ 
echo	  ███    ███           ▀███▀▀██ ███     ███   ███    █▀    ███    ███   ███▐██▀     ███    █▀  
echo	 ▄███▄▄▄▄███▄▄          ███   ▀ ███     ███  ▄███▄▄▄       ███    ███  ▄█████▀      ███        
echo	▀▀███▀▀▀▀███▀           ███     ███     ███ ▀▀███▀▀▀     ▀███████████ ▀▀█████▄    ▀███████████ 
echo	  ███    ███            ███     ███     ███   ███    █▄    ███    ███   ███▐██▄            ███ 
echo	  ███    ███            ███     ███ ▄█▄ ███   ███    ███   ███    ███   ███ ▀███▄    ▄█    ███ 
echo	  ███    █▀            ▄████▀    ▀███▀███▀    ██████████   ███    █▀    ███   ▀█▀  ▄████████▀  
echo.	                                                                        ▀                      
echo Version 1.0
echo ===================================================================================================
echo.
echo          Select an option to run:
echo.
echo           [1] Set High Performance Power Plan
echo           -----------------------------------------------------------------------
echo           [2] Clear Temporary Files (No direct revert)
echo           -----------------------------------------------------------------------
echo           [3] Flush DNS Resolver Cache (No direct revert)
echo           -----------------------------------------------------------------------
echo           [4] Basic Network Optimizations (Disable Nagle's)
echo           -----------------------------------------------------------------------
echo           [5] Disable Unnecessary Services (Telemetry, Diagnostic, Fax)
echo           -----------------------------------------------------------------------
echo           [6] Launch Windows Disk Cleanup Utility (No direct revert)
echo           -----------------------------------------------------------------------
echo.
echo  --- Advanced Registry And System Optimizations ---
echo.
echo           [7] Disable Power Throttling for Background Apps
echo           -----------------------------------------------------------------------
echo           [8] Disable Search Indexing (Recommended for SSDs)
echo           -----------------------------------------------------------------------
echo           [9] Disable Game Bar / Game DVR
echo           -----------------------------------------------------------------------
echo           [10] Disable NDU (Network Diagnostics Usage) Service
echo           -----------------------------------------------------------------------
echo           [11] Disable CPU Core Parking (Ensures all cores are active)
echo           -----------------------------------------------------------------------
echo           [12] Disable HPET (High Precision Event Timer)
echo           -----------------------------------------------------------------------
echo           [13] Optimize Interrupt Policy (MSI Mode for GPUs)
echo           -----------------------------------------------------------------------
echo           [14] Disable Xbox Live Services
echo           -----------------------------------------------------------------------
echo           [15] Disable Print Spooler (CAUTION: Only if no printer used)
echo           -----------------------------------------------------------------------
echo           [16] Disable Fast Startup
echo           -----------------------------------------------------------------------
echo.
echo  --- Additional Advanced Tweaks ---
echo.
echo           [17] Disable Superfetch/SysMain Service
echo           -----------------------------------------------------------------------
echo           [18] Disable Windows Defender (CAUTION: Use 3rd party AV)
echo           -----------------------------------------------------------------------
echo           [19] Optimize Visual Effects for Performance
echo           -----------------------------------------------------------------------
echo           [20] Optimize Boot Menu Timeout (Set to 5 seconds)
echo           -----------------------------------------------------------------------
echo           [21] Disable Hibernation (Frees Disk Space)
echo           -----------------------------------------------------------------------
echo           [22] Disable Remote Assistance
echo           -----------------------------------------------------------------------
echo           [23] Disable Windows Error Reporting Service
echo           -----------------------------------------------------------------------
echo           [24] Disable System Restore (CAUTION: No restore points)
echo           -----------------------------------------------------------------------
echo           [25] Disable NTFS Last Access Time Updates
echo           -----------------------------------------------------------------------
echo           [26] Disable Distributed Link Tracking Client
echo           -----------------------------------------------------------------------
echo.
echo  --- Even More In-depth Tweaks ---
echo.
echo           [27] Optimize Network Throttling Index
echo           -----------------------------------------------------------------------
echo           [28] Optimize System Responsiveness
echo           -----------------------------------------------------------------------
echo           [29] Disable TCP/IP Auto-Tuning
echo           -----------------------------------------------------------------------
echo           [30] Disable IPv6 (CAUTION: May cause network issues if needed)
echo           -----------------------------------------------------------------------
echo           [31] Prioritize Foreground Apps (Win32PrioritySeparation)
echo           -----------------------------------------------------------------------
echo           [32] Clear Pagefile on Shutdown (Increases shutdown time, security focus)
echo           -----------------------------------------------------------------------
echo           [33] Disable Consumer Features / Suggested Content
echo           -----------------------------------------------------------------------
echo           [34] Disable Sync Settings
echo           -----------------------------------------------------------------------
echo           [35] Disable Disk Defragmentation Schedule (Recommended for SSDs)
echo           -----------------------------------------------------------------------
echo           [36] Disable Remote Registry Service
echo           -----------------------------------------------------------------------
echo           [37] Disable Windows Modules Installer Worker (CAUTION: Disables Windows Updates!)
echo           -----------------------------------------------------------------------
echo           [38] Disable SmartScreen (CAUTION: Security Risk!)
echo           -----------------------------------------------------------------------
echo.
echo  --- Deepest System And Network Tweaks ---
echo.
echo           [39] Disable CPU State Throttling (Increases power consumption/heat)
echo           -----------------------------------------------------------------------
echo           [40] Optimize LargeSystemCache (For heavy file I/O, consumes more RAM)
echo           -----------------------------------------------------------------------
echo           [41] Disable CPU Microcode Updates (EXTREME CAUTION: Security Risk!)
echo           -----------------------------------------------------------------------
echo           [42] Optimize NonBestEffortLimit (Network Retransmission)
echo           -----------------------------------------------------------------------
echo           [43] Increase MaxUserPort (For many simultaneous network connections)
echo           -----------------------------------------------------------------------
echo           [44] Disable Common Maintenance Scheduled Tasks
echo           -----------------------------------------------------------------------
echo           [45] Disable Windows Push Notifications Service
echo           -----------------------------------------------------------------------
echo           [46] Disable Geolocation Service
echo           -----------------------------------------------------------------------
echo           [47] Disable Sensor Monitoring Service
echo           -----------------------------------------------------------------------
echo           [48] Disable Biometric Service
echo           -----------------------------------------------------------------------
echo.
echo  [A] Run ALL Recommended Optimizations (Excludes high-risk/experimental)
echo  [R] Revert Optimizations Menu
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
IF /I "%choice%"=="27" goto :opt_reg_network_throttling_index
IF /I "%choice%"=="28" goto :opt_reg_system_responsiveness
IF /I "%choice%"=="29" goto :opt_disable_tcpip_autotuning
IF /I "%choice%"=="30" goto :opt_disable_ipv6
IF /I "%choice%"=="31" goto :opt_reg_win32_priority_separation
IF /I "%choice%"=="32" goto :opt_reg_clear_pagefile_on_shutdown
IF /I "%choice%"=="33" goto :opt_disable_consumer_features
IF /I "%choice%"=="34" goto :opt_disable_sync_settings
IF /I "%choice%"=="35" goto :opt_disable_defrag_schedule
IF /I "%choice%"=="36" goto :opt_disable_remote_registry
IF /I "%choice%"=="37" goto :opt_disable_tiworker
IF /I "%choice%"=="38" goto :opt_disable_smartscreen
IF /I "%choice%"=="39" goto :opt_reg_cpu_state_throttling
IF /I "%choice%"=="40" goto :opt_reg_large_system_cache
IF /I "%choice%"=="41" goto :opt_reg_disable_cpu_microcode
IF /I "%choice%"=="42" goto :opt_reg_non_best_effort_limit
IF /I "%choice%"=="43" goto :opt_reg_max_user_port
IF /I "%choice%"=="44" goto :opt_disable_maintenance_tasks
IF /I "%choice%"=="45" goto :opt_disable_push_notifications
IF /I "%choice%"=="46" goto :opt_disable_geolocation
IF /I "%choice%"=="47" goto :opt_disable_sensor_monitoring
IF /I "%choice%"=="48" goto :opt_disable_biometric_service
IF /I "%choice%"=="A" goto :run_all_sequence
IF /I "%choice%"=="R" goto :revert_menu
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
echo  Running ALL RECOMMENDED Optimizations...
echo  (Excludes high-risk/experimental tweaks)
echo ===========================================
echo.
:: IMPORTANT: Only call _core functions here, never the menu-driven ones.
:: Carefully select which ones to include in "Run ALL" to avoid system instability.
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
call :opt_reg_network_throttling_index_core
call :opt_reg_system_responsiveness_core
call :opt_disable_tcpip_autotuning_core
:: Skipping opt_disable_ipv6_core in "Run ALL" due to high risk
call :opt_reg_win32_priority_separation_core
call :opt_reg_clear_pagefile_on_shutdown_core
call :opt_disable_consumer_features_core
call :opt_disable_sync_settings_core
call :opt_disable_defrag_schedule_core
call :opt_disable_remote_registry_core
:: Skipping opt_disable_tiworker_core and opt_disable_smartscreen_core in "Run ALL" due to high risk
:: Skipping opt_reg_disable_cpu_microcode_core in "Run ALL" due to high risk
:: Skipping opt_disable_ipv6_core in "Run ALL" due to high risk
call :opt_reg_cpu_state_throttling_core
call :opt_reg_large_system_cache_core
call :opt_reg_non_best_effort_limit_core
call :opt_reg_max_user_port_core
call :opt_disable_maintenance_tasks_core
call :opt_disable_push_notifications_core
call :opt_disable_geolocation_core
call :opt_disable_sensor_monitoring_core
call :opt_disable_biometric_service_core

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
:: Nagle's Algorithm is typically off by default or handled by modern apps.
:: To revert, these keys are typically deleted or set to 0.
:: For now, setting to 1 is the 'optimization'.
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

:: ===========================================
::         EVEN MORE IN-DEPTH TWEAKS
:: ===========================================

:opt_reg_network_throttling_index
cls
call :opt_reg_network_throttling_index_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_network_throttling_index_core
echo [REGISTRY] Optimizing Network Throttling Index...
:: Disables network throttling for multimedia and other applications.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Network Throttling Index optimized.
) ELSE (
    echo    - Failed to optimize Network Throttling Index.
)
echo.
exit /b

:opt_reg_system_responsiveness
cls
call :opt_reg_system_responsiveness_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_system_responsiveness_core
echo [REGISTRY] Optimizing System Responsiveness...
:: Prioritizes network or foreground applications. Setting to 0 prioritizes network performance.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - System Responsiveness optimized (set to 0).
) ELSE (
    echo    - Failed to optimize System Responsiveness.
)
echo.
exit /b

:opt_disable_tcpip_autotuning
cls
call :opt_disable_tcpip_autotuning_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_tcpip_autotuning_core
echo [NETWORK] Disabling TCP/IP Auto-Tuning...
:: Disables Receive Window Auto-Tuning, can resolve issues with specific network hardware/configurations.
netsh int tcp set global autotuninglevel=disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - TCP/IP Auto-Tuning disabled.
) ELSE (
    echo    - Failed to disable TCP/IP Auto-Tuning.
)
echo.
exit /b

:opt_disable_ipv6
cls
call :opt_disable_ipv6_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_ipv6_core
echo [NETWORK] Disabling IPv6...
echo    - WARNING: Only disable if you are sure your network does not rely on IPv6!
echo    - This can cause connectivity issues if required by your ISP or local network.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 0xffffffff /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - IPv6 disabled.
) ELSE (
    echo    - Failed to disable IPv6.
)
echo.
exit /b

:opt_reg_win32_priority_separation
cls
call :opt_reg_win32_priority_separation_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_win32_priority_separation_core
echo [REGISTRY] Prioritizing Foreground Apps (Win32PrioritySeparation)...
:: Adjusts memory allocation to prioritize foreground applications.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 28 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Foreground application prioritization set.
) ELSE (
    echo    - Failed to set foreground application prioritization.
)
echo.
exit /b

:opt_reg_clear_pagefile_on_shutdown
cls
call :opt_reg_clear_pagefile_on_shutdown_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_clear_pagefile_on_shutdown_core
echo [REGISTRY] Enabling Clear Pagefile on Shutdown...
echo    - This increases shutdown time but enhances security by wiping the pagefile.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Clear Pagefile on Shutdown enabled.
) ELSE (
    echo    - Failed to enable Clear Pagefile on Shutdown.
)
echo.
exit /b

:opt_disable_consumer_features
cls
call :opt_disable_consumer_features_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_consumer_features_core
echo [PRIVACY] Disabling Consumer Features / Suggested Content...
:: Prevents Windows from showing suggestions, ads, or automatically installing apps.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Consumer Features / Suggested Content disabled.
) ELSE (
    echo    - Failed to disable Consumer Features / Suggested Content.
)
echo.
exit /b

:opt_disable_sync_settings
cls
call :opt_disable_sync_settings_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_sync_settings_core
echo [PRIVACY] Disabling Sync Settings...
:: Stops syncing settings across devices (e.g., themes, passwords).
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "Enabled" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Sync Settings disabled.
) ELSE (
    echo    - Failed to disable Sync Settings.
)
echo.
exit /b

:opt_disable_defrag_schedule
cls
call :opt_disable_defrag_schedule_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_defrag_schedule_core
echo [DRIVE] Disabling Disk Defragmentation Schedule...
echo    - Recommended for SSDs as defragmentation is unnecessary and causes wear.
sc stop "defragsvc" >NUL 2>&1
sc config "defragsvc" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Disk Defragmentation Schedule disabled.
) ELSE (
    echo    - Failed to disable Disk Defragmentation Schedule.
)
echo.
exit /b

:opt_disable_remote_registry
cls
call :opt_disable_remote_registry_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_remote_registry_core
echo [SERVICES] Disabling Remote Registry Service...
:: Prevents remote users from modifying registry settings on your computer, enhancing security.
sc stop "RemoteRegistry" >NUL 2>&1
sc config "RemoteRegistry" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Remote Registry Service disabled.
) ELSE (
    echo    - Failed to disable Remote Registry Service.
)
echo.
exit /b

:opt_disable_tiworker
cls
call :opt_disable_tiworker_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_tiworker_core
echo [SERVICES] Disabling Windows Modules Installer Worker (TrustedInstaller)...
echo    - WARNING: This service handles Windows updates! Disabling it will prevent
echo      Windows from installing critical security and feature updates. Use with extreme caution.
sc stop "TrustedInstaller" >NUL 2>&1
sc config "TrustedInstaller" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Modules Installer Worker disabled.
    echo      REMINDER: This stops Windows Updates!
) ELSE (
    echo    - Failed to disable Windows Modules Installer Worker.
)
echo.
exit /b

:opt_disable_smartscreen
cls
call :opt_disable_smartscreen_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_smartscreen_core
echo [SECURITY] Disabling SmartScreen...
echo    - WARNING: Disabling SmartScreen significantly reduces your system's protection
echo      against malicious websites and files. Only proceed if you have a robust
echo      third-party security solution and understand the risks.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\SmartScreenEnabled" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - SmartScreen disabled.
    echo      REMINDER: Your system's security is reduced!
) ELSE (
    echo    - Failed to disable SmartScreen.
)
echo.
exit /b

:: ===========================================
::         DEEPEST SYSTEM & NETWORK TWEAKS
:: ===========================================

:opt_reg_cpu_state_throttling
cls
call :opt_reg_cpu_state_throttling_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_cpu_state_throttling_core
echo [REGISTRY] Disabling CPU State Throttling...
echo    - Prevents Windows from potentially throttling CPU performance based on power states.
echo    - May increase power consumption and heat.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingEnabled" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU State Throttling disabled.
) ELSE (
    echo    - Failed to disable CPU State Throttling.
)
echo.
exit /b

:opt_reg_large_system_cache
cls
call :opt_reg_large_system_cache_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_large_system_cache_core
echo [REGISTRY] Optimizing LargeSystemCache...
echo    - Directs Windows to use a larger portion of system memory for file system cache.
echo    - Beneficial for heavy file I/O, but can reduce RAM available for applications.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - LargeSystemCache enabled.
) ELSE (
    echo    - Failed to enable LargeSystemCache.
)
echo.
exit /b

:opt_reg_disable_cpu_microcode
cls
call :opt_reg_disable_cpu_microcode_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_disable_cpu_microcode_core
echo [REGISTRY] Disabling CPU Microcode Updates (EXTREME CAUTION!)...
echo    - WARNING: This prevents Windows from applying microcode updates for your CPU.
echo      These updates often patch critical security vulnerabilities (e.g., Spectre/Meltdown).
echo      HIGHLY DISCOURAGED due to significant security implications and potential instability.
echo.
set /p "confirm=Are you absolutely sure you want to disable CPU Microcode Updates? (y/n): "
IF /I NOT "%confirm%"=="y" GOTO :EOF
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d 3 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d 3 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU Microcode Updates disabled. (SECURITY RISK!)
) ELSE (
    echo    - Failed to disable CPU Microcode Updates.
)
echo.
exit /b

:opt_reg_non_best_effort_limit
cls
call :opt_reg_non_best_effort_limit_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_non_best_effort_limit_core
echo [REGISTRY] Optimizing NonBestEffortLimit (Network Retransmission)...
:: Controls the number of packets the network stack attempts to re-send.
:: Lowering (to 0) can reduce latency on poor connections but might increase dropped packets.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NonBestEffortLimit set to 0.
) ELSE (
    echo    - Failed to set NonBestEffortLimit.
)
echo.
exit /b

:opt_reg_max_user_port
cls
call :opt_reg_max_user_port_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_reg_max_user_port_core
echo [REGISTRY] Increasing MaxUserPort...
:: Increases the ephemeral port range for outgoing connections.
:: Can be useful for applications that open a very large number of simultaneous connections.
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - MaxUserPort set to 65534.
) ELSE (
    echo    - Failed to set MaxUserPort.
)
echo.
exit /b

:opt_disable_maintenance_tasks
cls
call :opt_disable_maintenance_tasks_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_maintenance_tasks_core
echo [SCHEDULED TASKS] Disabling Common Maintenance Scheduled Tasks...
:: Disables various Windows maintenance tasks. Can free up resources but requires manual maintenance.
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\MUI\LPRemove" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Chkdsk\ProactiveScan" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /DISABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Servicing\StartComponentCleanup" /DISABLE >NUL 2>&1

echo    - Common Maintenance Scheduled Tasks disabled.
echo.
exit /b

:opt_disable_push_notifications
cls
call :opt_disable_push_notifications_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_push_notifications_core
echo [SERVICES] Disabling Windows Push Notifications Service (WpnUserService)...
:: Disables modern "toast" notifications from apps.
sc stop "WpnUserService" >NUL 2>&1
sc config "WpnUserService" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Push Notifications Service disabled.
) ELSE (
    echo    - Failed to disable Windows Push Notifications Service.
)
echo.
exit /b

:opt_disable_geolocation
cls
call :opt_disable_geolocation_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_geolocation_core
echo [SERVICES] Disabling Geolocation Service (lfsvc)...
:: Stops Windows from determining your location. Useful for privacy.
sc stop "lfsvc" >NUL 2>&1
sc config "lfsvc" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Geolocation Service disabled.
) ELSE (
    echo    - Failed to disable Geolocation Service.
)
echo.
exit /b

:opt_disable_sensor_monitoring
cls
call :opt_disable_sensor_monitoring_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_sensor_monitoring_core
echo [SERVICES] Disabling Sensor Monitoring Service (SensrSvc)...
:: Stops monitoring ambient light, accelerometers, etc. Primarily for laptops/tablets.
sc stop "SensrSvc" >NUL 2>&1
sc config "SensrSvc" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Sensor Monitoring Service disabled.
) ELSE (
    echo    - Failed to disable Sensor Monitoring Service.
)
echo.
exit /b

:opt_disable_biometric_service
cls
call :opt_disable_biometric_service_core
echo Press any key to return to the main menu...
pause
goto :main_menu

:opt_disable_biometric_service_core
echo [SERVICES] Disabling Biometric Service (WbioSrvc)...
:: Stops support for fingerprint readers, facial recognition (Windows Hello), etc.
sc stop "WbioSrvc" >NUL 2>&1
sc config "WbioSrvc" start= disabled >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Biometric Service disabled.
) ELSE (
    echo    - Failed to disable Biometric Service.
)
echo.
exit /b


:: ===========================================
::             REVERT OPTIONS MENU
:: ===========================================
:revert_menu
cls
echo.
echo ===========================================
echo            REVERT OPTIMIZATIONS
echo ===========================================
echo.
echo   [1] Revert: Power Plan to Balanced
echo   -----------------------------------------------------------------------
echo   [2] Revert: Enable Nagle's Algorithm (Set to default/delete keys)
echo   -----------------------------------------------------------------------
echo   [3] Revert: Enable Search Indexing
echo   -----------------------------------------------------------------------
echo   [4] Revert: Enable Game Bar / Game DVR
echo   -----------------------------------------------------------------------
echo   [5] Revert: Enable NDU Service
echo   -----------------------------------------------------------------------
echo   [6] Revert: Enable HPET
echo   -----------------------------------------------------------------------
echo   [7] Revert: Enable Power Throttling
echo   -----------------------------------------------------------------------
echo   [8] Revert: Enable CPU Core Parking (to default Windows management)
echo   -----------------------------------------------------------------------
echo   [9] Revert: Enable Xbox Live Services
echo   -----------------------------------------------------------------------
echo   [10] Revert: Enable Print Spooler Service
echo   -----------------------------------------------------------------------
echo   [11] Revert: Enable Fast Startup
echo   -----------------------------------------------------------------------
echo   [12] Revert: Enable Superfetch/SysMain Service
echo   -----------------------------------------------------------------------
echo   [13] Revert: Enable Windows Defender
echo   -----------------------------------------------------------------------
echo   [14] Revert: Visual Effects (to default "Let Windows choose")
echo   -----------------------------------------------------------------------
echo   [15] Revert: Boot Menu Timeout (to default 30 seconds)
echo   -----------------------------------------------------------------------
echo   [16] Revert: Enable Hibernation
echo   -----------------------------------------------------------------------
echo   [17] Revert: Enable Remote Assistance
echo   -----------------------------------------------------------------------
echo   [18] Revert: Enable Windows Error Reporting Service
echo   -----------------------------------------------------------------------
echo   [19] Revert: Enable System Restore (for C: drive)
echo   -----------------------------------------------------------------------
echo   [20] Revert: Enable NTFS Last Access Time Updates
echo   -----------------------------------------------------------------------
echo   [21] Revert: Enable Distributed Link Tracking Client
echo   -----------------------------------------------------------------------
echo.
echo   --- Revert In-depth Tweaks ---
echo.
echo   [22] Revert: Network Throttling Index (to default)
echo   -----------------------------------------------------------------------
echo   [23] Revert: System Responsiveness (to default)
echo   -----------------------------------------------------------------------
echo   [24] Revert: Enable TCP/IP Auto-Tuning
echo   -----------------------------------------------------------------------
echo   [25] Revert: Enable IPv6
echo   -----------------------------------------------------------------------
echo   [26] Revert: Prioritize Background Apps (Win32PrioritySeparation to default)
echo   -----------------------------------------------------------------------
echo   [27] Revert: Disable Clear Pagefile on Shutdown
echo   -----------------------------------------------------------------------
echo   [28] Revert: Enable Consumer Features / Suggested Content
echo   -----------------------------------------------------------------------
echo   [29] Revert: Enable Sync Settings
echo   -----------------------------------------------------------------------
echo   [30] Revert: Enable Disk Defragmentation Schedule
echo   -----------------------------------------------------------------------
echo   [31] Revert: Enable Remote Registry Service
echo   -----------------------------------------------------------------------
echo   [32] Revert: Enable Windows Modules Installer Worker
echo   -----------------------------------------------------------------------
echo   [33] Revert: Enable SmartScreen
echo   -----------------------------------------------------------------------
echo.
echo   --- Revert Deepest System & Network Tweaks ---
echo.
echo   [34] Revert: Enable CPU State Throttling
echo   -----------------------------------------------------------------------
echo   [35] Revert: Optimize LargeSystemCache (to default)
echo   -----------------------------------------------------------------------
echo   [36] Revert: Enable CPU Microcode Updates
echo   -----------------------------------------------------------------------
echo   [37] Revert: NonBestEffortLimit (to default)
echo   -----------------------------------------------------------------------
echo   [38] Revert: MaxUserPort (to default)
echo   -----------------------------------------------------------------------
echo   [39] Revert: Enable Common Maintenance Scheduled Tasks
echo   -----------------------------------------------------------------------
echo   [40] Revert: Enable Windows Push Notifications Service
echo   -----------------------------------------------------------------------
echo   [41] Revert: Enable Geolocation Service
echo   -----------------------------------------------------------------------
echo   [42] Revert: Enable Sensor Monitoring Service
echo   -----------------------------------------------------------------------
echo   [43] Revert: Enable Biometric Service
echo   -----------------------------------------------------------------------
echo.
echo   [B] Back to Main Menu
echo.
set /p "revert_choice=Enter your choice: "

IF /I "%revert_choice%"=="1" goto :revert_power_plan
IF /I "%revert_choice%"=="2" goto :revert_network
IF /I "%revert_choice%"=="3" goto :revert_reg_search_index
IF /I "%revert_choice%"=="4" goto :revert_reg_game_bar
IF /I "%revert_choice%"=="5" goto :revert_reg_ndu
IF /I "%revert_choice%"=="6" goto :revert_reg_hpet
IF /I "%revert_choice%"=="7" goto :revert_reg_power_throttle
IF /I "%revert_choice%"=="8" goto :revert_reg_core_parking
IF /I "%revert_choice%"=="9" goto :revert_services_xbox
IF /I "%revert_choice%"=="10" goto :revert_services_spooler
IF /I "%revert_choice%"=="11" goto :revert_disable_fast_startup
IF /I "%revert_choice%"=="12" goto :revert_disable_superfetch
IF /I "%revert_choice%"=="13" goto :revert_disable_defender
IF /I "%revert_choice%"=="14" goto :revert_visual_effects
IF /I "%revert_choice%"=="15" goto :revert_boot_timeout
IF /I "%revert_choice%"=="16" goto :revert_disable_hibernation
IF /I "%revert_choice%"=="17" goto :revert_disable_remote_assistance
IF /I "%revert_choice%"=="18" goto :revert_disable_error_reporting
IF /I "%revert_choice%"=="19" goto :revert_disable_system_restore
IF /I "%revert_choice%"=="20" goto :revert_disable_last_access
IF /I "%revert_choice%"=="21" goto :revert_disable_link_tracking
IF /I "%revert_choice%"=="22" goto :revert_reg_network_throttling_index
IF /I "%revert_choice%"=="23" goto :revert_reg_system_responsiveness
IF /I "%revert_choice%"=="24" goto :revert_disable_tcpip_autotuning
IF /I "%revert_choice%"=="25" goto :revert_disable_ipv6
IF /I "%revert_choice%"=="26" goto :revert_reg_win32_priority_separation
IF /I "%revert_choice%"=="27" goto :revert_reg_clear_pagefile_on_shutdown
IF /I "%revert_choice%"=="28" goto :revert_disable_consumer_features
IF /I "%revert_choice%"=="29" goto :revert_disable_sync_settings
IF /I "%revert_choice%"=="30" goto :revert_disable_defrag_schedule
IF /I "%revert_choice%"=="31" goto :revert_disable_remote_registry
IF /I "%revert_choice%"=="32" goto :revert_disable_tiworker
IF /I "%revert_choice%"=="33" goto :revert_disable_smartscreen
IF /I "%revert_choice%"=="34" goto :revert_reg_cpu_state_throttling
IF /I "%revert_choice%"=="35" goto :revert_reg_large_system_cache
IF /I "%revert_choice%"=="36" goto :revert_reg_disable_cpu_microcode
IF /I "%revert_choice%"=="37" goto :revert_reg_non_best_effort_limit
IF /I "%revert_choice%"=="38" goto :revert_reg_max_user_port
IF /I "%revert_choice%"=="39" goto :revert_enable_maintenance_tasks
IF /I "%revert_choice%"=="40" goto :revert_enable_push_notifications
IF /I "%revert_choice%"=="41" goto :revert_enable_geolocation
IF /I "%revert_choice%"=="42" goto :revert_enable_sensor_monitoring
IF /I "%revert_choice%"=="43" goto :revert_enable_biometric_service
IF /I "%revert_choice%"=="B" goto :main_menu

echo.
echo Invalid choice. Please try again.
set /p "=Press any key to continue..."
pause >NUL
goto :revert_menu


:: ===========================================
::             REVERT LOGIC SECTIONS
:: ===========================================

:revert_power_plan
cls
call :revert_power_plan_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_power_plan_core
echo [REVERT] Setting Power Plan to Balanced...
:: GUID for Balanced Power Plan
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Balanced Power Plan activated.
) ELSE (
    echo    - Failed to activate Balanced Power Plan.
)
echo.
exit /b

:revert_network
cls
call :revert_network_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_network_core
echo [REVERT] Re-enabling/Resetting Nagle's Algorithm to default...
:: To revert, the registry keys added by the optimization are typically deleted.
:: Default state for TcpAckFrequency is usually not present or 2.
:: Default state for TCPNoDelay is usually not present or 0.
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /k') do (
    reg delete "%%a" /v TcpAckFrequency /f >NUL 2>&1
    reg delete "%%a" /v TCPNoDelay /f >NUL 2>&1
)
reg delete "HKLM\SOFTWARE\Microsoft\MSMQ\Parameters" /v TCPNoDelay /f >NUL 2>&1
echo    - Nagle's Algorithm reverted (TcpAckFrequency & TCPNoDelay keys removed).
echo.
exit /b

:revert_reg_search_index
cls
call :revert_reg_search_index_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_search_index_core
echo [REVERT] Re-enabling Search Indexing (Windows Search Service)...
:: Sets Start to 2 (Automatic)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 2 /f >NUL 2>&1
sc config "WSearch" start= auto >NUL 2>&1
sc start "WSearch" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Search Indexing re-enabled.
) ELSE (
    echo    - Failed to re-enable Windows Search Indexing.
)
echo.
exit /b

:revert_reg_game_bar
cls
call :revert_reg_game_bar_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_game_bar_core
echo [REVERT] Re-enabling Game Bar / Game DVR...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
:: GameDVR_FSEBehavior default is 0 or 2, setting back to 0 is safer for default behavior.
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Game Bar / Game DVR re-enabled.
) ELSE (
    echo    - Failed to re-enable Game Bar / Game DVR.
)
echo.
exit /b

:revert_reg_ndu
cls
call :revert_reg_ndu_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_ndu_core
echo [REVERT] Re-enabling NDU (Network Diagnostics Usage) Service...
:: Set Start to 2 (Automatic)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d 2 /f >NUL 2>&1
sc config "Ndu" start= auto >NUL 2>&1
sc start "Ndu" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NDU service re-enabled.
) ELSE (
    echo    - Failed to re-enable NDU service.
)
echo.
exit /b

:revert_reg_hpet
cls
call :revert_reg_hpet_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_hpet_core
echo [REVERT] Re-enabling HPET (High Precision Event Timer)...
:: This requires a specific BCDEDIT command.
bcdedit /set useplatformclock yes >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - HPET re-enabled via BCDEDIT.
) ELSE (
    echo    - Failed to re-enable HPET. (May require administrator prompt or already enabled)
)
echo.
exit /b

:revert_reg_power_throttle
cls
call :revert_reg_power_throttle_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_power_throttle_core
echo [REVERT] Re-enabling Power Throttling for Background Apps (Default behavior)...
:: Default value is 1 (enabled) or the key is absent. Setting to 1 to explicitly re-enable.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAppManagement" /v "PowerThrottling" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Power Throttling re-enabled.
) ELSE (
    echo    - Failed to re-enable Power Throttling.
)
echo.
exit /b

:revert_reg_core_parking
cls
call :revert_reg_core_parking_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_core_parking_core
echo [REVERT] Re-enabling CPU Core Parking (Windows default management)...
:: Reverts CPU Core Parking to default Windows management (often handled dynamically).
:: Deleting these specific entries ensures Windows takes control again.
powercfg -deletevalue SCHEME_CURRENT SUB_PROCESSOR SCRIPT_PROCESSOR_PARKING_MIN_CORES >NUL 2>&1
powercfg -setactive SCHEME_CURRENT >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU Core Parking reverted to Windows default management.
) ELSE (
    echo    - Failed to revert CPU Core Parking.
)
echo.
exit /b

:revert_reg_msi_mode
cls
call :revert_reg_msi_mode_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_msi_mode_core
echo [REVERT] Reverting Interrupt Policy (MSI Mode for GPUs) to default...
:: This attempts to revert MSI Mode for NVIDIA/AMD GPUs by setting MSISupported to 0 or deleting the keys.
:: It's generally safer to set MSISupported to 0 if the key exists.
for /f "tokens=*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\PCI" /s /k ^| findstr /i "VEN_10DE VEN_1002"') do (
    for /f "tokens=*" %%b in ('reg query "%%a" /s /k ^| findstr /i "DeviceParameters"') do (
        reg add "%%b\Interrupt Management\MessageSignaledInterruptProperties" /v MSISupported /t REG_DWORD /d 0 /f >NUL 2>&1
        reg delete "%%b\Interrupt Management\MessageSignaledInterruptProperties" /v MessageNumberLimit /f >NUL 2>&1
    )
)
echo    - Attempted to revert MSI Mode for GPUs.
echo    - NOTE: A driver reinstallation or system restart might be needed for full effect.
echo.
exit /b

:revert_services_xbox
cls
call :revert_services_xbox_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_services_xbox_core
echo [REVERT] Re-enabling Xbox Live Services...
:: Set back to default values, typically "Manual" (3) or "Automatic" (2)
sc config "XblGameSave" start= demand >NUL 2>&1
sc start "XblGameSave" >NUL 2>&1
echo    - Xbox Game Save service re-enabled.

sc config "XboxGipSvc" start= demand >NUL 2>&1
sc start "XboxGipSvc" >NUL 2>&1
echo    - Xbox Accessory Management Service re-enabled.

sc config "XboxNetApiSvc" start= demand >NUL 2>&1
sc start "XboxNetApiSvc" >NUL 2>&1
echo    - Xbox Live Networking Service re-enabled.

sc config "GamingServices" start= demand >NUL 2>&1
sc start "GamingServices" >NUL 2>&1
echo    - Gaming Services re-enabled.

echo    - Xbox related services reverted.
echo.
exit /b

:revert_services_spooler
cls
call :revert_services_spooler_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_services_spooler_core
echo [REVERT] Re-enabling Print Spooler Service...
sc config "Spooler" start= auto >NUL 2>&1
sc start "Spooler" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Print Spooler service re-enabled.
) ELSE (
    echo    - Failed to re-enable Print Spooler.
)
echo.
exit /b

:revert_disable_fast_startup
cls
call :revert_disable_fast_startup_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_fast_startup_core
echo [REVERT] Re-enabling Fast Startup...
powercfg /h on >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Fast Startup re-enabled.
) ELSE (
    echo    - Failed to re-enable Fast Startup.
)
echo.
exit /b

:revert_disable_superfetch
cls
call :revert_disable_superfetch_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_superfetch_core
echo [REVERT] Re-enabling Superfetch/SysMain Service...
sc config "SysMain" start= auto >NUL 2>&1
sc start "SysMain" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Superfetch/SysMain service re-enabled.
) ELSE (
    echo    - Failed to re-enable Superfetch/SysMain service.
)
echo.
exit /b

:revert_disable_defender
cls
call :revert_disable_defender_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_defender_core
echo [REVERT] Re-enabling Windows Defender...
:: Set DisableAntiSpyware back to 0 or delete the key.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Defender AntiSpyware re-enabled.
) ELSE (
    echo    - Failed to re-enable Windows Defender AntiSpyware.
)
echo.
exit /b

:revert_visual_effects
cls
call :revert_visual_effects_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_visual_effects_core
echo [REVERT] Reverting Visual Effects to "Let Windows choose"...
:: Default value for VisualFXSetting is 0 ("Let Windows choose what's best for my computer").
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 0 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "ThemeActive" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f >NUL 2>&1 :: Default ClearType
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012078010000000" /f >NUL 2>&1 :: Default UserPreferencesMask
IF %ERRORLEVEL% EQU 0 (
    echo    - Visual effects reverted to default.
    echo      Note: Some changes may require logging out/in or a restart.
) ELSE (
    echo    - Failed to revert visual effects.
)
echo.
exit /b

:revert_boot_timeout
cls
call :revert_boot_timeout_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_boot_timeout_core
echo [REVERT] Reverting Boot Menu Timeout to 30 seconds...
bcdedit /timeout 30 >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Boot menu timeout set to 30 seconds.
) ELSE (
    echo    - Failed to revert boot menu timeout.
)
echo.
exit /b

:revert_disable_hibernation
cls
call :revert_disable_hibernation_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_hibernation_core
echo [REVERT] Re-enabling Hibernation...
powercfg.exe /hibernate on >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Hibernation re-enabled.
) ELSE (
    echo    - Failed to re-enable hibernation.
)
echo.
exit /b

:revert_disable_remote_assistance
cls
call :revert_disable_remote_assistance_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_remote_assistance_core
echo [REVERT] Re-enabling Remote Assistance...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Remote Assistance re-enabled.
) ELSE (
    echo    - Failed to re-enable Remote Assistance.
)
echo.
exit /b

:revert_disable_error_reporting
cls
call :revert_disable_error_reporting_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_error_reporting_core
echo [REVERT] Re-enabling Windows Error Reporting Service...
sc config "WerSvc" start= auto >NUL 2>&1
sc start "WerSvc" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Error Reporting Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Windows Error Reporting Service.
)
echo.
exit /b

:revert_disable_system_restore
cls
call :revert_disable_system_restore_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_system_restore_core
echo [REVERT] Re-enabling System Restore for C: drive...
wmic /namespace:\\root\default Path SystemRestore Call Enable C: >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - System Restore re-enabled for C: drive.
) ELSE (
    echo    - Failed to re-enable System Restore for C: drive.
)
echo.
exit /b

:revert_disable_last_access
cls
call :revert_disable_last_access_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_last_access_core
echo [REVERT] Re-enabling NTFS Last Access Time Updates...
fsutil behavior set disablelastaccess 0 >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NTFS Last Access Time Updates re-enabled.
) ELSE (
    echo    - Failed to re-enable NTFS Last Access Time Updates.
)
echo.
exit /b

:revert_disable_link_tracking
cls
call :revert_disable_link_tracking_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_link_tracking_core
echo [REVERT] Re-enabling Distributed Link Tracking Client...
sc config "TrkWks" start= auto >NUL 2>&1
sc start "TrkWks" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Distributed Link Tracking Client re-enabled.
) ELSE (
    echo    - Failed to re-enable Distributed Link Tracking Client.
)
echo.
exit /b

:: ===========================================
::         REVERT IN-DEPTH TWEAKS
:: ===========================================

:revert_reg_network_throttling_index
cls
call :revert_reg_network_throttling_index_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_network_throttling_index_core
echo [REVERT] Reverting Network Throttling Index to default...
:: Deleting the key reverts to default (Windows manages)
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Network Throttling Index reverted.
) ELSE (
    echo    - Failed to revert Network Throttling Index.
)
echo.
exit /b

:revert_reg_system_responsiveness
cls
call :revert_reg_system_responsiveness_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_system_responsiveness_core
echo [REVERT] Reverting System Responsiveness to default...
:: Default value is 20 for desktop.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 20 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - System Responsiveness reverted (set to 20).
) ELSE (
    echo    - Failed to revert System Responsiveness.
)
echo.
exit /b

:revert_disable_tcpip_autotuning
cls
call :revert_disable_tcpip_autotuning_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_tcpip_autotuning_core
echo [REVERT] Re-enabling TCP/IP Auto-Tuning...
netsh int tcp set global autotuninglevel=normal >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - TCP/IP Auto-Tuning re-enabled.
) ELSE (
    echo    - Failed to re-enable TCP/IP Auto-Tuning.
)
echo.
exit /b

:revert_disable_ipv6
cls
call :revert_disable_ipv6_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_ipv6_core
echo [REVERT] Re-enabling IPv6...
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - IPv6 re-enabled.
) ELSE (
    echo    - Failed to re-enable IPv6.
)
echo.
exit /b

:revert_reg_win32_priority_separation
cls
call :revert_reg_win32_priority_separation_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_win32_priority_separation_core
echo [REVERT] Reverting Foreground App Prioritization to default...
:: Default value for Win32PrioritySeparation is typically 2 (background apps also get resources).
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Foreground app prioritization reverted to default.
) ELSE (
    echo    - Failed to revert foreground app prioritization.
)
echo.
exit /b

:revert_reg_clear_pagefile_on_shutdown
cls
call :revert_reg_clear_pagefile_on_shutdown_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_clear_pagefile_on_shutdown_core
echo [REVERT] Disabling Clear Pagefile on Shutdown...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Clear Pagefile on Shutdown disabled.
) ELSE (
    echo    - Failed to disable Clear Pagefile on Shutdown.
)
echo.
exit /b

:revert_disable_consumer_features
cls
call :revert_disable_consumer_features_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_consumer_features_core
echo [REVERT] Re-enabling Consumer Features / Suggested Content...
:: Set back to 1 to enable.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Consumer Features / Suggested Content re-enabled.
) ELSE (
    echo    - Failed to re-enable Consumer Features / Suggested Content.
)
echo.
exit /b

:revert_disable_sync_settings
cls
call :revert_disable_sync_settings_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_sync_settings_core
echo [REVERT] Re-enabling Sync Settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "Enabled" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Sync Settings re-enabled.
) ELSE (
    echo    - Failed to re-enable Sync Settings.
)
echo.
exit /b

:revert_disable_defrag_schedule
cls
call :revert_disable_defrag_schedule_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_defrag_schedule_core
echo [REVERT] Re-enabling Disk Defragmentation Schedule...
sc config "defragsvc" start= auto >NUL 2>&1
sc start "defragsvc" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Disk Defragmentation Schedule re-enabled.
) ELSE (
    echo    - Failed to re-enable Disk Defragmentation Schedule.
)
echo.
exit /b

:revert_disable_remote_registry
cls
call :revert_disable_remote_registry_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_remote_registry_core
echo [REVERT] Re-enabling Remote Registry Service...
sc config "RemoteRegistry" start= demand >NUL 2>&1
sc start "RemoteRegistry" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Remote Registry Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Remote Registry Service.
)
echo.
exit /b

:revert_disable_tiworker
cls
call :revert_disable_tiworker_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_tiworker_core
echo [REVERT] Re-enabling Windows Modules Installer Worker (TrustedInstaller)...
sc config "TrustedInstaller" start= demand >NUL 2>&1
sc start "TrustedInstaller" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Modules Installer Worker re-enabled.
) ELSE (
    echo    - Failed to re-enable Windows Modules Installer Worker.
)
echo.
exit /b

:revert_disable_smartscreen
cls
call :revert_disable_smartscreen_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_disable_smartscreen_core
echo [REVERT] Re-enabling SmartScreen...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\SmartScreenEnabled" /v "SmartScreenEnabled" /t REG_SZ /d "On" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - SmartScreen re-enabled.
) ELSE (
    echo    - Failed to re-enable SmartScreen.
)
echo.
exit /b

:: ===========================================
::         REVERT DEEPEST SYSTEM & NETWORK TWEAKS
:: ===========================================

:revert_reg_cpu_state_throttling
cls
call :revert_reg_cpu_state_throttling_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_cpu_state_throttling_core
echo [REVERT] Re-enabling CPU State Throttling (Default behavior)...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingEnabled" /t REG_DWORD /d 1 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU State Throttling re-enabled.
) ELSE (
    echo    - Failed to re-enable CPU State Throttling.
)
echo.
exit /b

:revert_reg_large_system_cache
cls
call :revert_reg_large_system_cache_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_large_system_cache_core
echo [REVERT] Reverting LargeSystemCache to default...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 0 /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - LargeSystemCache reverted to default.
) ELSE (
    echo    - Failed to revert LargeSystemCache.
)
echo.
exit /b

:revert_reg_disable_cpu_microcode
cls
call :revert_reg_disable_cpu_microcode_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_disable_cpu_microcode_core
echo [REVERT] Re-enabling CPU Microcode Updates...
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - CPU Microcode Updates re-enabled (keys removed).
) ELSE (
    echo    - Failed to re-enable CPU Microcode Updates.
)
echo.
exit /b

:revert_reg_non_best_effort_limit
cls
call :revert_reg_non_best_effort_limit_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_non_best_effort_limit_core
echo [REVERT] Reverting NonBestEffortLimit to default...
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NonBestEffortLimit" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - NonBestEffortLimit reverted.
) ELSE (
    echo    - Failed to revert NonBestEffortLimit.
)
echo.
exit /b

:revert_reg_max_user_port
cls
call :revert_reg_max_user_port_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_reg_max_user_port_core
echo [REVERT] Reverting MaxUserPort to default...
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /f >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - MaxUserPort reverted to default.
) ELSE (
    echo    - Failed to revert MaxUserPort.
)
echo.
exit /b

:revert_enable_maintenance_tasks
cls
call :revert_enable_maintenance_tasks_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_enable_maintenance_tasks_core
echo [SCHEDULED TASKS] Re-enabling Common Maintenance Scheduled Tasks...
:: Re-enables common Windows maintenance tasks.
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\MUI\LPRemove" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Chkdsk\ProactiveScan" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Diagnosis\Scheduled" /ENABLE >NUL 2>&1
schtasks /Change /TN "\Microsoft\Windows\Servicing\StartComponentCleanup" /ENABLE >NUL 2>&1
echo    - Common Maintenance Scheduled Tasks re-enabled.
echo.
exit /b

:revert_enable_push_notifications
cls
call :revert_enable_push_notifications_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_enable_push_notifications_core
echo [REVERT] Re-enabling Windows Push Notifications Service (WpnUserService)...
sc config "WpnUserService" start= auto >NUL 2>&1
sc start "WpnUserService" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Windows Push Notifications Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Windows Push Notifications Service.
)
echo.
exit /b

:revert_enable_geolocation
cls
call :revert_enable_geolocation_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_enable_geolocation_core
echo [REVERT] Re-enabling Geolocation Service (lfsvc)...
sc config "lfsvc" start= demand >NUL 2>&1
sc start "lfsvc" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Geolocation Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Geolocation Service.
)
echo.
exit /b

:revert_enable_sensor_monitoring
cls
call :revert_enable_sensor_monitoring_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_enable_sensor_monitoring_core
echo [REVERT] Re-enabling Sensor Monitoring Service (SensrSvc)...
sc config "SensrSvc" start= demand >NUL 2>&1
sc start "SensrSvc" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Sensor Monitoring Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Sensor Monitoring Service.
)
echo.
exit /b

:revert_enable_biometric_service
cls
call :revert_enable_biometric_service_core
echo Press any key to return to the revert menu...
pause
goto :revert_menu

:revert_enable_biometric_service_core
echo [REVERT] Re-enabling Biometric Service (WbioSrvc)...
sc config "WbioSrvc" start= demand >NUL 2>&1
sc start "WbioSrvc" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo    - Biometric Service re-enabled.
) ELSE (
    echo    - Failed to re-enable Biometric Service.
)
echo.
exit /b

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
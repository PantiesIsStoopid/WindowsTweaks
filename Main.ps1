# Windows Performance Optimization Script Documentation

This script is designed to optimize the performance of a Windows machine by disabling unnecessary services, applying network optimizations, tweaking system settings, and running performance tools. The script is split into two parts: **Disabling Services and Network Optimizations** and **Tweaks, Registry Changes, and Final Instructions**.

---

## Part 1: Disable Specified Services

### Overview

This section of the script disables a list of unnecessary or resource-consuming services that run in the background. Disabling these services can help improve the system’s performance by freeing up system resources.

### Services Disabled

The following services are disabled:

1. **Auto Time Zone Updater (`tzautoupdate`)**
2. **AVCTP Service (`bthavctp`)** - Prevents issues with wireless headphones.
3. **BitLocker Drive Encryption Service (`BDESVC`)**
4. **Certificate Propagation (`CertPropSvc`)**
5. **Block Level Backup Engine Service (`wbengine`)**
6. **Cellular Time (`tapisrv`)**
7. **Telemetry (`DiagTrack`)** - Sends system data to Microsoft.
8. **Downloaded Maps Manager (`MapsBroker`)**
9. **Fax (`Fax`)**
10. **File History Service (`fhsvc`)**
11. **IP Helper (`iphlpsvc`)**
12. **Keyboard Filter (`kbdhid`)**
13. **Netlogon (`Netlogon`)**
14. **Parental Control (`WpcSvc`)**
15. **Print Spooler (`Spooler`)**
16. **Remote Registry (`RemoteRegistry`)**
17. **TCP/IP NetBIOS Helper (`lmhosts`)**
18. **Touch Keyboard and Handwriting (`TabletInputService`)**
19. **Contact Data (`PimIndexMaintenanceSvc`)**
20. **Encrypting File System (`EFS`)**
21. **Geolocation Service (`lfsvc`)**
22. **Microsoft Edge Elevation Service (`MicrosoftEdgeElevationService`)**
23. **Microsoft Edge Update (`edgeupdate`)**
24. **Microsoft Update Health Service (`UsoSvc`)**
25. **Secondary Logon (`seclogon`)**
26. **Smart Card Services (`SCardSvr`)**
27. **Windows Backup (`wbengine`)**
28. **Windows Insider Service (`wisvc`)**
29. **Windows Search (`WSearch`)**

### How it Works

- The script iterates through the list of services in the `$ServicesToDisable` array.
- For each service, the script sets the startup type to `Disabled` and forcibly stops the service using `Stop-Service`.
- The `ErrorAction SilentlyContinue` flag is used to suppress errors in case a service is already stopped or missing.

---

## Part 2: Tweaks, Registry Changes, and Final Instructions

### Overview

This section performs various optimizations including registry tweaks, TCP optimizations, and running additional performance tools.

### TCP Heuristics and Optimizations

1. **Disabling TCP Heuristics:**
   - The `netsh` command is used to disable TCP heuristics, which control dynamic adjustments to TCP settings based on network conditions. Disabling these can improve network performance by preventing automatic adjustments that may not suit the system's needs.
   - Command:
     ```bash
     netsh interface tcp set heuristics disabled
     ```

2. **Running TCP Optimizer:**
   - The script runs an external utility, TCP Optimizer, located in the `SourceApps/tcpoptimizer.exe` path. TCP Optimizer helps adjust various TCP/IP parameters like MTU, window size, and more.

### ISLC (Interrupt Service Latency Control)

- The user is instructed to move the ISLC tool to the Desktop and set the **Timer Resolution** to `0.50ms` for improved system responsiveness. 
- It is recommended to run ISLC on every system boot to keep the timer resolution optimal.

### Registry Tweaks

Several registry tweaks are applied to enhance system performance and responsiveness:

1. **Global Timer Resolution:**
   - Sets the global timer resolution to `1ms` to improve system responsiveness.
   - Registry path:
     ```plaintext
     HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
     ```

2. **Memory Management and Power Settings:**
   - Sets `PagingFiles` for better memory management.
   - Adjusts the active power scheme to favor high performance.
   - Registry paths:
     ```plaintext
     HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management
     HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes
     ```

3. **Visual Effects and Animations:**
   - Disables unnecessary animations like taskbar and window animations to free up system resources.
   - Registry path:
     ```plaintext
     HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects
     ```

4. **Network Throttling:**
   - Disables network throttling to avoid limitations on bandwidth.
   - Registry path:
     ```plaintext
     HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
     ```

5. **System Responsiveness:**
   - Tweaks system responsiveness settings for real-time tasks like gaming and high-performance applications.
   - Registry path:
     ```plaintext
     HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
     ```

### Miscellaneous Batch File

The batch file executes additional optimizations:

- Disables unnecessary visual effects like fading and sliding menus.
- Adjusts network settings like maximum connections per server and DNS priority.
- Tweaks TCP settings for improved networking.

### Final Instructions

1. **Restart the System:**
   - After executing the script, it is recommended to restart your system to apply all changes. This will ensure that all optimizations take full effect.

### Conclusion

After executing both parts of the script, the system will be optimized for performance with the following benefits:
- Disabled unnecessary services to free up system resources.
- Improved network settings for faster and more stable connections.
- Registry tweaks to enhance system responsiveness, memory management, and power efficiency.
- Disabled visual effects and animations to reduce resource consumption.
- Optimized system power settings for high performance.

The user is advised to restart the system for all changes to take full effect. This will ensure that all settings are applied and the system operates with the best performance possible.

---

### Usage Instructions

To run the script:
1. **Save the script as a `.ps1` (PowerShell script) file**:
   - Make sure to save the script in `.ps1` format for it to be executable in PowerShell.

2. **Run the script as Administrator**:
   - Right-click the script file and select **Run as Administrator** to ensure that all required system settings and services can be modified.

3. **Follow On-Screen Instructions**:
   - The script will guide you through the process of applying optimizations, including running the external utilities like TCP Optimizer and ISLC.

4. **Restart Your System**:
   - After the script finishes, restart the system to apply all the changes.

**Important Notes:**
- **Backup your system**: It is always a good idea to create a backup or system restore point before running any optimization script, especially if it involves registry modifications.
- **Understand the Changes**: This script makes various changes to system settings and services. If you are unsure about any of the modifications, consult with an IT professional before proceeding.
- **Running the script multiple times**: If you run the script multiple times, it will continue to disable the same services and apply the same optimizations. Be mindful that certain settings may already be applied and may not need to be run again.

---

### Additional Considerations

1. **Service Dependencies**:
   - Before disabling services, it's important to check whether any of the services being disabled are required for specific applications or hardware features on your system. Some services may be required by third-party applications or device drivers.

2. **System Compatibility**:
   - The optimizations performed by the script should be compatible with most versions of Windows, including Windows 10 and Windows 11. However, there may be slight variations in service names and registry paths between different versions of Windows. 

3. **Performance Monitoring**:
   - After running the script and restarting the system, you can monitor the performance improvements using built-in tools like Task Manager and Resource Monitor. Check the CPU, memory, and network usage to verify that the optimizations are taking effect.

4. **Reverting Changes**:
   - If for any reason the optimizations cause issues with your system, you can manually revert the changes or restore your system to a previous state using the restore point created before running the script.

---

By following this guide, the user will significantly improve the performance of their Windows machine with minimal intervention. These optimizations focus on reducing resource consumption, improving network speeds, and fine-tuning system settings for better responsiveness and efficiency.

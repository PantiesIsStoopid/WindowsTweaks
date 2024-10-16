# Optimization and Cleanup Guide

This document provides a comprehensive guide to optimizing your Windows system through BIOS settings, reinstallation, system tweaks, GPU optimizations, service management, internet enhancements, timer resolution, and cleanup. Follow the steps in each section to enhance performance and maintain a clean system.

**Disclaimer:** I am not liable for any damages to your computer.

## 1. Optimizing BIOS Settings for Enhanced Performance

### Steps for 1

1. **Enter BIOS Setup**: Restart your computer and access the BIOS/UEFI setup by pressing the appropriate key (usually Delete, F2, or Esc) during startup.
2. **Enable XMP/DOCP**:
   - Navigate to the memory settings.
   - Find and enable XMP (for Intel systems) or DOCP (for AMD systems) to allow your RAM to operate at its rated speed.
3. **Activate HPET**: Locate the option for High Precision Event Timer (HPET) and enable it.
4. **Enable Game Boost/Mode**: If available, enable Game Boost or similar performance mode for automatic overclocking.
5. **Enable Resizable BAR**: Enable the Resizable BAR option in PCIe settings.
6. **Set M.2 PCIe Lane Source to CPU**: Ensure the PCIe lane source is set to CPU for M.2 SSDs.
7. **Enable USB Standby Power**: Navigate to the USB settings and enable standby power for charging devices while the system is off.

---

## 2. Reinstall Windows

### Warning

**This process will erase all data on the selected drive and USB. Please ensure you have backed up any important information.**

### Steps for 2

1. **Merging ISO with XML**:
   - Download Windows 11 ISO: [Windows 11 Download](https://www.microsoft.com/en-us/software-download/windows11)
   - Download AnyBurn: [AnyBurn Download](https://www.anyburn.com/download.php)
   - Open AnyBurn and select the downloaded ISO file.
   - Add the autounattend.xml file by clicking “Add.”
   - Click “Next,” then “Create Now.” Confirm to overwrite the ISO file if prompted.
   - Close AnyBurn once the process is complete.

2. **Creating a Bootable USB Drive**:
   - Use a USB drive with at least 8 GB of storage.
   - Download Rufus: [Rufus Download](https://rufus.ie/en/)
   - Open Rufus and select your USB drive.
   - Select the ISO file you created and click the "Start" button.
   - Wait for the process to complete.

3. **Downloading Your Browser**:
   - Access the shortcut on your desktop once Rufus completes.
   - Follow the prompts to download your preferred browser.
   - Troubleshoot by restarting your computer if errors occur.

---

## 3. System Optimization Steps

### Steps for 3

1. **Create a Restore Point**: Create a restore point for safety before making any changes.
2. **Uninstall Unnecessary Apps**: Remove any applications you don’t need.
3. **Manage Startup Apps**: Disable unnecessary applications from launching on startup.
4. **Use Autoruns**: Open Autoruns and disable unnecessary startup entries (do not disable `cmd.exe` or GPU-related settings).
5. **Disable User Account Control (UAC)**: Double-click the UAC setting to disable it.
6. **Run Latency BCD Tweak**: Run as an administrator.
7. **Optimize Windows Settings**: Double-click to optimize all Windows settings.
8. **Adjust Performance Options**: Select "Adjust for best performance" in Performance Options.
9. **Configure Sound Settings**: Disable all output devices except for your headphones or speakers.
10. **Adjust Mouse Settings**: Uncheck "Enhance pointer precision" in Mouse Settings.
11. **Run MarkC Windows Fix**: Apply the fix.
12. **Use WinUtil Tweaks**: Select Standard and set your DNS to Cloudflare.
13. **Apply the Tweaks**: Run the selected tweaks.
14. **Activate Ultimate Profile**: Click Add and activate the profile.
15. **Open System Configuration**: Press `Win + R`, type `msconfig`, and hit Enter.
16. **Configure Boot Settings**: Check Advanced Options and set the number of processors to the maximum available; set the timeout to 10 seconds.
17. **Manage Optional Features**: Remove all features except for Notepad.

---

## 4. GPU Tweaks

### Steps for 4

1. **Open NVcleanstall**.
2. **Select the Best Driver**: Choose the recommended driver for your hardware.
3. **Tick the Following Boxes**:
   - Disable installer telemetry and advertising
   - Unattended express installation and allow automatic reboot
   - Perform a clean installation
   - Disable MPO
   - Disable Ansel
   - Show expert tweaks
   - Disable driver telemetry
   - Enable message signal interrupts and set interrupt priority to high
   - Disable HDCP
4. **Rebuild the Digital Signature**.
5. **Use the Method Compatible with Easy AntiCheat**.
6. **Automatically Accept Driver Unsigned Warnings**.
7. **Click "Next" and then "Install."**
8. **Drag the Base Profile** over NVIDIA Profile Inspector, then release.

---

## 5. Tweaking Utility

### Steps for 5

- [Add specific steps for the utility here as needed.]

---

## 6. Disabling Services

### Steps for 6

1. To disable a service:
   - Double-click the service.
   - Click on "Startup type" and select "Disable."

### Services to Disable

- Auto Time Zone Updater
- AVCTP Service (Breaks Wireless Headphones)
- BitLocker Drive Encryption Service
- Certificate Propagation
- Block Level Backup Engine Service
- Cellular Time
- Connect User Experiences and Telemetry
- Downloaded Maps Manager
- Fax
- File History Service
- IP Helper
- Microsoft Keyboard Filter
- Netlogon
- Parental Control
- Print Spooler
- Remote Registry
- TCP/IP NetBIOS Helper
- Touch Keyboard and Handwriting
- Contact Data_ea4df
- Encrypting File System (EFS)
- Geolocation
- Microsoft Edge Elevation Service (MicrosoftEdgeElevationService)
- Microsoft Edge Update Service (edgeupdate)
- Microsoft Update Health Service
- All remote services (if you don't use them)
- Secondary Logon
- All Smart Card services
- If using HDD, enable SysMain
- Windows Backup
- Windows Insider Service
- Windows Search

---

## 7. Internet Tweaks

### Steps for 7

1. **Run Tweak as Administrator**.
2. **Note**: The following steps will only work for Ethernet, not Wi-Fi.
3. **Search for "View Network Connections."**
4. **Double-click Your Adapter**.
5. **Click on "Internet Protocol Version 4."**
6. **Click "Advanced," then go to the "WINS" Tab**:
   - Uncheck "LM Hosts Lookup."
   - Disable "NetBIOS over TCP/IP."
7. **Disable the Following**:
   - Advanced Experiences
   - Energy Efficient Ethernet
   - Green Ethernet
   - Low Power Mode
8. **Run TCP Optimizer as Administrator**.
9. **Copy Settings from TCP 1 Image**.
10. **Select "Advanced" from the Top**.
11. **Copy Settings from TCP 2 Image**.

---

## 8. Timer Resolution

### Steps for 8

1. **Open TimerResolution**.
2. **Double-click "Fix," then Run it and Restart Your PC**.
3. **Move the Two Programs to Your C Drive**.
4. **Open Folder 3, then Open PowerShell as Administrator**.
5. **Open Rufus as Administrator** and copy the required text into PowerShell and hit Enter.
6. **Open Prime95** and select "Just Stress Testing."
   - Choose the second option and hit OK.
7. **Open a New PowerShell Window**:
   - Type `powershell` and hit Enter.
   - Type:

     ```powershell
     cd ..
     cd ..
     cd ..
     ```

   - Then type `.\bench.ps1` and hit Enter.
   - Type `r` and hit Enter.
8. **Wait for Roughly 10 Minutes**.
9. **In Your C Drive, Open the "Results" Folder**:
   - Look at the second column and find the smallest number.
   - Remember the value next to that number.
10. **Open ISLC**:
    - Set "Free Memory" to lower than half your total system memory.
    - Set "Wanted Timer Resolution" to the value from earlier and set the polling rate to 250.

---

## 9. Clean Up

### Steps for 9

1. **Download BleachBit**: [BleachBit Download](https://www.bleachbit.org/download/windows).
2. **Install the Program**: Open the installer and install BleachBit.
3. **Clean with BleachBit**: Select all boxes and click "Clean." (This process can take a long time.)
4. **Run Disk Cleanup**: Search for "Disk Cleanup."
5. **Select All Boxes and Click "OK."**

---

## Important Notes

- Always back up important data before making significant changes to your system.
- Monitor system performance after applying these optimizations and tweaks to ensure effectiveness.

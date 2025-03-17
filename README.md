# Windows Installation and Optimization Script

Compile some good tweaks that can increase windows speed.Only tested on windows 11.

TODO:

- [ ] add nvidia profiles

## Overview

This PowerShell script automates a clean Windows installation, driver setup, application installation, and system tweaks. It is designed to optimize performance by applying customizations and recommended settings.

## Prerequisites

- A stable internet connection.
- Administrator privileges.
- A Windows ISO file (if performing a clean install).
- A USB drive for installation media (if performing a clean install).

## Script Flow

The script follows these key steps:

1. **Prompt for Clean Installation**
2. **Perform Clean Installation (if chosen)**
3. **Install Drivers**
4. **Install Applications**
5. **Apply System Tweaks**
6. **Restart and Final Optimizations**

---

## Step 1: Prompt for Clean Installation

The script first prompts the user about whether they want to perform a clean installation of Windows.

```powershell
$Choice = Read-Host "It is recommended to start with a clean reinstall. Do you want to do a clean install? (Y/N)"
```

- If **Yes (Y/y)** is selected, the script:
  - Displays installation steps.
  - Runs an external script to apply tweaks.
  - Guides the user through creating a bootable USB and reinstalling Windows.
- If **No (N/n)** is selected, the script:
  - Moves on to driver installation.

---

## Step 2: Perform Clean Installation

If the user chooses a clean install, the script performs the following actions:

1. Sets execution policy:

   ```powershell
   Set-ExecutionPolicy Unrestricted -Force
   ```

2. Runs the Windows installation tweak script:

   ```powershell
   Invoke-RestMethod "https://github.com/memstechtips/WIMUtil/raw/main/src/WIMUtil.ps1" | Invoke-Expression
   ```

3. Displays step-by-step installation instructions:

   ```powershell
   $Steps = @(
     "1. Select or Download Windows ISO",
     "2. Add Latest UnattendedWinstall Answer File Automatically",
     "3. Extract and Add Current Device Drivers to Installation Media",
     "4. Create New ISO with Customizations Included",
     "5. Create a Bootable USB Flash Drive with Ventoy",
     "6. Copy the New ISO File to the Ventoy Flash Drive",
     "7. Boot from the USB flash drive, choose your ISO & Install Windows"
   )
   ```

---

## Step 3: Install Drivers

The script then prompts the user about their GPU type.

### NVIDIA GPU

- If the user has an NVIDIA GPU, the script provides links to:
  - Official NVIDIA drivers: [NVIDIA Drivers](https://www.nvidia.com/en-us/drivers/)
  - NVCleanstall: [TechPowerUp NVCleanstall](https://www.techpowerup.com/download/techpowerup-nvcleanstall/)
- Provides instructions on using NVCleanstall to remove unnecessary driver components.

### AMD or Other GPU

- If the user does **not** have an NVIDIA GPU, drivers will be installed later in the process.

---

## Step 4: Install Applications

The script prompts the user to install applications:

```powershell
Write-Host "Are you ready to install your applications?"
Read-Host "Press Enter to continue..."
```

It then applies system tweaks and suggests setting DNS to **Cloudflare** for better performance.

---

## Step 5: Apply System Tweaks

- Runs the Windows system tweaks script:

  ```powershell
  Invoke-RestMethod "https://christitus.com/win" | Invoke-Expression
  ```

- Executes the **EXM Free Tweaking Utility**:

  ```powershell
  Start-Process -FilePath "Submodules\EXM Free Tweaking Utility V9.0.cmd" -Wait
  ```

---

## Step 6: Restart and Final Optimizations

The script prompts the user to restart the computer:

```powershell
$Restart = Read-Host "For the next steps, restart your computer and return here. Have you restarted? (Y/N)"
```

- If restarted, it applies final optimizations based on GPU type:

  - **NVIDIA Users:** Modifies registry settings to disable HDCP:

    ```powershell
    $RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000"
    $ValueName = "RMHdcpKeyGlobZero"
    if (Test-Path $RegPath) {
      $Value = Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction SilentlyContinue
      if ($Value) {
        Set-ItemProperty -Path $RegPath -Name $ValueName -Value 1
      } else {
        New-ItemProperty -Path $RegPath -Name $ValueName -PropertyType DWORD -Value 1 -Force
      }
    }
    ```

  - **AMD Users:** Instructs users to disable HDCP manually in AMD Software.

- If not restarted, the script prevents further execution:

  ```powershell
  Write-Host "You cannot proceed until you restart your computer." -ForegroundColor Red
  ```

---

## Conclusion

This script automates the process of clean Windows installation, driver setup, application installation, and system optimization. It ensures optimal performance and a streamlined setup experience.

### Notes

- **Use this script responsibly** and ensure you have backups before making major system changes.
- **Tweaks are optional** and can be modified based on user preference.
- **Make sure to follow restart prompts** to ensure all settings are properly applied.

**Enjoy your optimized Windows experience!** 🚀

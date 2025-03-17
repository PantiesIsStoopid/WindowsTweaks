# Prompt the user about clean installation
$Choice = Read-Host "It is recommended to start with a clean reinstall. Do you want to do a clean install? (Y/N)"

if ($Choice -match "^[Yy]$") {
  Write-Host "After the clean reinstall, please respond 'No' to this prompt." -ForegroundColor Red
  Write-Host "To get the best results, use this script to apply some tweaks during installation:" -ForegroundColor Green
  
  # Set execution policy and execute external script
  Set-ExecutionPolicy Unrestricted -Force
  Invoke-RestMethod "https://github.com/memstechtips/WIMUtil/raw/main/src/WIMUtil.ps1" | Invoke-Expression

  # Display installation steps
  $Steps = @(
    "1. Select or Download Windows ISO",
    "2. Add Latest UnattendedWinstall Answer File Automatically",   
    "3. Extract and Add Current Device Drivers to Installation Media",
    "4. Create New ISO with Customizations Included",
    "5. Create a Bootable USB Flash Drive with Ventoy",
    "6. Copy the New ISO File to the Ventoy Flash Drive",
    "7. Boot from the USB flash drive, choose your ISO & Install Windows"
  )

  $Steps | ForEach-Object { Write-Host $_ -ForegroundColor Yellow }
}
else {
  Write-Host "Skipping clean install." -ForegroundColor Yellow 
  Write-Host "First, we will properly reinstall drivers."

  # Prompt for GPU type
  $GPU = Read-Host "Do you have an NVIDIA GPU? (Y/N)"

  if ($GPU -match "^[Yy]$") {
    Write-Host "Go to the following site to install the drivers:" -ForegroundColor Green
    Write-Host "https://www.nvidia.com/en-us/drivers/" -ForegroundColor Blue
    Read-Host "Press Enter to continue..."

    Write-Host "To strip down the driver and remove unnecessary components, install:" -ForegroundColor Green
    Write-Host "https://www.techpowerup.com/download/techpowerup-nvcleanstall/" -ForegroundColor Blue

    Write-Host "Instructions for NVCleanstall:"
    Write-Host "- Open NVCleanstall and select the .exe from the NVIDIA site."
    Write-Host "- Click 'Next' and select 'Recommended' along with 'Visual C++ 2017 Runtime'."
    Write-Host "- The rest of the settings are based on preference."
    
    Write-Host "Recommended settings to check:"
    Write-Host "- Disable telemetry"
    Write-Host "- Unattended express install"
    Write-Host "- Disable MPO"
    Write-Host "- You can disable Ansel"
    Write-Host "- Show expert tweaks"
    Write-Host "- Enable Message Signaled Interrupts and set to high"
    Write-Host "- Disable HDCP"
    Write-Host "- Rebuild signature"
    Write-Host "- Use method with Easy Anti-Cheat"
    Write-Host "- Auto-accept unsigned driver"
  }
  else {
    Write-Host "Your drivers will be installed in a later step."
  }
}

# Prompt for application installation
Write-Host "Are you ready to install your applications?"
Read-Host "Press Enter to continue..."

Write-Host "After the selected apps have been installed, proceed to the tweaks section to customize your system." 
Write-Host "Additionally, set your DNS to Cloudflare for better performance."
Read-Host "Press Enter to continue..."

# Execute system tweaks script
Invoke-RestMethod "https://christitus.com/win" | Invoke-Expression

# Run EXM Tweaking Utility
Write-Host "Running EXM Tweaking Utility..."
Start-Process -FilePath "Submodules\EXM Free Tweaking Utility V9.0.cmd" -Wait

# Prompt for restart
$Restart = Read-Host "For the next steps, restart your computer and return here. Have you restarted? (Y/N)"

if ($Restart -match "^[Yy]$") {
  if ($GPU -match "^[Yy]$") {
    $RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000"
    $ValueName = "RMHdcpKeyGlobZero"
    
    # Modify registry settings for NVIDIA users
    if (Test-Path $RegPath) {
      $Value = Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction SilentlyContinue
      if ($Value) {
        Set-ItemProperty -Path $RegPath -Name $ValueName -Value 1
      } else {
        New-ItemProperty -Path $RegPath -Name $ValueName -PropertyType DWORD -Value 1 -Force
      }
    } else {
      Write-Host "Registry path does not exist."
    }
  }
  else {
    Write-Host "For AMD GPUs, open AMD Software, go to Display -> Overrides -> Disable HDCP."
  }
}
else {
  Write-Host "You cannot proceed until you restart your computer." -ForegroundColor Red
}

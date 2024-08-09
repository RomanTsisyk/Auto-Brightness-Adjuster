# Define the function to set the brightness
function Set-Brightness {
    param (
        [int]$brightness
    )

    # Use WMI to set the brightness
    $monitor = Get-WmiObject -Namespace root/wmi -Class WmiMonitorBrightnessMethods
    $monitor.WmiSetBrightness(1, $brightness)
}

# Provide a description of the script's functionality to the user
function Show-Description {
    $description = @"
This script automatically adjusts the screen brightness based on the time of day:
- 6:00 AM - 8:00 AM: Brightness gradually increases to 70%.
- 8:00 AM - 12:00 PM: Brightness increases to 100%.
- 12:00 PM - 5:00 PM: Brightness decreases to 80%.
- 5:00 PM - 7:00 PM: Brightness gradually decreases to 50%.
- 7:00 PM - 10:00 PM: Brightness decreases to 30%.
- 10:00 PM - 6:00 AM: Brightness decreases to 10% for nighttime.

Press Enter to continue.
"@
    Write-Host $description
    Read-Host
}

# Logging the script execution
$logPath = "C:\temp\brightness_log.txt"
Add-Content -Path $logPath -Value "Starting script at $(Get-Date)"

try {
    Show-Description
    
    # Determine the current time of day
    $currentHour = (Get-Date).Hour

    # Logic for adjusting brightness based on the time of day
    if ($currentHour -ge 6 -and $currentHour -lt 8) {
        Set-Brightness -brightness 70
        Add-Content -Path $logPath -Value "Set brightness to 70% at $currentHour:00"
    } elseif ($currentHour -ge 8 -and $currentHour -lt 12) {
        Set-Brightness -brightness 100
        Add-Content -Path $logPath -Value "Set brightness to 100% at $currentHour:00"
    } elseif ($currentHour -ge 12 -and $currentHour -lt 17) {
        Set-Brightness -brightness 80
        Add-Content -Path $logPath -Value "Set brightness to 80% at $currentHour:00"
    } elseif ($currentHour -ge 17 -and $currentHour -lt 19) {
        Set-Brightness -brightness 50
        Add-Content -Path $logPath -Value "Set brightness to 50% at $currentHour:00"
    } elseif ($currentHour -ge 19 -and $currentHour -lt 22) {
        Set-Brightness -brightness 30
        Add-Content -Path $logPath -Value "Set brightness to 30% at $currentHour:00"
    } elseif ($currentHour -ge 22 -or $currentHour -lt 6) {
        Set-Brightness -brightness 10
        Add-Content -Path $logPath -Value "Set brightness to 10% at $currentHour:00"
    } else {
        Add-Content -Path $logPath -Value "Unexpected time detected: $currentHour"
    }
}
catch {
    Add-Content -Path $logPath -Value "An error occurred: $_"
}

Add-Content -Path $logPath -Value "Script completed at $(Get-Date)"

# Keep the window open to view the results
Read-Host "Press Enter to exit"
# Define the function to set the brightness
function Set-Brightness {
    param (
        [int]$brightness
    )

    # Use WMI to set the brightness
    $monitor = Get-WmiObject -Namespace root/wmi -Class WmiMonitorBrightnessMethods
    $monitor.WmiSetBrightness(1, $brightness)
}

# Provide a description of the script's functionality to the user
function Show-Description {
    $description = @"
This script automatically adjusts the screen brightness based on the time of day:
- 6:00 AM - 8:00 AM: Brightness gradually increases to 70%.
- 8:00 AM - 12:00 PM: Brightness increases to 100%.
- 12:00 PM - 5:00 PM: Brightness decreases to 80%.
- 5:00 PM - 7:00 PM: Brightness gradually decreases to 50%.
- 7:00 PM - 10:00 PM: Brightness decreases to 30%.
- 10:00 PM - 6:00 AM: Brightness decreases to 10% for nighttime.

Press Enter to continue.
"@
    Write-Host $description
    Read-Host
}

# Logging the script execution
$logPath = "C:\temp\brightness_log.txt"
Add-Content -Path $logPath -Value "Starting script at $(Get-Date)"

try {
    Show-Description
    
    # Determine the current time of day
    $currentHour = (Get-Date).Hour

    # Logic for adjusting brightness based on the time of day
    if ($currentHour -ge 6 -and $currentHour -lt 8) {
        Set-Brightness -brightness 70
        Add-Content -Path $logPath -Value "Set brightness to 70% at $currentHour:00"
    } elseif ($currentHour -ge 8 -and $currentHour -lt 12) {
        Set-Brightness -brightness 100
        Add-Content -Path $logPath -Value "Set brightness to 100% at $currentHour:00"
    } elseif ($currentHour -ge 12 -and $currentHour -lt 17) {
        Set-Brightness -brightness 80
        Add-Content -Path $logPath -Value "Set brightness to 80% at $currentHour:00"
    } elseif ($currentHour -ge 17 -and $currentHour -lt 19) {
        Set-Brightness -brightness 50
        Add-Content -Path $logPath -Value "Set brightness to 50% at $currentHour:00"
    } elseif ($currentHour -ge 19 -and $currentHour -lt 22) {
        Set-Brightness -brightness 30
        Add-Content -Path $logPath -Value "Set brightness to 30% at $currentHour:00"
    } elseif ($currentHour -ge 22 -or $currentHour -lt 6) {
        Set-Brightness -brightness 10
        Add-Content -Path $logPath -Value "Set brightness to 10% at $currentHour:00"
    } else {
        Add-Content -Path $logPath -Value "Unexpected time detected: $currentHour"
    }
}
catch {
    Add-Content -Path $logPath -Value "An error occurred: $_"
}

Add-Content -Path $logPath -Value "Script completed at $(Get-Date)"

# Keep the window open to view the results
Read-Host "Press Enter to exit"

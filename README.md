# Auto Brightness Adjuster

This PowerShell script automatically adjusts the screen brightness based on the time of day. It is particularly useful for those who want to reduce eye strain and save battery life by optimizing screen brightness throughout the day.

## Features

- Automatically increases brightness in the morning.
- Maximizes brightness during midday.
- Gradually decreases brightness towards the evening.
- Minimizes brightness during nighttime hours.
- Easy setup using Windows Task Scheduler for automated execution.

## Getting Started

### Prerequisites

- Windows operating system.
- PowerShell (pre-installed on Windows 7 and above).

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/RomanTsisyk/Auto-Brightness-Adjuster.git
   ```

2. **Navigate to the directory:**

   ```bash
   cd Auto-Brightness-Adjuster
   ```

3. **Edit the Script (Optional):**

   You can modify the time intervals or brightness levels in the `AutoBrightness.ps1` script to suit your preferences.

### Usage

#### Running the Script Manually

1. **Open PowerShell as Administrator:**

   - Press `Windows + X` and select **Windows PowerShell (Admin)**.

2. **Run the Script:**

   ```powershell
   .\AutoBrightness.ps1
   ```

   The script will prompt you to press Enter to start, and it will automatically adjust the brightness based on the current time of day.

#### Setting Up with Task Scheduler

1. **Open Task Scheduler:**
   - Press `Windows + R`, type `taskschd.msc`, and press Enter.

2. **Create a New Task:**
   - In Task Scheduler, click on **Create Task**.
   - Name the task, e.g., "Auto Brightness Adjuster".
   - Select **Run whether user is logged on or not**.
   - Check **Run with highest privileges**.

3. **Set the Trigger:**
   - Click on the **Triggers** tab, then **New...**.
   - Set the trigger to **Daily** or **At startup**.
   - Choose **Repeat task every** 15 minutes or as needed.

4. **Set the Action:**
   - In the **Actions** tab, click **New...**.
   - Set **Program/script** to `powershell.exe`.
   - Set **Add arguments** to:

     ```plaintext
     -ExecutionPolicy Bypass -File "C:\path\to\AutoBrightness.ps1"
     ```

5. **Save and Exit:**

   Your task is now set up to run automatically.

### Script Overview

This PowerShell script includes the following functionality:

```powershell
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
```

### Logging

The script logs each action it takes to `C:\temp\brightness_log.txt`. You can check this file to see the brightness adjustments that have been made.

### Troubleshooting

If you encounter the error "The specified account name is not valid" in Task Scheduler, ensure that the correct user account is specified for the task and that it has the necessary permissions.

### Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Acknowledgments

- Inspired by the need to reduce eye strain during different times of the day.
- Thanks to all contributors!

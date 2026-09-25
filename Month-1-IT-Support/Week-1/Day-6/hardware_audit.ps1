$OutputFile = "$Home\Desktop\windows_hardware_report.txt"
"==========================================" | Out-File $OutputFile
"       WINDOWS HARDWARE AUDIT REPORT      " | Out-File $OutputFile -Append
"==========================================" | Out-File $OutputFile -Append
"Generated on: $(Get-Date)" | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append
"--- CPU INFORMATION ---" | Out-File $OutputFile -Append
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, MaxClockSpeed | Out-String | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append
"--- MEMORY (RAM) INFORMATION ---" | Out-File $OutputFile -Append
Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory | 
    Select-Object @{Name="Total RAM (GB)"; Expression={[math]::Round($_.TotalVisibleMemorySize / 1MB, 2)}},
                  @{Name="Free RAM (GB)"; Expression={[math]::Round($_.FreePhysicalMemory / 1MB, 2)}} | Out-String | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append
"--- STORAGE INFORMATION ---" | Out-File $OutputFile -Append
Get-CimInstance Win32_DiskDrive | 
    Select-Object Model, @{Name="Disk Size (GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}}, InterfaceType | Out-String | Out-File $OutputFile -Append
"==========================================" | Out-File $OutputFile -Append
Write-Host "Audit complete! Report saved to Desktop." -ForegroundColor Green

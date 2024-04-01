function Create-DateList()
{
    [CmdletBinding()]
    Param
    (
        # The string to interrogate
        [Parameter(Mandatory=$true)] [int]$Days,
        [Parameter(Mandatory=$true)] [string]$FilePath
    )
    
    #Date Define
    $Date = Get-Date
    
    #Date Modification Options
    $Date = $date.AddHours(1)
    $Date = $Date.AddMinutes(-1)
    $Date = $Date.AddSeconds(1)
    
    #Calendar Build
    $Calendar = foreach ($i in 1..$Days) {$Date = $Date.AddDays(1); $Date};
    
    #File Write
    $Calendar | Out-File $FilePath
}

#Command Execution
Create-DateList 365 "C:\Temp\Calendar.txt"

echo "Operation Completed.";
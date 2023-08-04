# Import the Active Directory module
Import-Module ActiveDirectory

# Define the time limit in days (180 days)
$limitDays = 180

# Get the current date
$currentDate = Get-Date

# Calculate the limit date (subtract 180 days from the current date)
$limitDate = $currentDate.AddDays(-$limitDays)

# Get the list of computers that have not connected in the last 180 days
$disconnectedComputers = Get-ADComputer -Filter {LastLogonTimeStamp -lt $limitDate} -Properties LastLogonTimeStamp

# Create an array to store the data for CSV
$csvData = @()

# Add the disconnected computers and their last logon date to the array
$disconnectedComputers | ForEach-Object {
    $computerName = $_.Name
    $lastLogonDate = [DateTime]::FromFileTime($_.LastLogonTimeStamp)
    
    # Create a custom object to hold the computer name and last logon date
    $computerObject = New-Object PSObject -Property @{
        "ComputerName" = $computerName
        "LastLogonDate" = $lastLogonDate
    }
    
    # Add the custom object to the CSV data array
    $csvData += $computerObject
}

# Export the CSV data to a CSV file
$outputFile = "DisconnectedComputers.csv"
$csvData | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "The file '$outputFile' has been generated with the list of disconnected computers and their last logon date in CSV format."

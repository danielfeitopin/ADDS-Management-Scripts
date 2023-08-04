# Import the Active Directory module
Import-Module ActiveDirectory

# Get a list of all user objects in Active Directory
$users = Get-ADUser -Filter * -Properties PasswordNeverExpires

# Filter users with "PasswordNeverExpires" option enabled
$usersWithPasswordNeverExpires = $users | Where-Object { $_.PasswordNeverExpires }

# Create an array to store the data for CSV
$csvData = @()

# Add the users with "PasswordNeverExpires" enabled to the array
$usersWithPasswordNeverExpires | ForEach-Object {
    $userName = $_.SamAccountName
    $userPrincipalName = $_.UserPrincipalName
    
    # Create a custom object to hold user information
    $userObject = New-Object PSObject -Property @{
        "Username" = $userName
        "UserPrincipalName" = $userPrincipalName
    }
    
    # Add the custom object to the CSV data array
    $csvData += $userObject
}

# Export the CSV data to a CSV file
$outputFile = "UsersWithPasswordNeverExpires.csv"
$csvData | Export-Csv -Path $outputFile -NoTypeInformation

Write-Host "The file '$outputFile' has been generated with the list of users whose passwords never expire in CSV format."

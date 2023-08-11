param(
    $headerUserName = "Username",
    $headerUserPrincipalName = "User Principal Name"
)

# Import the Active Directory module
try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch {
    Write-Host "[ERROR] Could not import module: 'ActiveDirectory'."
    exit 1
}

# Get the list of all users in Active Directory with "PasswordNeverExpires" option enabled
$users = Get-ADUser -Filter { PasswordNeverExpires -eq $true } -Properties PasswordNeverExpires
Write-Output "$headerUserName, $headerUserPrincipalName"
foreach ($user in $users) {
    Write-Output "$user.SamAccountName, $user.UserPrincipalName"
}
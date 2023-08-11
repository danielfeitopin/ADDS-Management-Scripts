param(
    $limitDays = 180,
    $headerComputerName = "Computer Name",
    $headerLastLogonDate = "Last Logon Date"
)

# Import the Active Directory module
try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch {
    Write-Host "[ERROR] Could not import module: 'ActiveDirectory'."
    exit 1
}

# Calculate the limit date
$limitDate = (Get-Date).AddDays(-$limitDays)

# Get the list of computers that have not connected since the limit date
$computers = Get-ADComputer -Filter { LastLogonDate -lt $limitDate } -Properties LastLogonDate
Write-Output "$headerComputerName, $headerLastLogonDate"
foreach ($computer in $computers) {
    Write-Output "$computer.Name, $computer.LastLogonDate"
}
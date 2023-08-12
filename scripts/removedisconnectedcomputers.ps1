param(
    [switch]$inputWithoutHeaders,
    [string]$logFile
)

# Import the Active Directory module
try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch {
    Write-Host "[ERROR] Could not import module: 'ActiveDirectory'."
    exit 1
}

# Define a function to log messages to a file
function Write-HostAndLog {
    param (
        [string]$message
    )

    Write-Host $message

    if ($logFile) {
        $message | Out-File -Append -FilePath $logFile
    }

}

# Read input from the pipeline
$input | ForEach-Object {

    if (!$inputWithoutHeaders) {
        Write-HostAndLog "[INFO] Received headers: $_"
        $inputWithoutHeaders = $true
    }
    else {
        $computerName = ($_ -split ", ")[0]
        $computerLastLogonDate = ($_ -split ", ")[1]

        # Remove computer
        try {
            Write-HostAndLog "[INFO] Removing computer '$computerName' with last logon date '$computerLastLogonDate'."
            Remove-ADComputer -Identity $computerName -Confirm:$false -ErrorAction Stop
            Write-HostAndLog "[INFO] Computer '$computerName' removed successfully."
        }
        catch {
            Write-HostAndLog "[ERROR] Error removing computer '$computerName': $_."
        }
    }
}
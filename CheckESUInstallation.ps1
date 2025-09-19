<#
.SYNOPSIS
Validates if Windows 10 ESU key is installed and licensed.
Returns exit code 0 if compliant, 1 if not.
#>

# Known ESU Activation IDs (Windows 10)
$ActivationIDs = @(
    "f520e45e-7413-4a34-a497-d2765967d094", # Year 1
    "1043add5-23b1-4afb-9a0f-64343c8f3f8d", # Year 2
    "83d49986-add3-41d7-ba33-87c7bfb5c0fb"  # Year 3
)

# Retrieve license details
$LicenseInfo = cscript.exe /nologo "$env:SystemRoot\system32\slmgr.vbs" /dlv 2>&1

# Check for Licensed status
$IsLicensed = $LicenseInfo | Select-String "License Status:.*Licensed"

# Check for ESU Activation ID
$HasESU = $LicenseInfo | Select-String ($ActivationIDs -join "|")

if ($IsLicensed -and $HasESU) {
    # Compliant
    exit 0
} else {
    # Non-compliant
    exit 1
}

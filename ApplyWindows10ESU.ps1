# Replace with your actual ESU product key
$ESU_MAK = "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"  
$ESU_Year = 3  # Set to 1, 2, or 3

# ESU Activation IDs
$ActivationIDs = @{
    1 = "f520e45e-7413-4a34-a497-d2765967d094"
    2 = "1043add5-23b1-4afb-9a0f-64343c8f3f8d"
    3 = "83d49986-add3-41d7-ba33-87c7bfb5c0fb"
}
$ActivationID = $ActivationIDs[$ESU_Year]

Write-Output "Installing ESU MAK key..."
cscript.exe /b %windir%\system32\slmgr.vbs /ipk $ESU_MAK

Write-Output "Activating ESU MAK key for Year $ESU_Year..."
cscript.exe /b %windir%\system32\slmgr.vbs /ato $ActivationID
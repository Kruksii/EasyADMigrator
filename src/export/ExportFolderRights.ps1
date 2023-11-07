# CONFIGURATION
$OutFile = "C:\Temp\Permissions1.csv"
$RootPath = "\\LOCALHOST\SHARE"

# EXEC
$Header = "Folder Path,IdentityReference,AccessControlType,FileSystemRights,IsInherited,InheritanceFlags,PropagationFlags"
$FileExist = Test-Path $OutFile 
If ($FileExist -eq $True) { Remove-Item $OutFile } 
Add-Content -Value $Header -Path $OutFile 
$Folders = Get-ChildItem $RootPath -Recurse | Where-Object { $_.PSIsContainer -eq $true } 
foreach ($Folder in $Folders) {
    $ACLs = Get-Acl $Folder.FullName | ForEach-Object { $_.Access }
    foreach ($ACL in $ACLs) {
        $OutInfo = $Folder.FullName + "," + $ACL.IdentityReference.ToString() + "," + $ACL.AccessControlType + "," + $ACL.FileSystemRights + "," + $ACL.IsInherited + "," + $ACL.InheritanceFlags + "," + $ACL.PropagationFlags
        Add-Content -Value $OutInfo -Path $OutFile 
    }
}
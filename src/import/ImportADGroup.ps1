Import-Module ActiveDirectory

# CONFIGURATION
$filePath = Import-Csv "C:\groups.csv"
$ou = "OU=Users,DC=constos,DC=local"
$blacklist = @("Administrators")

foreach ($group in $filePath) {
    if (-not ($blacklist -contains $group.Name)) {
        $params = @{
            "Name" = $group.Name
            "GroupScope" = "Global"
            "GroupCategory" = "Security"
            "Path" = $ou
        }
        New-ADGroup @params
        Write-Host "group $($group.Name) created !"
    }
}
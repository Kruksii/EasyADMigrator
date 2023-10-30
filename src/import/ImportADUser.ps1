Import-Module ActiveDirectory

# CONFIGURATION
$filePath = Import-Csv "C:\users.csv"
$userPwd = "a password"
$domain = "contoso.local"
$ou = "OU=Users,DC=contoso,DC=local"
$blacklist = @("Administrator", "Guest")

foreach ($user in $filePath) {
    if (-not ($blacklist -contains $user.SamAccountName)) {
        $params = @{
            "Name" = $user.Name
            "SamAccountName" = $user.SamAccountName
            "UserPrincipalName" = "$($user.SamAccountName)$("@")$($domain)"
            "GivenName" = $user.GivenName
            "Surname" = $user.Surname
            "DisplayName" = $user.DisplayName
            "AccountPassword" = (ConvertTo-SecureString $userPwd -AsPlainText -Force)
            "Enabled" = $true
            "Path" = $ou
        }
        New-ADUser @params
        Write-Host "user $($user.Name) created !"
    }
}
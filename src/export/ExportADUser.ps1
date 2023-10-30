Import-Module ActiveDirectory

# CONFIGURATION
$ou = "" # If empty, take the whole forest

if (-not ($ou -eq "")) {
    Get-ADUser -Filter * -Property * -SearchBase $ou | Export-Csv "C:\users.csv" -NoTypeInformation -Encoding UTF8
} else {
    Get-ADUser -Filter * -Property * | Export-Csv "C:\users.csv" -NoTypeInformation -Encoding UTF8
}

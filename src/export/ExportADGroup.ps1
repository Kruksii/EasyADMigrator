Import-Module ActiveDirectory

# CONFIGURATION
$ou = "" # If empty, take the whole forest

if (-not ($ou -eq "")) {
    Get-ADGroup -Filter * -Property * -SearchBase $ou | Export-Csv "C:\groups.csv" -NoTypeInformation -Encoding UTF8
} else {
    Get-ADGroup -Filter * -Property * | Export-Csv "C:\groups.csv" -NoTypeInformation -Encoding UTF8
}

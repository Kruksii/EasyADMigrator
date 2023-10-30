Import-Module ActiveDirectory

Get-ADGroup -Filter * -Property * | Export-Csv "C:\groups.csv" -NoTypeInformation -Encoding UTF8

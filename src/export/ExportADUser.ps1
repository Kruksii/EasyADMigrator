Import-Module ActiveDirectory

Get-ADUser -Filter * -Property * | Export-Csv "C:\users.csv" -NoTypeInformation -Encoding UTF8

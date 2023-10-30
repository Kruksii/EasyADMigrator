# EasyADMigrator

Some PowerShell scripts for exporting-importing Active Directory users and groups.

## Prerequisites

Scripts request "RemoteSigned" execution policy. If your server is not configured as such, run the following command in a PowerShell prompt:

```ps
Set-ExecutionPolicy RemoteSigned
```

## Exports

In `src/export` you'll find scripts for exporting Active Directory users and groups.

Simply right-click on the file and select "Execute with PowerShell" or run the following command in a PowerShell prompt:

```ps
.\ExportADUser.ps1
.\ExportADGroup.ps1
```

CSV files will be generated in the root of `C:\`

## Imports

In `src/import` you'll find scripts for importing Active Directory users and groups.

**ImportADGroup.ps1 IS UNDER DEVELOPPEMENT**

Drop the previously generated CSV files into the root of `C:\`.

Edit the `ImportADUser.ps1` files to adapt the configuration to your environment.

```ps
$filePath = "The path to the CSV file."
$userPwd = "The password applied to users"
$domain = "The domain assigned to users"
$uo = "The UO in which to create users"
$blacklist = "List of users not to be created"
```

Once the configuration is complete, all you have to do is right-click and select "run with PowerShell" or run the following command in a PowerShell prompt:

```
.\ImportADUser.ps1
```

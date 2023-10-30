# EasyADMigrator

Some PowerShell scripts for exporting-importing Active Directory users and groups.

## Prerequisites

Scripts request "RemoteSigned" execution policy. If your server is not configured as such, run the following command in a PowerShell prompt :

```ps
Set-ExecutionPolicy RemoteSigned
```

## Exports

In `src/export` you'll find scripts for exporting Active Directory users and groups.

### Export ALL forest

Simply right-click on the file and select "Execute with PowerShell" or run the following command in a PowerShell prompt :

```ps
.\ExportADUser.ps1
.\ExportADGroup.ps1
```

CSV files will be generated in the root of `C:\`

### Export OU based

Edit the `ExportADUser.ps1` and `ExportADGroup.ps1` files to specify in the configuration which OU to target :

```ps
$ou = "The OU in which to export user and group"
```

Once you've specified the OU and simply right-click on the file and select "Execute with PowerShell" or run the following command in a PowerShell prompt :

```ps
.\ExportADUser.ps1
.\ExportADGroup.ps1
```

## Imports

In `src/import` you'll find scripts for importing Active Directory users and groups.

Drop the previously generated CSV files into the root of `C:\`.

Edit the `ImportADUser.ps1` and `ImportADGroup.ps1` files to adapt the configuration to your environment.

### ImportADUser

```ps
$filePath = "The path to the CSV file."
$userPwd = "The password applied to users"
$domain = "The domain assigned to users"
$ou = "The OU in which to create users"
$blacklist = "List of users not to be created"
```

### ImportADGroup

```ps
$filePath = "The path to the CSV file."
$ou = "The OU in which to create groups"
$blacklist = "List of groups not to be created"
```

Once the configuration is complete, all you have to do is right-click and select "run with PowerShell" or run the following command in a PowerShell prompt :

```
.\ImportADUser.ps1
.\ImportADGroup.ps1
```

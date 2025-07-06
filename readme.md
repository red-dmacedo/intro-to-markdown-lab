[Cim-Instance]: (https://learn.microsoft.com/en-us/powershell/module/cimcmdlets/get-ciminstance?view=powershell-7.5)
![env]: (./images/Environment Variables.png)
# Setting Up Your Environment
This guide will assist you in setting up your environment so that you can run your *`.ps1`* files from *anywhere* on the command line.

## Disclaimer
1. ***You*** are responsible for **your own** environment.
2. Failure to follow directions or leaving certain elements enabled/disabled according to this guide is ***your*** responsiblity.

## Requirements
- A Windows 🪟 computer 
  - This particular *`.ps1`* file relies on the `Get-CimInstance` cmdlet which is only available on windows computers.
  - Read up on `Get-CimInstance` [on Mcrosoft's website.][Cim-Instance]
- Powershell `5.0` or higher

## Setup
The following steps will allow you to run any *`.ps1`* file from your `powershell` command line.

### 1. Adding a Path to Your Environment
The `PATH` is an environment variable which your computer uses to seach for executable files *`.exe`*, *`.ps1`*, *`.sh`*, etc. By adding a path to your `PATH` variable, your system will allow you to execute the files within that directory without explicitly specifying the full path of the file.

- Open windows search and search for "environment"
- Select "Edit the system Environment Variables"
- With the new "Properties" window open, select "Environment Variables..."
- User vs. System Variables
  - User
    - The `PATH` variable defined in the **user** space will only be accesible when you are logged in as the current user. This means that if you need to run anything as an **administrator** or as a different **user**, these `paths` will *not* be available.
  - System
    - The system `PATH` is available to all users and should be edited with **caution**.
- Once you have decided which `PATH` you would like to edit, double-click on that `PATH`

1. Select the start 🪟 button on your **windows** computer.
2. Without selecting *anything* else, start typing the word `powershell`.
3. Once you have found the powershell application, right click on it and select ``

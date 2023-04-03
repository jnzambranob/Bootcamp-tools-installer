# Bootcamp tools installer
### How to use?
This PowerShell script allows you to install (almost) automatically all the tools needed for the bootcamp.
The user can choose the between the automatic installation (install everything automatically) or to install each tool individually.
### Requirememts
- Windows enviroment (tested in a clean W10 installation)
- Enough disk space for the tools (2.5 GB approx)
- Powershell installed (installed by default in W8.1 and newer)
### Instructions
1. Clone this repo or download the script file: [Script Link](https://raw.githubusercontent.com/jnzambranob/Bootcamp-tools-installer/main/devopstoolsinstaller.ps1) (Right-click in the link and choose "Save link as")
2. Allow the PowerShell script execution running this command in a PowerShell terminal:
```powershell
Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope CurrentUser
```
  >This is mandatory and has to be done because the script execution is disabled by default for security reasons.

3. Run the script directly from PowerShell with the command:
```powershell
.\devopstoolsinstaller.ps1
```
>Remember to open the script from the folder where the file is located, Also, the script could be executed from the file explorer, just right-clicking the script file and clicking in the option "Run with PowerShell".

4. Follow the instructions of the script.



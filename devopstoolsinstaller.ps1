#SCRIPT: Bootcamp tools installer

Function CheckAdmin()
{
  #Get current user context
  $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  #Check user is running the script is member of Administrator Group
  if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator))
  {
       Write-host "Script is running as admin"
  }
  else
    {
       #Create a new Elevated process to Start PowerShell
       $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
       # Specify the current script path and name as a parameter
       $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
       #Set the Process to elevated
       $ElevatedProcess.Verb = "runas"
       #Start the new elevated process
       [System.Diagnostics.Process]::Start($ElevatedProcess)
       #Exit from the current, unelevated, process
       Exit
 
    }
} 
#Check Script is running with Elevated Privileges
CheckAdmin

#Declare Installing commands

$chocolatey = "Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
$pscore = "choco install powershell-core"
$git = "choco install git"
$vscode = "choco install vscode"
$vscodext = "code --install-extension ms-vscode.powershell
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension redhat.vscode-yaml
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-bicep"
$azureps = "Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force"
$bicep = 'choco install bicep'


#End of installing commands

#Script start
cls
Write-Output "------------------------------------------------------------------"
Write-Output "--------------Arroyo DevOps Bootcamp Tools Installer--------------"
Write-Output "------------------------------------------------------------------"
Write-Output "---------------------------          -----------------------------"
Write-Output "---------------------------   MENU   -----------------------------"
Write-Output "---------------------------          -----------------------------"
Write-Output "------------------------------------------------------------------"
Write-Output "------------ 1. Automated installation of all the tools ----------"
Write-Output "------------ 2. Manual installation of a single tool -------------"
Write-Output "------------ 3. Exit ---------------------------------------------"
Write-Output "------------------------------------------------------------------"
Write-Output "------------------------------------------------------------------"

$OPStart = Read-Host "Choose the install method and press ENTER"
cls
if ( 1 -eq $OPStart )
{
    Write-Output "------------Automated installation of all the tools-----------"
    Write-Output "Press ENTER and follow the instructions of each installer..."
    pause
    Write-Output "------------Installing Chocolatey-----------"
    Invoke-Expression $chocolatey
    #pause
    Write-Output "------------Installing PowerShell Core-----------"
    Invoke-Expression $pscore
    Write-Output "FINISHED!"
    #pause
    Write-Output "------------Installing GIT-----------"
    Invoke-Expression $git
    Write-Output "FINISHED!"
    #pause
    Write-Output "------------Installing Visual Studio Code-----------"
    Invoke-Expression $vscode
    Write-Output "FINISHED!"
    #pause
    Write-Output "------------Installing Bicep-----------"
    Invoke-Expression $bicep
    Write-Output "FINISHED!"
    #pause
    Write-Output "------------Installing Azure AZ Powershell module-----------"
    Write-Output "BE PATIENT, THIS WILL TAKE A TIME..."
    Invoke-Expression $azureps
    Write-Output "FINISHED!"
    #pause
    #restart powershell
    Write-Output "UPDATING PATH WITH NEW PROGRAMS INSTALLED..."
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Output "FINISHED!"
    Write-Output "------------Installing Visual Studio Code Extensions-----------"
    Invoke-Expression $vscodext
    Write-Output "FINISHED!"
    #pause
    "------------Configuring GIT-----------"
    Write-Output "This option will setup your Name and Email in the GIT configuration"
    Write-Output "CAUTION: If you make a mistake with the following information, run this option in the manual installation menu to correct it..."
    $Name = Read-Host "Write your full name and press ENTER"
    $Email = Read-Host "Write your Email and press ENTER"
    $gitconf = "git config --global --replace user.name " + "`"$Name`"" + "
    git config --global user.email " + "$Email" + "
    git config --global core.longpaths true"
    Invoke-Expression $gitconf
    Write-Output "------------INSTALLATION FINISHED!-----------"
    pause
    exit
}
if ( 2 -eq $OPStart )
{
    Write-Output "------------------------------------------------------------------"
    Write-Output "-------------- Manual installation of a single tool --------------"
    Write-Output "------------------------------------------------------------------"
    Write-Output "------------ 1. Install Chocolatey -------------------------------"
    Write-Output "------------ 2. Install PowerShell Core --------------------------"
    Write-Output "------------ 3. Install GIT --------------------------------------"
    Write-Output "------------ 4. Install Visual Studio Code -----------------------"
    Write-Output "------------ 5. Install Bicep ------------------------------------"
    Write-Output "------------ 6. Install Azure AZ Powershell module ---------------"
    Write-Output "------------ 7. Install Visual Studio Code Extensions ------------"
    Write-Output "------------ 8. Configure GIT ------------------------------------"
    Write-Output "------------ 9. Exit ---------------------------------------------"
    Write-Output "------------------------------------------------------------------"
    Write-Output "------------------------------------------------------------------"
    $OPManual = Read-Host "Choose the desired option and press ENTER"
    cls
    if ( 1 -eq $OPManual )
    {
        Write-Output "------------Installing Chocolatey-----------"
        #install chocolatey
        Invoke-Expression $chocolatey
        pause
        exit
    }
    if ( 2 -eq $OPManual )
    {
        Write-Output "------------Installing PowerShell Core-----------"
        #install the option
        Invoke-Expression $pscore
        pause
        exit
    }
    if ( 3 -eq $OPManual )
    {
        Write-Output "------------Installing GIT-----------"
        #install the option
        Invoke-Expression $git
        pause
        exit
    }
    if ( 4 -eq $OPManual )
    {
        Write-Output "------------Installing Visual Studio Code-----------"
        #install the option
        Invoke-Expression $vscode
        pause
        exit
    }
    if ( 5 -eq $OPManual )
    {
        Write-Output "------------Installing Bicep-----------"
        #install the option
        Invoke-Expression $bicep
        pause
        exit
    }
    if ( 6 -eq $OPManual )
    {
        Write-Output "------------Installing Azure AZ Powershell module-----------"
        #install the option
        Invoke-Expression $azureps
        pause
        exit
    }
    if ( 7 -eq $OPManual )
    {
        Write-Output "------------Installing Visual Studio Code Extensions-----------"
        Write-Output "THIS OPTION WILL ONLY WORK IF YOU HAVE INSTALLED VSCODE BEFORE"
        #install the option
        Invoke-Expression $vscodext
        pause
        exit
    }
    if ( 8 -eq $OPManual )
    {
        Write-Output "------------Configuring GIT-----------"
        Write-Output "THIS OPTION WILL ONLY WORK IF YOU HAVE INSTALLED GIT BEFORE"
        Write-Output "This option will update your Name and Email in the GIT configuration"
        Write-Output "CAUTION: If you make a mistake with the following information, run again this option to correct it..."
        $Name = Read-Host "Write your full name and press ENTER"
        $Email = Read-Host "Write your Email and press ENTER"
        $gitconf = "git config --global --replace user.name " + "`"$Name`"" + "
        git config --global user.email " + "$Email" + "
        git config --global core.longpaths true"
        Invoke-Expression $gitconf
        pause
        exit
    }
    if ( 9 -eq $OPManual )
    {
        Write-Output "Exiting..."
        #ByeBye
        pause
        exit
    }
}
if ( 3 -eq $OPStart )
{
    Write-Output "-----------------------------Exit-----------------------------"
    #ByeBye
    pause
    exit
}
#Script end

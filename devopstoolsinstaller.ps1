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
Check-Admin

#Declare Installing commands

$chocolatey = "Set-ExecutionPolicy Bypass -Scope Process -Force;
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
$pscore = "choco install powershell-core"
$git = "choco install git"
$gitconf = "git config --global user.name $name
git config --global user.email $email
git config --global core.longpaths true"
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
    Invoke-Expression $chocolatey
    Invoke-Expression $pscore
    #Invoke-Expression $git
    Invoke-Expression $vscode
    Invoke-Expression $bicep
    #& $azureps
    #restart powershell
    Invoke-Expression $vscodext
    #& $gitconf
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
        #install the option
        Invoke-Expression $vscodext
        pause
        exit
    }
    if ( 8 -eq $OPManual )
    {
        Write-Output "------------Configuring GIT-----------"
        Write-Output "This option will setup your Name and Email in the GIT configuration"
        $Name = Read-Host "Write your full name and press ENTER"
        $Email = Read-Host "Write your Email and press ENTER"
        #configure git
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

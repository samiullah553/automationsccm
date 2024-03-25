Before running this script, you need to ensure a few prerequisites:

PowerShell Execution Policy: 
 ==> Ensure that the PowerShell execution policy allows running scripts. You can set it to RemoteSigned or     Unrestricted for testing purposes. Run PowerShell as an administrator and use the following command to set the execution policy:

         Set-ExecutionPolicy RemoteSigned


Remoting Enabled: If you are running this script on remote computers, PowerShell remoting should be enabled on those machines. You can enable remoting by running the following command on each remote computer:

         Enable-PSRemoting -Force


Admin Privileges: Make sure you have administrative privileges on the computers where you are running the script, especially if you are triggering actions that require administrative rights.

SCCM Client Installed: The SCCM client should be installed and properly configured on the target computers where you want to trigger these actions.

Network Connectivity: Ensure that there is network connectivity between the computer where you are running the script (source) and the target computers (destination) where SCCM actions will be triggered.

Firewall Rules: Check and adjust firewall rules if necessary to allow PowerShell remoting and WMI traffic between the source and destination computers.

After ensuring these prerequisites, you can execute the script using Invoke-Command to remotely trigger SCCM client actions on the specified computers. The script will iterate through the SCCM action GUIDs in the $SCCMActions array and invoke the Invoke-WMIMethod cmdlet to trigger each action on the SCCM client.


Run the script
clone the code.
git clone https://github.com/samiullah553/automationsccm.git
change directory.
   cd automationsccm
   .\sccm_policy_on_local.ps1
   .\sccm_policy_on_remote.ps1

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



Client Action Trigger Schedule ID Client Action Name
{00000000-0000-0000-0000-000000000021} Machine policy retrieval & Evaluation Cycle
{00000000-0000-0000-0000-000000000022} Machine policy evaluation cycle
{00000000-0000-0000-0000-000000000001} Hardware inventory cycle
{00000000-0000-0000-0000-000000000002} Software inventory cycle
{00000000-0000-0000-0000-000000000003} Discovery Data Collection Cycle
{00000000-0000-0000-0000-000000000113} Software updates scan cycle
{00000000-0000-0000-0000-000000000114} Software updates deployment evaluation cycle
{00000000-0000-0000-0000-000000000031} Software metering usage report cycle
{00000000-0000-0000-0000-000000000121} Application deployment evaluation cycle
{00000000-0000-0000-0000-000000000026} User policy retrieval
{00000000-0000-0000-0000-000000000027} User policy evaluation cycle
{00000000-0000-0000-0000-000000000032} Windows installer source list update cycle
{00000000-0000-0000-0000-000000000010} File collection

Invoke-CMClientAction -DeviceName "Computer01" -Action MachinePolicyRetrievalEvalCycle

# Script: SCCM-Policy Rrefresh on Remote Machines
# Scope: Trigger The SCCM Actions On Remote Machines
# Prerequisites-1 : Execution policy should set as Unrestricted
# Prerequisites-2 : Make sure Windows remote management (WinRm) service is running on the remote computer

# Author: Sami Ullah

 ####################################################



 $hostnamelists= Get-Content "c:\temp\hostnames.txt" #Get the machines
 
 
 $Polices = {
 
 $SCCMActions = @( 
  "{00000000-0000-0000-0000-000000000021}",  #MachinePolicy
  "{00000000-0000-0000-0000-000000000022}",  #MachinePolicyEvaluationCycle
  "{00000000-0000-0000-0000-000000000003}",  #DiscoveryData
  "{00000000-0000-0000-0000-000000000071}",  #ComplianceEvaluation
  "{00000000-0000-0000-0000-000000000121}",  #AppDeployment
  "{00000000-0000-0000-0000-000000000001}",  #HardwareInventory
  "{00000000-0000-0000-0000-000000000108}",  #UpdateDeployment
  "{00000000-0000-0000-0000-000000000113}",  #UpdateScan
  "{00000000-0000-0000-0000-000000000002}"   #SoftwareInventory 
 ) 
 
 
    foreach ($action in $SCCMActions) 
     {                       
       Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule $action
     }
 }
 foreach ($computer in $hostnamelists)
 {  
     Invoke-Command -ScriptBlock $Polices  -ComputerName $computer
        
 }
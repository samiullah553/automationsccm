# Script: SCCM Client Policy Rrefresh on Local Machines
# Scope: Trigger The SCCM Actions On Local Machines
# Author: Sami Ullah (DevOps & Network Automation Engineer)

 ####################################################


 $ExecutionPolices = {
  $SCCMClientActions = @(
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

  foreach ($action in $SCCMClientActions) {
      try {
          Invoke-WMIMethod -Namespace root\ccm -Class SMS_CLIENT -Name TriggerSchedule ${action} -ErrorAction Stop
          Write-Output "Successfully triggered SCCM action: ${action}"
      } catch {
          Write-Error "Failed to trigger SCCM action: ${action}. Error: $_"
      }
  }
}

Invoke-Command -ScriptBlock $ExecutionPolices
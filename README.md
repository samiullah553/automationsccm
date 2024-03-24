To run this script we need to change the script file permission.
#To print the file permission 
Get-ExecutionPolicy run_sccm_actions.ps1

#To change the file permission
Set-ExecutionPolicy RemoteSigned run_sccm_actions.ps1

control smscfgrc


Client Action Trigger Schedule ID	      Client Action Name
{00000000-0000-0000-0000-000000000021}	  Machine policy retrieval & Evaluation Cycle
{00000000-0000-0000-0000-000000000022}	  Machine policy evaluation cycle
{00000000-0000-0000-0000-000000000001}	  Hardware inventory cycle
{00000000-0000-0000-0000-000000000002}	  Software inventory cycle
{00000000-0000-0000-0000-000000000003}	  Discovery Data Collection Cycle
{00000000-0000-0000-0000-000000000113}	  Software updates scan cycle
{00000000-0000-0000-0000-000000000114}	  Software updates deployment evaluation cycle
{00000000-0000-0000-0000-000000000031}	  Software metering usage report cycle
{00000000-0000-0000-0000-000000000121}	  Application deployment evaluation cycle
{00000000-0000-0000-0000-000000000026}	  User policy retrieval
{00000000-0000-0000-0000-000000000027}	  User policy evaluation cycle
{00000000-0000-0000-0000-000000000032}	  Windows installer source list update cycle
{00000000-0000-0000-0000-000000000010}	  File collection

Invoke-CMClientAction -DeviceName "Computer01" -Action MachinePolicyRetrievalEvalCycle
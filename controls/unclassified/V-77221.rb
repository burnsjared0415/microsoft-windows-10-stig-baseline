control "V-77221" do
  title "Exploit Protection mitigations in Windows 10 must be configured for
INFOPATH.EXE."
  desc  "Exploit protection in Windows 10 provides a means of enabling
additional mitigations against potential threats at the system and application
level. Without these additional application protections, Windows 10 may be
subject to various exploits."
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-EP-000150"
  tag gid: "V-77221"
  tag rid: "SV-91917r3_rule"
  tag stig_id: "WN10-EP-000150"
  tag fix_id: "F-84349r4_fix"
  tag cci: ["CCI-000366"]
  tag nist: ["CM-6 b", "Rev_4"]
  tag false_negatives: nil
  tag false_positives: nil
  tag documentable: false
  tag mitigations: nil
  tag severity_override_guidance: false
  tag potential_impacts: nil
  tag third_party_tools: nil
  tag mitigation_controls: nil
  tag responsibility: nil
  tag ia_controls: nil
  tag check: "This is NA prior to v1709 of Windows 10.

This is applicable to unclassified systems, for other systems this is NA.

Run \"Windows PowerShell\" with elevated privileges (run as administrator).

Enter \"Get-ProcessMitigation -Name INFOPATH.EXE\".
(Get-ProcessMitigation can be run without the -Name parameter to get a list of
all application mitigations configured.)

If the following mitigations do not have a status of \"ON\", this is a finding:

DEP:
Enable: ON

ASLR:
ForceRelocateImages: ON

Payload:
EnableExportAddressFilter: ON
EnableExportAddressFilterPlus: ON
EnableImportAddressFilter: ON
EnableRopStackPivot: ON
EnableRopCallerCheck: ON
EnableRopSimExec: ON

The PowerShell command produces a list of mitigations; only those with a
required status of \"ON\" are listed here. If the PowerShell command does not
produce results, ensure the letter case of the filename within the command
syntax matches the letter case of the actual filename on the system."
  tag fix: "Ensure the following mitigations are turned \"ON\" for INFOPATH.EXE:

DEP:
Enable: ON

ASLR:
ForceRelocateImages: ON

Payload:
EnableExportAddressFilter: ON
EnableExportAddressFilterPlus: ON
EnableImportAddressFilter: ON
EnableRopStackPivot: ON
EnableRopCallerCheck: ON
EnableRopSimExec: ON

Application mitigations defined in the STIG are configured by a DoD EP XML file
included with the Windows 10 STIG package in the \"Supporting Files\" folder.

The XML file is applied with the group policy setting Computer Configuration >>
Administrative Settings >> Windows Components >> Windows Defender Exploit Guard
>> Exploit Protection >> \"Use a common set of exploit protection settings\"
configured to \"Enabled\" with file name and location defined under
\"Options:\".  It is recommended the file be in a read-only network location."
  describe "Check Ensure Exploit Protection system-level mitigation to validate INFOPATH.EXE is set to DEP is ON; ASLR  ForceRelocateImages ON; 
Payload EnableExportAddressFilter is ON; Payload EnableExportAddressFilterPlus is ON; Payload EnableImportAddressFilter is ON; Payload EnableRopStackPivot is ON; Payload EnableRopCallerCheck is ON;
Payload EnableRopSimExec is ON by running Get-ProcessMitigation -Name INFOPATH.EXE in PowerShell Command"  do
    skip "Setting must be ON to pass check"
  end
end


control "V-77097" do
  title "Windows 10 Exploit Protection system-level mitigation, Control flow
guard (CFG), must be on."
  desc  "Exploit protection in Windows 10 enables mitigations against potential
threats at the system and application level.  Several mitigations, including
\"Control flow guard (CFG)\", are enabled by default at the system level. CFG
ensures flow integrity for indirect calls. If this is turned off, Windows 10
may be subject to various exploits."
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-EP-000040"
  tag gid: "V-77097"
  tag rid: "SV-91793r3_rule"
  tag stig_id: "WN10-EP-000040"
  tag fix_id: "F-86721r2_fix"
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

The default configuration in Exploit Protection is \"On by default\" which
meets this requirement.  The PowerShell query results for this show as
\"NOTSET\".

Run \"Windows PowerShell\" with elevated privileges (run as administrator).

Enter \"Get-ProcessMitigation -System\".

If the status of \"CFG: Enable\" is \"OFF\", this is a finding.

Values that would not be a finding include:
ON
NOTSET (Default configuration)"
  tag fix: "Ensure Exploit Protection system-level mitigation, \"Control flow
guard (CFG)\", is turned on. The default configuration in Exploit Protection is
\"On by default\" which meets this requirement.

Open \"Windows Defender Security Center\".

Select \"App & browser control\".

Select \"Exploit protection settings\".

Under \"System settings\", configure \"Control flow guard (CFG)\" to \"On by
default\" or \"Use default (<On>)\".

The STIG package includes a DoD EP XML file in the \"Supporting Files\" folder
for configuring application mitigations defined in the STIG.  This can also be
modified to explicitly enforce the system level requirements.  Adding the
following to the XML file will explicitly turn CFG on (other system level EP
requirements can be combined under <SystemConfig>):

<SystemConfig>
  <ControlFlowGuard Enable=\"true\"></ControlFlowGuard>
</SystemConfig>

The XML file is applied with the group policy setting Computer Configuration >>
Administrative Settings >> Windows Components >> Windows Defender Exploit Guard
>> Exploit Protection >> \"Use a common set of exploit protection settings\"
configured to \"Enabled\" with file name and location defined under
\"Options:\". It is recommended the file be in a read-only network location."
script = <<-EOH
$convert_json = Get-ProcessMitigation -System | ConvertTo-Json
$convert_out_json = ConvertFrom-Json -InputObject $convert_json
$select_object = $convert_out_json.Cfg | Select Enable
$result = $select_object.Enable
write-output $result
EOH

  decribe powershell(script) do
    its('strip') { should_not eq "2"}
  end
end


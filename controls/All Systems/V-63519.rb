control "V-63519" do
  title "The Application event log size must be configured to 32768 KB or
greater."
  desc  "Inadequate log size will cause the log to fill up quickly.  This may
prevent audit events from being recorded properly and require frequent
attention by administrative personnel."
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-AU-000500"
  tag gid: "V-63519"
  tag rid: "SV-78009r1_rule"
  tag stig_id: "WN10-AU-000500"
  tag fix_id: "F-69449r1_fix"
  tag cci: ["CCI-001849"]
  tag nist: ["AU-4", "Rev_4"]
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
  tag check: "If the system is configured to send audit records directly to an
audit server, this is NA.  This must be documented with the ISSO.

If the following registry value does not exist or is not configured as
specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:
\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application\\

Value Name:  MaxSize

Value Type:  REG_DWORD
Value:  0x00008000 (32768) (or greater)"
  tag fix: "If the system is configured to send audit records directly to an
audit server, this is NA.  This must be documented with the ISSO.

Configure the policy value for Computer Configuration >> Administrative
Templates >> Windows Components >> Event Log Service >> Application >>
\"Specify the maximum log file size (KB)\" to \"Enabled\" with a \"Maximum Log
Size (KB)\" of \"32768\" or greater."

  describe registry_key("HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application") do
    it { should have_property 'MaxSize' }
    its('MaxSize') { should be >= 32768 }
  end  
end


control "V-63329" do
  title "Users must be notified if a web-based program attempts to install
software."
  desc  "Web-based programs may attempt to install malicious software on a
system.  Ensuring users are notified if a web-based program attempts to install
software allows them to refuse the installation."
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-CC-000320"
  tag gid: "V-63329"
  tag rid: "SV-77819r1_rule"
  tag stig_id: "WN10-CC-000320"
  tag fix_id: "F-69245r1_fix"
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
  tag check: "The default behavior is for Internet Explorer to warn users and
select whether to allow or refuse installation when a web-based program
attempts to install software on the system.

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of \"0\", this is not a finding.

If it exists and is configured with a value of \"1\", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \\SOFTWARE\\Policies\\Microsoft\\Windows\\Installer\\

Value Name: SafeForScripting

Value Type: REG_DWORD
Value: 0 (or if the Value Name does not exist)"
  tag fix: "The default behavior is for Internet Explorer to warn users and
select whether to allow or refuse installation when a web-based program
attempts to install software on the system.

If this needs to be corrected, configure the policy value for Computer
Configuration >> Administrative Templates >> Windows Components >> Windows
Installer >> \"Prevent Internet Explorer security prompt for Windows Installer
scripts\" to \"Not Configured\" or \"Disabled\"."
  is_domain = command('wmic computersystem get domain | FINDSTR /V Domain').stdout.strip

  describe registry_key('HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows\\Installer') do
  it { should have_property 'SafeForScripting' }
  its('SafeForScripting') { should cmp == 0 }
  end if is_domain != 'WORKGROUP'

  if is_domain == 'WORKGROUP'
    impact 0.0
    describe 'The system is not a member of a domain, control is NA' do
    skip 'The system is not a member of a domain, control is NA'
    end
  end
end


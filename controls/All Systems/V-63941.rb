control "V-63941" do
  title "The Take ownership of files or other objects user right must only be
assigned to the Administrators group."
  desc  "Inappropriate granting of user rights can provide system,
administrative, and other high level capabilities.

    Accounts with the \"Take ownership of files or other objects\" user right
can take ownership of objects and make changes.
  "
  impact 0.5
  tag severity: nil
  tag gtitle: "WN10-UR-000165"
  tag gid: "V-63941"
  tag rid: "SV-78431r1_rule"
  tag stig_id: "WN10-UR-000165"
  tag fix_id: "F-69869r1_fix"
  tag cci: ["CCI-002235"]
  tag nist: ["AC-6 (10)", "Rev_4"]
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
  tag check: "Verify the effective setting in Local Group Policy Editor.
Run \"gpedit.msc\".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings
>> Security Settings >> Local Policies >> User Rights Assignment.

If any groups or accounts other than the following are granted the \"Take
ownership of files or other objects\" user right, this is a finding:

Administrators"
  tag fix: "Configure the policy value for Computer Configuration >> Windows
Settings >> Security Settings >> Local Policies >> User Rights Assignment >>
\"Take ownership of files or other objects\" to only include the following
groups or accounts:

Administrators"
  describe.one do
    describe security_policy do
      its('SeTakeOwnershipPrivilege') { should eq ['S-1-5-32-544'] }
    end
    describe security_policy do
      its('SeTakeOwnershipPrivilege') { should eq [] }
    end
  end
end


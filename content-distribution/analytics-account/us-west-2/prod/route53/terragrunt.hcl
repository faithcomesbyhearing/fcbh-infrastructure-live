# member-account: analytics

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git::https://github.com/faithcomesbyhearing/fcbh-infrastructure-modules.git//route53?ref=v0.1.7"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {

  namespace = "analytics"
  stage     = "prod"
  name      = "splunk"
  parent_zone_record_enabled = false 
  parent_zone_name = "fcbh.org"
  zone_name = "splunk.fcbh.org"
}

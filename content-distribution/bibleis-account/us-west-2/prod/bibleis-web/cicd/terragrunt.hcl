# member-account: bibleis

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "../../../../../../fcbh-infrastructure-modules//cicd"
  # source = "git::https://github.com/faithcomesbyhearing/fcbh-infrastructure-modules.git?ref=master"
}

#Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependency "bibleis-beanstalk" {
  config_path = "../beanstalk"
}

# to copy an RDS snapshot between accounts: https://aws.amazon.com/premiumsupport/knowledge-center/rds-snapshots-share-account/
inputs = {
  namespace                          = "bibleis"
  stage                              = ""
  name                               = "cicd"
  application_description            = "CICD resources for Bible.is web beanstalk"
  elastic_beanstalk_application_name = dependency.bibleis-beanstalk.outputs.elastic_beanstalk_application_name
  elastic_beanstalk_environment_name = dependency.bibleis-beanstalk.outputs.elastic_beanstalk_environment_name
  repo_owner                         = "faithcomesbyhearing"
  repo_name                          = "dbp"
  branch                             = "master"
  # buildspec = 
}
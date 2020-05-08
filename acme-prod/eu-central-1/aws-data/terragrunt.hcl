terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/aws-data"
}

include {
  path = find_in_parent_folders()
}


inputs = {

}

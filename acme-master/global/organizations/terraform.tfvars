terragrunt = {
  terraform {
    source = "${path_relative_from_include()}/../../../modules/empty"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

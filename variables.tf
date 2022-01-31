variable "_region_" {
  type        = string
  description = "AWS region name."
  default     = "ap-south-1"
}

variable "_keyname_" {
  type        = string
  description = "Key name of the ssh key."
}

variable "_key_file_" {
  type        = string
  description = "path to the ssh key file."
}

variable "_git_url_" {
  type        = string
  description = "Url to the git repo containing the web content."
}

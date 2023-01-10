provider "aws" {
  shared_config_files      = ["/home/fatmamostafa/config"]
  shared_credentials_files = ["/home/fatmamostafa/cred"]
  profile                  = ""
}


resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main"
    }
}










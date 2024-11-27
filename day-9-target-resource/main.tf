provider "aws" {
  
}

resource "aws_instance" "name" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "darling"
  
}

resource "aws_s3_bucket" "name" {
    bucket = "awsawsdevopsdevops"
  
}
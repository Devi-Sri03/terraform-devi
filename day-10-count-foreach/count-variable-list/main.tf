provider "aws" {
  
}

resource "aws_instance" "name" {
    ami = var.ami
    instance_type = var.type
    key_name = var.key
    count = length(var.namee)
    tags = {
      Name = var.namee[count.index]
    }
}
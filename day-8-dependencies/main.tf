provider "aws" { 
    
}



resource "aws_s3_bucket" "example" {
  bucket = "devidollyaws"
   depends_on = [ aws_instance.dev ]
 
}



resource "aws_instance" "dev" {
    ami = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    
}

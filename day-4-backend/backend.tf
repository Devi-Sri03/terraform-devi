terraform {
  backend "s3" {
    bucket = "awsdevopsbucket"
    region = "ap-south-1"
    key = "day-4-backend/terraform.tfstate"
    encrypt = true
    
  }
}
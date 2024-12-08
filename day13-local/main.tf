provider "aws" {
  
}
locals {
  region = "ap-south-1"
  environment = "dev"
  instance_type = "t2.micro"
  ami = "ami-0614680123427b75e"
}

resource "aws_instance" "example" {
  ami           = local.ami # Amazon Linux 2 AMI
  instance_type = local.instance_type

  tags = {
    Name        = "ExampleInstance"
    Environment = local.environment
  }
}
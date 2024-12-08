provider "aws" {
    region = "ap-south-1"
  
}

variable "ami" {
  description = "ami value"
  type = string
  default = "ami-0614680123427b75e"
}
variable "instance_type" {
  description = "value for instance"
  type = string
  default = "t2.micro"
  }
  variable "key" {
    description = "key value"
    type = string
    default = "my-keypair"
  }
  variable "az" {
    description = "Zone"
    type = string
    default = ""
  }



resource "aws_instance"  "count" {
   ami =var.ami
   instance_type = var.instance_type   
   key_name = var.key
   #availability_zone = var.az
    count = 1
     tags={
        #Name= "Dev123"
        Name="Prod-${count.index}"
    }
}
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
  variable "server" {
    type = list(string)
    default = ["Dev","test"]
  }



resource "aws_instance"  "count" {
   ami =var.ami
   instance_type = var.instance_type   
   key_name = var.key
   #availability_zone = var.az
   #count = length(var.server)
   for_each = toset(var.server)
     tags={
        #Name= "Dev123"
        #Name="Prod-${count.index}"
        #Name= var.server[count.index]
        Name= each.value
    }
}
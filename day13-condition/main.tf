# #example s3 buvket creation condition based 
provider "aws" {
  region = "ap-south-1"
}

# variable "create_bucket" {
#   description = "Set to true to create the S3 bucket."
#   type        = bool
#   default     = true
# }

# resource "random_string" "suffix" {
#   count   = var.create_bucket ? 1 : 0
#   length  = 8
#   special = false
#   upper   = false
# }

# resource "aws_s3_bucket" "example" {
#   count = var.create_bucket ? 1 : 0

#   bucket = "my-conditional-bucket-${random_string.suffix[count.index].id}"
#   acl    = "private"

#   tags = {
#     Name        = "ConditionalBucket"
#     Environment = "Dev"
#   }
# }


variable "create_instance" {
  description = "Set to true to create the EC2 instance."
  type        = bool
  default     = true
}


resource "aws_instance" "example" {
  count         = var.create_instance ? 1 : 0
  ami           = "ami-0614680123427b75e" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Condition-based-Instance"
  }
}



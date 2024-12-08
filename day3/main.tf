resource "aws_s3_bucket"  "name" {
     bucket = "rds1234123"
}
terraform {
      backend "s3" {
        encrypt = true    
         bucket = "statefile12345"
        #dynamodb_table = "terraform-state-lock-dynamo"
        key    = "terraform.tfstate"
        region = "us-east-1"
      }
    }

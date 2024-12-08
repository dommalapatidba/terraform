module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}
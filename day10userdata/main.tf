resource "aws_instance" "dev" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  user_data = file("test.sh")
  tags = {
    Name="app"
  }
}
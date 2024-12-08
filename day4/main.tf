#VPC
resource "aws_vpc" "projectk"{
  cidr_block = "10.0.0.0/16"
  tags={
    name="projectk"
  }
}

#Subnet
resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.projectk.id
  cidr_block = "10.0.0.0/23"
  map_public_ip_on_launch = true
  tags={
    name="public_subnet1"
  }
}

#Internet gateway
resource "aws_internet_gateway" "projectkig" {
  vpc_id = aws_vpc.projectk.id
  tags = {
    Name="IG"
  }
}


#route table
resource "aws_route_table" "projectkrt" {
  vpc_id = aws_vpc.projectk.id
  tags={
    name="projectkrt"
  }
route  {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.projectkig.id
  }
}


#subnet association
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.projectkrt.id
  }

#security groupcheck 
resource "aws_security_group" "projectksg" {
  name="allow all traffic"
  vpc_id=aws_vpc.projectk.id
  tags={
    name="sg-projectk"
  }
  ingress{
    description = "inbound traffic"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}  
  ingress{
    description = "inbound traffic"
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}  
egress{
    description = "outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
}

#Ec2
resource "aws_instance" "name"{
    ami = "ami-0aebec83a182ea7ea"
    key_name = "my-keypair"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet1.id
    vpc_security_group_ids = [aws_security_group.projectksg.id]
    associate_public_ip_address = true  
    
    tags = {
      Name= "publicec2"
    }

}

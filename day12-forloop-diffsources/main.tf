variable "port_source_map" {
  default = {
    22   = ["49.37.155.0/24"]    # SSH allowed from internal network
    80   = ["0.0.0.0/0"]         # HTTP open to all
    443  = ["0.0.0.0/0"]         # HTTPS open to all
    8080 = ["49.37.155.0/24"]    # Custom app port restricted
    9000 = ["49.37.155.0/24"]       # Monitoring port restricted
  }
}

resource "aws_security_group" "projectk" {
 name = "projectk"

  ingress = [
   for port, sources in var.port_source_map : {
     description      = "inbound rule for port ${port}"
     from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = sources
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}





# variable "ip_port_map" {
#   default = {
#     "49.37.155.223" = [22, 8080, 9000]          # SSH, custom app port, and monitoring port
#     "0.0.0.0/0"     = [80, 443]                 # HTTP and HTTPS open to all
#     "192.168.1.100" = [3306]                    # MySQL allowed from a specific internal IP
#   }
# }

# resource "aws_security_group_rule" "allow_ports" {
#    for_each = var.ip_port_map
#       type        = "ingress"
#       from_port   = each.value
#       to_port     = each.value
#       protocol    = "tcp"
#       cidr_blocks = [each.key]
# }


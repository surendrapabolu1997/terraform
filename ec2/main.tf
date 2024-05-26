# Creates EC2
resource "aws_instance" "server" {
  ami                     = "ami-0c1d144c8fdd8d690"
  instance_type           = "t3.nano"
  vpc_security_group_ids  = [aws_security_group.allow_all.id]

  tags = {
    Name = "TerraformServer"
  }
}

output "private_ip_address" {
  value = aws_instance.server.private_ip
}


# Creates a Security Group
resource "aws_security_group" "allow_all" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
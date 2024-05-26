resource "aws_instance" "demo-vm" {
  ami           = ami-0bb84b8ffd87024d8
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
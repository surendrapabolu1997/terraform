resource "aws_instance" "demo-vm" {
  ami           = ami-08564adb5a86605e7
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
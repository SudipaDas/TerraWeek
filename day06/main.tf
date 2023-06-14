resource "aws_instance" "aws_ec2_test" {
  count         = 1
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "TerraformTestServerInstance"

  }
  
}
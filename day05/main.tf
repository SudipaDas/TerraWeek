resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instance_type

  tags = {
    Name = "my-instance"
  }
}
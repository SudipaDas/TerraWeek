  # Configure the AWS Provider
  terraform {
    required_providers {
      aws = {
          source = "hashicorp/aws"
      }
    }
  }

  provider "aws" {
    region = "us-east-1"
  }

# Create an EC2 instance
  resource "aws_instance" "aws_ec2_test" {
    count = 2
    ami           = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "test-linux-key"

    tags = {
      Name = "TerraformTestServerInstance"
    }
  
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }

  provisioner "local-exec" {
    command = "echo 'Configuration successful'"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update",
        "sudo apt install -y nginx"
     ] 
  }

    }


  output "public_ip" {
       value = aws_instance.aws_ec2_test[*].public_ip
  }

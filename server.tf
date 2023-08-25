terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-09c72d5a7ce529ad5"
  instance_type = "t2.micro"
  key_name = "kiran_cicd"

  tags = {
    Name = "Kiran-DevOps-batch-server"
    env = "Production"
    owner = "Kiran"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}


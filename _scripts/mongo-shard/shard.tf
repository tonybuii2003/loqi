terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "default" {
  ingress {
    description = "Receive SSH from home."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Mongosh connections"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Send everywhere."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default"
  }
}

resource "aws_key_pair" "home" {
  key_name   = "Home"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "us-east1" {
  ami                         = "ami-0c7217cdde317cfec"
  instance_type               = "t2.medium"
  vpc_security_group_ids      = [aws_security_group.default.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.home.key_name
  user_data                   = file("docker.sh")
  tags = {
    Name = "default"
  }
}

output "instance_ip_addr" {
  value = aws_instance.us-east1.public_ip
}

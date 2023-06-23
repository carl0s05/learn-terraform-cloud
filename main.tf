terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.54.0"
    }
  }

/*cloud {
    organization = "coppel-ha"

    workspaces {
      name = "learn-terraform-cloud-sg"
    }
}*/

}

# Configure the AWS Provider ESTO ES PRUEBA
provider "aws" {
  region     = "us-east-1"
}

resource "aws_security_group" "GS_TEST_TF" {
  name        = "GS-TEST-TF"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-0dd386a84ae505125"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"//-1 = ALL | TCP | UPD
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "GS-TEST-TF"
  }
}

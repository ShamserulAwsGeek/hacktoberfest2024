# Aws instance resource creation:
resource "aws_instance" "sham-instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION, "") # last parameter is the default value
  instance_type = "t2.micro"
}

# Provider details key:
provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

# variable declaration:
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d729a60"
  }
}

# Terraform versions:
terraform {
  required_version = ">= 0.12"
}

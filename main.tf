provider "aws" {
  region = "ap-south-1"
}

provider "github" {
  token = "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"
}
/* declare variables */
variable "my_ami_id" {
  default = "ami-079b5e5b3971bd10d"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "mykeypair"
}

/* HI IAM RESOURCE SECTION */

resource "aws_instance" "myec2" {
  ami           = var.my_ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  count         = 1

  tags = {
    Name = "myserver"
  }
}
resource "github_repository" "repo" {
  name        = "terraform_project"
  description = "project2 repo created by terraform"
  visibility  = "public"
}

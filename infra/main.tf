terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.regiao_aws
}

resource "aws_launch_template" "tp_djangoapp" {
  image_id      = "ami-0c7217cdde317cfec"
  instance_type = var.instancia
  key_name      = var.chave
  tags = {
    Name = "Terraform Ansible DjangoApp"
  }
  security_group_names = [aws_security_group.access_geral.id]
  user_data            = var.producao ? filebase64("ansible.sh") : ""
}

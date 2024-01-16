resource "aws_default_subnet" "subnet-1" {
  availability_zone = "${var.regiao_aws}a"
}

resource "aws_default_subnet" "subnet-2" {
  availability_zone = "${var.regiao_aws}b"
}

resource "aws_default_vpc" "default" {

}
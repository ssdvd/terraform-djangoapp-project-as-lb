module "aws-dev" {
  source     = "../../infra"
  instancia  = "t2.micro"
  regiao_aws = "us-east-1"
  chave      = "ec2-east1"
  env        = "env_dev"
  asgname    = "asg_dev"
  sg         = "sg_dev"
  minimo     = 0
  maximo     = 1
  producao   = false
}

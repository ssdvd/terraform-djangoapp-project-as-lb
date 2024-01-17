module "aws-prod" {
  source     = "../../infra"
  instancia  = "t2.micro"
  regiao_aws = "us-east-1"
  chave      = "ec2-east1"
  env        = "env_prod"
  sg         = "sg_prod"
  asgname    = "asg_prod"
  minimo     = 1
  maximo     = 5
  producao   = true
}

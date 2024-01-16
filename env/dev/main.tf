module "aws-dev" {
  source     = "../../infra"
  instancia  = "t2.micro"
  regiao_aws = "us-east-1"
  chave      = "ec2-east1"
  env        = "dev"
  sg_env     = [module.aws-dev.aws_security_group.access_geral.name]
  minimo     = 0
  maximo     = 1
  nomeGrupo  = "dev"
  producao   = false
}
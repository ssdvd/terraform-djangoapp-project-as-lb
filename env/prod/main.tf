module "aws-prod" {
  source     = "../../infra"
  instancia  = "t2.micro"
  regiao_aws = "us-east-1"
  chave      = "ec2-east1"
  env        = "prod"
  minimo     = 1
  maximo     = 5
  nomeGrupo  = "prod"
  producao   = true
}

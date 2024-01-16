module "aws-prod" {
  source     = "../../infra"
  instancia  = "t2.micro"
  regiao_aws = "us-east-1"
  chave      = "ec2-east1"
  env        = "prod"
  sg_env     = [aws_security_group.access_ssh.name, 
                aws_security_group.access_app_port.name, 
                aws_security_group.access_db_port.name,
                aws_security_group.access_http.name,
                aws_security_group.access_https.name]
  minimo     = 1
  maximo     = 5
  nomeGrupo  = "prod"
  producao   = true
}

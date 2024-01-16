resource "aws_lb" "loadBalancer" {
  internal = false
  subnets  = [aws_default_subnet.subnet-1.id, aws_default_subnet.subnet-2.id]
  count    = var.producao ? 1 : 0
}

resource "aws_lb_target_group" "alvoLoadBalancer" {
  name     = "instancetarget"
  port     = "8000"
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
  count    = var.producao ? 1 : 0
}

resource "aws_lb_listener" "entradaLoadBalancer" {
  load_balancer_arn = aws_lb.loadBalancer[0].arn
  port              = "8000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alvoLoadBalancer[0].arn
  }
  count = var.producao ? 1 : 0
}


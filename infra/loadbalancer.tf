resource "aws_lb" "lb_djangoapp" {
  internal = false
  subnets  = [aws_default_subnet.subnet_1.id, aws_default_subnet.subnet_2.id]
  count    = var.producao ? 1 : 0
}

resource "aws_lb_target_group" "tg_lb_djangoapp" {
  name     = "instancetarget"
  port     = "8000"
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
  count    = var.producao ? 1 : 0
}

resource "aws_lb_listener" "ls_lb_djangoapp" {
  load_balancer_arn = aws_lb.lb_djangoapp[0].arn
  port              = "8000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_lb_djangoapp[0].arn
  }
  count = var.producao ? 1 : 0
}


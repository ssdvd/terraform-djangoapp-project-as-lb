resource "aws_autoscaling_group" "asg" {
  availability_zones = ["${var.regiao_aws}a", "${var.regiao_aws}b"]
  name               = var.asgname
  max_size           = var.maximo
  min_size           = var.minimo
  launch_template {
    id      = aws_launch_template.tp_djangoapp.id
    version = "$Latest"
  }
  target_group_arns = var.producao ? [aws_lb_target_group.tg_lb_djangoapp[0].arn] : []
  count = var.producao ? 1 : 0
}

resource "aws_autoscaling_policy" "asp_escala" {
  name                   = "tf_escala"
  autoscaling_group_name = var.asgname
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
  count = var.producao ? 1 : 0
}
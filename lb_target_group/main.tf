resource "aws_lb_target_group" "this" {
  name = var.name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id

  //using object

  dynamic "health_check" {
    for_each = var.health_check != null ? [var.health_check] : []
    content {
      interval  = lookup(health_check.value, "interval", null)
      timeout = lookup(health_check.value, "timeout", null)
      healthy_threshold = lookup(health_check.value, "healthy_theshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
      port = lookup(health_check.value, "port", null)
      protocol = lookup(health_check.value, "protocol", null)
      path = lookup(health_check.value, "path", null)
      matcher = lookup(health_check.value, "matcher", null)
    }
  }
/*
  //using list object
  dynamic "health_check" {
    for_each = var.health_check
    content {
      interval  = health_check.value.interval
      timeout = health_check.value.timeout
      healthy_threshold = health_check.value.healthy_threshold
      unhealthy_threshold = health_check.value.unhealthy_threshold
      port = health_check.value.port
      protocol = health_check.value.protocol
      path = health_check.value.path
      matcher = health_check.value.matcher
    }
  }*/
}
# Configure the AWS Provider
provider "aws" {
  version    = "~> 2.0"
  region     = "eu-west-1"
  access_key = "<>"
  secret_key = "<>"
}


module lb_target_group_one {
  source = "./lb_target_group/"

  name = "lb-target-group-test-1"
  port = "9443"
  protocol = "HTTPS"
  vpc_id = "vpc-0e9801d129EXAMPLE"

  //object
  health_check = {
      interval = var.interval
      timeout  = var.timeout
      healthy_threshold = var.healthy_threshold
      unhealthy_threshold = var.unhealthy_threshold
      port = "9444"
      protocol = "HTTPS"
      path = "/ssg/ping"
      matcher = "200"
    }

  //list object
  /*
  health_check = [
    {
      interval = var.interval
      timeout  = var.timeout
      healthy_threshold = var.healthy_threshold
      unhealthy_threshold = var.unhealthy_threshold
      port = "9444"
      protocol = "HTTPS"
      path = "/ssg/ping"
      matcher = 200
    }
  ]*/
}
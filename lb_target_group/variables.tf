variable "name" { //Optional
  description = "(Optional, Forces new resource) The name of the target group. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "port" { //Optional
  description = "(Optional, Forces new resource) The port on which targets receive traffic, unless overridden when registering a specific target."
  type        = string
}

variable "protocol" { //Optional
  description = "(Optional, Forces new resource) The protocol to use for routing traffic to the targets."
  type        = string
}

variable "vpc_id" { //Optional
  description = "(Optional, Forces new resource) The identifier of the VPC in which to create the target group."
  type        = string
}

// healthcheck. (Optional) A Health Check block.

variable "enabled" { //Optional
  description = "(Optional) Indicates whether health checks are enabled."
  type        = bool
  default     = true
}

//object
variable "health_check" { //Required
  type = object({
    interval = number
    timeout  = number
    healthy_threshold = number
    unhealthy_threshold = number
    port = string
    protocol = string
    path = string
    matcher = string
  })
}
//list object
/*
variable "health_check" { //Required
  type = list(object({
    interval = number
    timeout = number
    healthy_threshold = number
    unhealthy_threshold = number
    port = string
    protocol = string
    path = string
    matcher = string
  }))
}*/
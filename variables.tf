//Some reasonable defaults for the project
variable "interval" {
  //Optional
  description = "(Optional) The approximate amount of time, in seconds, between health checks of an individual target."
  type        = number
  default     = 15
}

variable "timeout" { //Optional
  description = "(Optional) The amount of time, in seconds, during which no response means a failed health check."
  type        = number
  default     = 5
}

variable "healthy_threshold" { //Optional
  description = "(Optional) The number of consecutive health checks successes required before considering an unhealthy target healthy."
  type        = number
  default     = 3
}

variable "unhealthy_threshold" { //Optional
  description = "(Optional) The number of consecutive health check failures required before considering the target unhealthy."
  type        = number
  default     = 2
}
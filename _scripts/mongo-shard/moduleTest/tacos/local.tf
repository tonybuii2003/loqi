variable "meat" {
  type        = string
  default     = "chicken"
  description = "Type of meat to put on the taco."

  validation {
    condition     = contains(["chicken", "beef", "fish", "sofritas"], var.meat)
    error_message = "The meat must be in the list chicken, beef, pork, sofritas."
  }
}

variable "cheese" {
  type        = string
  default     = "jack"
  description = "Type of cheese to put on the taco."

  validation {
    condition     = contains(["cheddar", "jack", "blanco", "fresco"], var.cheese)
    error_message = "The cheese must be in the list cheddar, jack, blanco, fresco."
  }
}

variable "shell" {
  type        = string
  default     = "crunchy"
  description = "Type of shell to use for the taco."

  validation {
    condition     = contains(["corn", "flour", "crunchy"], var.shell)
    error_message = "The shell must be in the list corn, flour, crunchy."
  }
}

locals {
  taco = {
    meat   = var.meat
    cheese = var.cheese
    shell  = var.shell
  }
}

output "taco" {
  value = local.taco
}

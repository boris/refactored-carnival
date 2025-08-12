variable "nyc1" {
  description = "DO New York City 1"
  default     = "nyc1"
}

variable "nyc2" {
  description = "DO New York City 2"
  default     = "nyc2"
}

variable "nyc3" {
  description = "DO New York City 3"
  default     = "nyc3"
}

# Instances size
variable "tiny" {
  description = "512MB instance"
  default     = "512mb"
}

# OS
variable "ubuntu" {
  description = "16.04 LTS"
  default     = "ubuntu-16-04-x64"
}

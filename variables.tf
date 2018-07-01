# CIDR
variable "main_cidr" {
  default = "172.16.0.0/24"
}

# Public Subnet 1
variable "pub-1" {
  default = "172.16.0.0/26"
}

# Public Subnet 2
variable "pub-2" {
  default = "172.16.0.64/26"
}

variable "pvt-1" {
  default = "172.16.0.128/26"
}

# Public Subnet 2
variable "pvt-2" {
  default = "172.16.0.196/26"
}

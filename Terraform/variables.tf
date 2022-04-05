/*variable "instancetype1" {
  type = string
}
variable "instancetype2" {
  type = string
}
variable "instancecount" {
  type = number
}
variable "region" {
  default = "us-west-2"
}
variable "istest" {}

variable "sg_ports" {
  type    = list(number)
  default = [8200, 8201, 8300, 8301]
}*/

variable "machinetype" {
  type = string
  default = "f1-micro"
}

variable "instancename" {
  type = string
  default = "sre-terminal"
}

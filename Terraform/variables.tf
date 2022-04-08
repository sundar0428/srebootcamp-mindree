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

// Compute Instance Variables
variable "machinetype" {
  type    = string
  default = "f1-micro"
}

variable "instancename" {
  type    = string
  default = "sre-terminal1"
}

//GKE Cluster Variables

variable "clustername" {
  type    = string
  default = "my-cluster"
}

variable "nodepoolname" {
  type    = string
  default = "my-nodepool"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}
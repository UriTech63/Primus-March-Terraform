variable "instancetype" {
  default = "t2.micro"
}
variable "keypair" {
<<<<<<< HEAD
  default = "terrafrom-key"
=======
  default = "project-key"
>>>>>>> 90b59ec9bf414699ca52e306874496b190b73c17
}
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}
variable "avzone" {
  default = "us-east-1a"
}
variable "region" {
  default = "us-east-1"

<<<<<<< HEAD
}

# variable "keyName" {
  # default = "~/.ssh/id_rsa.pub"
#}

variable "user-data" {
  default = "shellscript.sh"
  
}

/* variable "tags" {
type = set(string)
  default = ["primus-server", "bahbah", "uriel"]
  
}*/
=======
}
>>>>>>> 90b59ec9bf414699ca52e306874496b190b73c17

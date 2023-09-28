variable "instancetype" {
  default = "t2.micro"
}
variable "keypair" {
  default = "terrafrom-key"
}
variable "vpc-cidr" {
  default = "10.0.0.0/16"
}
variable "avzone" {
  default = "us-east-1a"
}
variable "region" {
  default = "us-east-1"

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
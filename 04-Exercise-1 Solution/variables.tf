variable "instancetype" {
    default = "t2.nano"
}

variable "az-s" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]
}

variable "az-se" {
    type = list
    default = ["ap-southeast-1a","ap-southeast-1b"]
}

variable "ami-mumbai" {
    default = "ami-079b5e5b3971bd10d"
}

variable "ami-singapore" {
    default = "ami-0bd6906508e74f692"
}
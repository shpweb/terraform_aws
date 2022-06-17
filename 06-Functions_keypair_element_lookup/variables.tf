variable "my_ip" {
    default = "123.201.2.99/32"
}
variable "region" {
    default = "ap-south-1"
}
variable "ami" {
    type = map
    default = {
        ap-south-1 = "ami-079b5e5b3971bd10d"
        ap-southeast-1 = "ami-0bd6906508e74f692"
    }    
}
variable "nametag" {
    type = list
    default = ["ec2-01","ec2-02"]
}

variable "az-s" {
    type = list
    default = ["ap-south-1a","ap-south-1b"]
}
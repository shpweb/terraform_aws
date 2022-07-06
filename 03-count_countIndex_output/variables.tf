variable "iam_lb" {
    type = list
    default = ["dev-lb","stg-lb","prd-lb"]
}

variable "instancetype" {
    default = "t2.micro"
}
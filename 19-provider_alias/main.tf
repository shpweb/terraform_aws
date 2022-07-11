resource "aws_ecs_cluster" "foo" {
  name = "white-hart"
  provider = aws.us

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
module "service" {
  source      = "../../../modules/service"
  name        = "dev"
  environment = "dev"
  region      = "us-west-2"
  tags = {
    Name        = "dev"
    Environment = "dev"
  }
}

resource "aws_instance" "myec2" {
    for_each = {
        Instance-1    = "t2.micro"
        Instance-2 = "t3.micro"
    }
    ami = var.ami_id
    instance_type = each.value
    region = var.region_n_virginia
    
    tags = {
        Name = each.key
        environment = "${local.environment}"
    }
}

resource "aws_iam_user" "team" {
  for_each = toset(["Hilary", "Made", "Cynthia", "Celestine","Arvind"])
  name     = each.value
}




locals {
  project     = "buy-again"
  environment = "production"
  name_prefix = "${local.project}-${local.environment}"

  common_tags = {
    Project   = local.project
    Env       = local.environment
    ManagedBy = "Terraform"
  }
}


module "app_data" {
  source      = "./modules/s3-bucket"
  bucket_name = "my-app-data-2026-celestine"
  tags        = { Project = "MyApp-dev" }
}

module "app_data_hillary" {
  source      = "./modules/s3-bucket"
  bucket_name = "my-app-data-2026-hillary"
  tags        = { Project = "MyApp-dev" }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "my-vpc-celestine"
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
}
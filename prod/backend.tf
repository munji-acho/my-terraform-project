terraform {
  backend "s3" {
    bucket         = "my-state-bucket-celestine"
    key            = "my-tf-project/terraform-dev.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks-abc"
    #profile        = "arvind"
  }
}

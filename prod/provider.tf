provider "aws" {
  region     = var.region_n_virginia
  #profile     = var.profile

  
  skip_requesting_account_id = true
  
}

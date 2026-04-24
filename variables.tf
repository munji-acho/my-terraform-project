variable "region_n_virginia" {}
variable "instance_type" {}
variable "ami_id" {}
variable  "profile" {}
variable "my_tags" {
    type= map(string)
    default = {
        Name = "any-value"
        env_name = "any-value-env"
    }
}
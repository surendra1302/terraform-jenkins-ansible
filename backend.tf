terraform {
  backend "s3" {
    bucket = "terraform-jenkins-ansible"
    key = "remote.tfstate"
    region = "us-east-1"
  }
}

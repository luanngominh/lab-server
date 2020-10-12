terraform {
  backend "s3" {
    bucket = "lab-s3-state"
    key    = "tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "lab-server-locker"
  }
}



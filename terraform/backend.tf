terraform {
  backend "s3" {
    bucket = "splunk-state"
    key    = "tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "splunk-state"
  }
}



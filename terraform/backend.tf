terraform {
  backend "s3" {
    bucket = "splunk-state"
    key    = "tfstate"
    region = "ap-southeast-1"
    access_key = "${var.aws_state_access_key_id}"
    secret_key = "${var.aws_state_secret_access_key}"
    dynamodb_table = "${var.dynamo_table}"
  }
}



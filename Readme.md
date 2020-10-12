# Provision lab server
* S3 bucket: splunk-state
* Dynamo table: splunk-state LockID S
* Provision: make apply
* Add credentials file as below:
```hcl
aws_access_key_id="meocon"
aws_secret_access_key="meocon"
```
* Change s3 bucket and dynamo table: backend.tf, values.tfvars
* Place your public key at bootstrap/id_rsa.pub


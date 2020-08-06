# Provision lab server
* S3 bucket: splunk-state
* Dynamo table: splunk-state LockID S
* Provision: make apply
* Add credentials file as below:
```hcl
aws_access_key_id="meocon"
aws_secret_access_key="meocon"
```


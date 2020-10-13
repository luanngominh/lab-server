# Dynamo locking table
dynamo_table = "lab-server-locker"
bucket = "lab-s3-state"

# Instance configuration
region = "ap-southeast-1"
instance_type = "t2.medium"
instance_ami = "ami-02b6d9703a69265e9"
number_of_instance = "3"
disk_size = "50"
ssh_private_key = "/Users/ngominhluan/.ssh/id_rsa"
ec2_user = "ec2-user"

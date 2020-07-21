provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key_id}"
  secret_key = "${var.aws_secret_access_key}"
}


# Create PVC
resource "aws_vpc" "host" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "host"
  }
}

resource "aws_subnet" "host_public" {
  vpc_id = "${aws_vpc.host.id}"
  cidr_block = "172.16.13.0/24"

  tags = {
    Name = "host_public"
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_internet_gateway" "host_igw" {
  vpc_id = "${aws_vpc.host.id}"

  tags = {
    Name = "host_igw"
  }
}

resource "aws_route_table" "host_public_route" {
  vpc_id = "${aws_vpc.host.id}"

  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.host_igw.id}"
  }

  tags = {
    Name = "host_public_route"
  }
}

resource "aws_route_table_association" "route_public_subnet_associate" {
  subnet_id = "${aws_subnet.host_public.id}"
  route_table_id = "${aws_route_table.host_public_route.id}"
}

resource "aws_security_group" "host_sg" {
  name        = "host_sg"
  description = "Host security group"
  vpc_id      = "${aws_vpc.host.id}"

  ingress {
    description = "All traffic in the same VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.host.cidr_block]
  }

  ingress {
    description = "SSH from others"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "host_sg"
  }
}


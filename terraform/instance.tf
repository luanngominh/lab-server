resource "aws_key_pair" "splunk_key_pair" {
  key_name   = "splunk_key_pair"
  public_key = file("bootstrap/id_rsa.pub")
}

resource "aws_instance" "splunk" {
  count = "${var.number_of_instance}"
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  key_name = "${aws_key_pair.splunk_key_pair.key_name}"
  vpc_security_group_ids = ["${aws_security_group.splunk_sg.id}"]
  subnet_id = "${aws_subnet.splunk_public.id}"
  private_ip = "172.16.13.5${count.index + 1}"
  associate_public_ip_address = true

  root_block_device {
    volume_size = "20"
    volume_type = "standard"
  }

  # Add data disk
  ebs_block_device {
      device_name = "/dev/xvdb"
      volume_size = "${var.disk_size}"
      volume_type = "standard"
  }

  tags = {
    Name = "splunk_${count.index + 1}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get upgrade -y",
      "sudo hostnamectl set-hostname splunk-${count.index + 1}"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "${self.public_ip}"
      private_key = "${file(var.ssh_private_key)}"
    }
  }
}

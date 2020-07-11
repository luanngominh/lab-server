output "ceph_public_ip" {
  value = aws_instance.splunk[*].public_ip
}

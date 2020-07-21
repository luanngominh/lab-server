output "ceph_public_ip" {
  value = aws_instance.host[*].public_ip
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "local_file" "private_key_pem" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "../ansible/prometheus-key.pem"
  file_permission = "0400"
}

resource "aws_key_pair" "prometheus" {
  key_name   = "prometheus-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

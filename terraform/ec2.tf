module "prometheus_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"

  name          = "prometheus"
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.prometheus_security_group.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ansible.key_name
}

module "prometheus_node_exporter_ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"

  name          = "prometheus-node-exporter"
  ami           = "ami-00d8fc944fb171e29"
  instance_type = "t3.micro"

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.prometheus_node_exporter_security_group.security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ansible.key_name
}

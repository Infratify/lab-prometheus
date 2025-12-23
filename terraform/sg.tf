module "prometheus_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "prometheus"
  description = "Security group for prometheus"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["prometheus-http-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

module "prometheus_node_exporter_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "prometheus-node-exporter"
  description = "Security group for prometheus node exporter"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["prometheus-node-exporter-http-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}

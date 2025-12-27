resource "local_file" "prometheus" {
  content = templatefile("${path.module}/prometheus.tftpl", {
    prometheus               = module.prometheus_ec2
    prometheus_node_exporter = module.prometheus_node_exporter_ec2
  })
  filename = "../ansible/prometheus.yml"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    instances = [
      module.prometheus_ec2,
      module.prometheus_node_exporter_ec2
    ]
    prometheus               = module.prometheus_ec2
    prometheus_node_exporter = module.prometheus_node_exporter_ec2
    ssh_private_key          = local_file.private_key_pem.filename
  })
  filename = "../ansible/inventory.ini"
}

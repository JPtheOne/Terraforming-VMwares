resource "vmware_virtual_machine" "vm" {
  name           = var.vm_name
  clone_from_vmx = var.template_vmx

  network_adapter {
    type = "nat"
  }

  connection {
    type     = "ssh"
    user     = var.ssh_user
    password = var.ssh_password
    host     = self.ip_address
  }

  # Install Apache automatically
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install apache2 -y",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
    ]
  }

  # write inventory for ansible (optional)
  provisioner "local-exec" {
    command = <<-EOT
      echo "[apache]" > ansible/inventory
      echo "${self.ip_address} ansible_user=${var.ssh_user} ansible_password=${var.ssh_password}" >> ansible/inventory
    EOT
  }

  # call ansible (optional)
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory ansible/apache.yml"
  }
}

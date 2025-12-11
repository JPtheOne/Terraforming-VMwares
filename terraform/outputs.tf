output "vm_summary" {
  description = "Summary of the VM created by Terraform"
  value = {
    vm_name         = vmware_virtual_machine.vm.name
    ip_address      = vmware_virtual_machine.vm.ip_address
    template_used   = var.template_vmx
    ssh_user        = var.ssh_user
    ssh_password    = var.ssh_password
  }
}

output "next_steps" {
  description = "What to do after apply"
  value = <<EOF

Terraform deployment completed!

You can now access the Apache server at:
    http://${vmware_virtual_machine.vm.ip_address}

SSH into your VM using:
    ssh ${var.ssh_user}@${vmware_virtual_machine.vm.ip_address}

If something failed, run Terraform with debugging enabled:
    TF_LOG=DEBUG terraform apply -var="template_vmx=..."

EOF
}

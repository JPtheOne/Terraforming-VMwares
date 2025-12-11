variable "template_vmx" {
  description = "Path to the VMX file of the Ubuntu template"
  type        = string
}

variable "vm_name" {
  description = "Name of the cloned VM"
  type        = string
  default     = "apache-server"
}

variable "ssh_user" {
  description = "SSH user for template and clones"
  type        = string
  default     = "ubuntu"
}

variable "ssh_password" {
  description = "SSH password for template and clones"
  type        = string
  default     = "ubuntu"
}

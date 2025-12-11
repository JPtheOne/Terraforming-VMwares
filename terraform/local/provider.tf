terraform {
  required_providers {
    vmware = {
      source = "terra-farm/vmware"
    }
  }

  required_version = ">= 1.0"
}

provider "vmware" {}

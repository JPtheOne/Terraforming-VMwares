# Terraforming-VMwares

A learning-focused Infrastructure-as-Code (IaC) project demonstrating how to automate virtual machine provisioning locally using **Terraform** and **VMware Workstation Pro**, and later evolve the same workflow into a fully automated production deployment.

This repository documents the full journey through a journal-style structure, while also containing real Terraform code for both local and production environments.

---

## 🚀 Project Goals

- Learn Terraform with a practical, hands-on environment.
- Deploy a local Ubuntu VM running Apache using Terraform.
- Understand limitations of VMware Workstation and how to work around them.
- Prepare production-grade Terraform code for a prod environment.
- Keep a detailed journal documenting every step and decision.

---

## 🧩 Why VMware Workstation Requires a Template

VMware Workstation Pro does **not** expose a full API for Terraform to:

- create a VM from scratch  
- boot from an ISO  
- perform unattended OS installation  
- apply cloud-init  

Because of this limitation, Terraform can only automate Workstation by **cloning an existing `.vmx` virtual machine**.

### Therefore:

- You manually create an **Ubuntu Server 22.04 LTS template VM** **once**.
- Terraform clones that VM automatically for each deployment.
- Terraform then provisions Apache inside the cloned VM.

This workflow mirrors real industry “golden image” practices.

---

## 🖥️ Local Automation Flow (Workstation)

1. Create an Ubuntu Server **template VM** manually (one-time).
2. Terraform clones the VM using the `.vmx` file.
3. Terraform boots the cloned VM.
4. Terraform connects via SSH.
5. Terraform installs and enables Apache.
6. Terraform outputs the server's IP address.

You can then access the Apache server in your browser.

---

## 🏢 Production Workflow (Cloud or Enterprise Hypervisors)

While the local development flow uses VMware Workstation as a simple and accessible lab environment, the long-term goal of this project is to adapt the same Terraform logic to a real production-grade platform.

In a production environment, Terraform typically interacts with fully featured APIs provided by:

- **Cloud providers** (AWS, Azure, GCP)
- **Enterprise hypervisors** (VMware vSphere / ESXi, Proxmox VE, Hyper-V)
- **Virtualization platforms with image and cloud-init support**
- **On-premise infrastructure orchestrated via modern APIs**

Unlike VMware Workstation, these platforms allow Terraform to:

- Create virtual machines **from images** instead of templates  
- Perform **fully automated OS deployment** using cloud-init or userdata  
- Configure networking, disks, tags, metadata, and firewall rules  
- Scale horizontally using modules and reusable blueprints  
- Integrate with CI/CD pipelines for true infrastructure lifecycle automation  

### What this means for the project

The same conceptual workflow built locally will later evolve into:

1. A **cloud-init–based automated VM deployment** (no manual templates).  
2. Production-ready **Terraform modules** with parameters for CPU, RAM, images, and networks.  
3. The option to integrate **Ansible**, **Packer**, or **Kubernetes** as the project grows.  
4. A future-proof IaC structure that can be reused for:
   - Web servers  
   - API services  
   - Load balancers  
   - Databases  
   - Full multi-tier architectures  

### Why keep both environments in the same repository?

- Shows a clear evolution from *learning → prototyping → production design*
- Demonstrates Terraform's portability across platforms  
- Helps future readers understand workflows in both local and real environments  
- Preserves the developer journey documented in the journal

The production folder will eventually contain the “fully automated” version of the project, while the local folder remains a valuable lab for experimentation and learning.

---

## 🏗️ Repository Structure
```bash
Terraforming-VMwares/
├── journal/
│   ├── day00-vmware-installation.md
│   ├── day01-terraform-installation.md
│   └── (more entries soon)
│
├── terraform/
│   ├── local/
│   │   ├── provider.tf
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── (optional: ansible/)
│   │
│   └── production/
│       ├── provider.tf
│       ├── variables.tf
│       ├── main.tf
│       ├── cloud-init.yaml
│       └── outputs.tf
│
└── README.md


```
---

## 🔧 Technologies Used

- **Terraform (HCL)**
- **VMware Workstation Pro 17**
- **Ubuntu Server 22.04 LTS**
- (Optional) **Ansible**



## 📓 Learning Journal

All decisions, roadblocks, insights, and solutions are documented in:

```bash
Terraforming-VMwares/
├── journal/
```


This helps build professional learning transparency and supports future onboarding.

---

## 📜 Status

### ✔ Completed:
- Terraform installation
- VMware Workstation installation
- Decision to use a one-time Ubuntu template for local automation
- Repository structure
- Initial Terraform code for local VM deployment

### 🔜 Coming Next:
- Final Apache deployment via Terraform locally
- Add debugging tools and improved outputs
- Implement prod Terraform provider
- Cloud-init for fully automated production deployments

---

## 📬 About This Project

Created as a personal learning lab to bridge local IaC experimentation with real enterprise-grade automation on cloud providers.  
The repository serves both as a technical implementation and as a documented growth path.



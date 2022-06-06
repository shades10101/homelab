terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.8.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://${var.pm_host}:8006/api2/json"
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
  pm_parallel     = 10
  pm_timeout      = 600
  #  pm_debug = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_vm_qemu" "proxmox_vm_master" {
  count       = var.num_k8s_masters
  name        = "k8s-master-${count.index}"
  target_node = var.pm_node_name
  clone       = var.tamplate_vm_name
  os_type     = "ubuntu"
  memory      = var.num_k8s_masters_mem
  cores       = 2

  ipconfig0 = "ip=${var.master_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      disk,
      sshkeys,
      network
    ]
  }

}

resource "proxmox_vm_qemu" "proxmox_vm_workers" {
  count       = var.num_k8s_nodes
  name        = "k8s-worker-${count.index}"
  target_node = var.pm_node_name
  clone       = var.tamplate_vm_name
  os_type     = "ubuntu"
  memory      = var.num_k8s_nodes_mem
  cores       = 2

  ipconfig0 = "ip=${var.worker_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      disk,
      sshkeys,
      network
    ]
  }

}

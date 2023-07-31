resource "proxmox_vm_qemu" "master-vpn-cloud-init" {
  vmid = 140
  name = "master-vpn"
  desc = "Ubuntu cloud image"
  target_node = "mk"

  clone = "ubuntu-cloud-img"

  cores = 2
  memory = 2048
  scsihw = "virtio-scsi-pci"

  disk {
    storage = "local-lvm"
    size = "6G"
    type = "scsi"
  }

  os_type = "cloud-init"

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=192.168.0.60/24,gw=192.168.0.1"

  onboot = false
}

resource "proxmox_vm_qemu" "github-runner-cloud-init" {
  vmid = 141
  name = "github-runner"
  desc = "Server for running github actions"
  target_node = "mk"

  clone = "ubuntu-cloud-img"

  cores = 2
  memory = 2048
  scsihw = "virtio-scsi-pci"

  disk {
    storage = "local-lvm"
    size = "4300M"
    type = "scsi"
  }

  os_type = "cloud-init"

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=192.168.0.61/24,gw=192.168.0.1"

  onboot = true
}

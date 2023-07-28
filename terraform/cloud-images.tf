resource "proxmox_vm_qemu" "cloud-init-vm" {
  vmid = 140
  name = "master-vpn"
  desc = "Ubuntu cloud image"
  target_node = "mk"

  clone = "ubuntu-cloud-img"

  cores = 2
  memory = 2048

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

  ipconfig0 = "ip=192.168.0.60/24,gw=192.168.0.1"

  onboot = false
}

resource "proxmox_vm_qemu" "test-vm" {
  name = "Test-VM"
  vmid = 110
  target_node = var.NODE_NAME
  clone_id = 100

  memory = 2048
  scsihw = "virtio-scsi-single"

  disk {
    type        = "disk"
    disk_file   = "local:110/vm-110-disk-0.qcow2"
    passthrough = true
    slot        = "scsi0"
  }
}
resource "proxmox_vm_qemu" "cloudinit-example" {
  vmid        = 100
  name        = "cloudinit-example"
  target_node = ""
  agent       = 1
  memory      = 1024
  boot        = "order=scsi0"
  clone       = "template.alt-server-11-cloud"
  scsihw      = "virtio-scsi-single"
  vm_state    = "running"
  automatic_reboot = true

  cicustom   = "vendor=local:snippets/cloud-init.yml"
  ciupgrade  = true
  nameserver = "8.8.8.8"
  ipconfig0  = "ip=dhcp,ip6=dhcp"
  skip_ipv6  = true
  ciuser     = "root"
  cipassword = "P@ssw0rd"
  sshkeys    = ""

  cpu {
    cores   = 2
    sockets = 1
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local"
          size    = "10G" 
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = "local"
        }
      }
    }
  }

  network {
    id = 0
    bridge = "vmbr0"
    model  = "virtio"
  }
}
 provider "google" {
    project = "siva-477505" 
}
resource "google_compute_instance" "instance1" {
    name = "vm-1"
    zone =  "us-central1-a" 
    machine_type = "e2-micro"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-12"        
      }
    }
    network_interface {
        network = "default"
        access_config {
           //
        }
    }
    metadata = {
      ssh-keys = "sivapk188:${file("/home/sivapk188/.ssh/id_ed25519.pub")}"
    }
}

output "vm_external_ip" {
  value = google_compute_instance.instance1.network_interface[0].access_config[0].nat_ip
}


resource "local_file" "file1" {
    content  = google_compute_instance.instance1.network_interface[0].access_config[0].nat_ip
    filename = "/home/sivapk188/vm_public_ip.txt" 
}

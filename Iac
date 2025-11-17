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
}

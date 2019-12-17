variable "project" {
  type        = string
  description = "The name of the project as available in Google Cloud Platform Console."
}

variable "credentials" {
  type        = string
  description = "The filename of the json file that contains the service account key.\nIt can be obtained at: https://console.cloud.google.com/apis/credentials/serviceaccountkey"
}

variable "instances" {
  type        = string
  default     = 1
  description = "The number of controller (master) instances to spawn"
}

variable "master" {
  type = object({
    prefix    = string
    instances = number
  })
}

variable "worker" {
  type = object({
    prefix    = string
    instances = number
  })
}

locals {
  username     = "ubuntu"
  machine_type = "n1-highmem-2"

  master_bootstrap = "master.boot.sh"
  master_playbook  = "master.playbook.yml"
  master_inventory = "master.inventory"

  worker_bootstrap = "worker.boot.sh"
  worker_playbook  = "worker.playbook.yml"
  worker_inventory = "worker.inventory"
}


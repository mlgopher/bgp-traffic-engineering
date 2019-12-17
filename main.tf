module "k8s_master" {
  source = "github.com/mlgopher/TwAdeploy"

  machine_name = var.master.prefix
  instances    = var.master.instances
  project      = var.project
  credentials  = var.credentials

  username       = local.username
  machine_type   = local.machine_type
  playbook_file  = local.worker_playbook
  inventory_file = local.worker_inventory
  bootstrapper   = local.worker_bootstrap
}

module "k8s_workers" {
  source = "github.com/mlgopher/TwAdeploy"

  machine_name = var.worker.prefix
  instances    = var.worker.instances
  project      = var.project
  credentials  = var.credentials

  username       = local.username
  machine_type   = local.machine_type
  playbook_file  = local.worker_playbook
  inventory_file = local.worker_inventory
  bootstrapper   = local.worker_bootstrap
}

resource "null_resource" "alert" {
  provisioner "local-exec" {
    command = "echo Everything done."
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm playbooks/.*.tmp"
  }

  depends_on = [null_resource.alert]
}



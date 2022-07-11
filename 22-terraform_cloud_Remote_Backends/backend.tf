terraform {
  cloud {
    organization = "shpweb-terraform"

    workspaces {
      name = "remote-backend"
    }
  }
}
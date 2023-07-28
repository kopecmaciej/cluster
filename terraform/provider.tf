terraform {

  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

variable "pr_api_token_id" {
  type = string
  sensitive = true
}

variable "pr_api_token_secret" {
  type = string
  sensitive = true
}
  
variable "pr_api_url" {
  type = string
}

provider "proxmox" {
  pm_debug = true
  pm_api_url = var.pr_api_url
  pm_api_token_id = var.pr_api_token_id
  pm_api_token_secret = var.pr_api_token_secret
}

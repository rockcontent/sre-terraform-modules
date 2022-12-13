terraform {
  required_providers {
    spotinst = {
      source = "spotinst/spotinst"
      version = "1.87.1"
    }
  }
}

provider "spotinst" {
   token   = var.spotinst_token
   account = var.spotinst_account
}
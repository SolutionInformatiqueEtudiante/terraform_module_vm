terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.1"
    }
    warpgate = {
      source  = "warp-tech/warpgate"
      version = "1.0.1"
    }
  }
}

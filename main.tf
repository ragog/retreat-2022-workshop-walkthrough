terraform {
    required_providers {
      checkly = {
        source = "checkly/checkly"
        version = "1.4.0-rc2"
      }
    }
}

variable "checkly_api_key" {
}

variable "checkly_account_id" {
}

provider "checkly" {
  api_key = var.checkly_api_key
  account_id = var.checkly_account_id
}

resource "checkly_check" "api-random-joke" {
  name                      = "GET joke"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 10
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  request {
    url              = "https://icanhazdadjoke.com/"
    headers = {
      Accept = "application/json"
    }
  }
  
}
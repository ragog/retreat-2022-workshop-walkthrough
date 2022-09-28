variable "checkly_api_key" {}
variable "checkly_account_id" {}

terraform {
  required_providers {
    checkly = {
      source = "checkly/checkly"
      version = "1.6.2"
    }
  }
}

provider "checkly" {
  api_key = var.checkly_api_key
  account_id = var.checkly_account_id
}

resource "checkly_check" "get-near-approach-object" {
  name                      = "GET object (Exercise 1)"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 5
  double_check              = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  request {
    url = "https://ssd-api.jpl.nasa.gov/cad.api"
    headers = {
      Accept = "application/json"
    }
    query_parameters = {
      des = "433",
      date-min = "2023-01-01",
      date-max = "2100-01-01",
      dist-max = "0.2"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.count"
      comparison = "EQUALS"
      target     = "2"
    }
  }
  
}

resource "checkly_check" "browser-check" {

  name                      = "Find jokes (Exercise 2)"
  type                      = "BROWSER"
  activated                 = true
  should_fail               = false
  frequency                 = 5
  double_check              = true
  use_global_alert_settings = true
  locations = [
    "us-west-1",
    "eu-central-1"
  ]

  script = file("${path.module}/scripts/dadjoke.js")

}
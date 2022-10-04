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

  alert_channel_subscription {
    channel_id = checkly_alert_channel.email_channel.id
    activated  = true
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

  script = <<EOT
const { chromium } = require('playwright')
const expect = require('expect');

(async () => {
	const browser = await chromium.launch();
	const context = await browser.newContext();

	const page = await context.newPage();

	await page.goto('https://icanhazdadjoke.com/');

	await page.locator('#nav-menu a:has-text("Search jokes")').click();

	await page.locator('[placeholder="Search terms\\.\\.\\."]').click();
	await page.locator('[placeholder="Search terms\\.\\.\\."]').fill('orange');
	await page.locator('[placeholder="Search terms\\.\\.\\."]').press('Enter');

	await page.screenshot({ path: 'scr1.png' })

	const rows = page.locator('table tr');
	const count = await rows.count()

	expect(count).toEqual(8)

	await context.close();
	await browser.close();
})();

EOT

  alert_channel_subscription {
    channel_id = checkly_alert_channel.email_channel.id
    activated  = true
  }

}

resource "checkly_alert_channel" "email_channel" {
  email {
    address = "<MY_EMAIL_ADDRESS>"
  }
}
```
Note for technical users: the below guide is for your colleagues who might not be familiar / have git installed - no need for you to follow this as you already know your way around.
```

## Setup

You can get up and running with Terraform and Checkly in just a few minutes! Follow the steps below.

### Create a free account on Checkly

If you already have an account you have access to, you can skip this step. Otherwise, create a free account on Checkly and skip the guided onboarding part for this exercise (or use it to your advantage!).

### Download & install Terraform

In your terminal, if you have homebrew installed:

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Otherwise, you can manually download and install Terraform:

* [M1 MacBook](https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_arm64.zip) or
* [Intel MacBook](https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_amd64.zip)

### Set up Terraform project

In your terminal:

```
mkdir terraform-challenge && cd $_
touch main.tf
```

Download `main.tf` from this repository and move it into the folder you have created.

```
terraform init
```

Get your [account ID](https://app.checklyhq.com/settings/account/general) and create an [API key](https://app.checklyhq.com/settings/user/api-keys) on Checkly. Don't lose them as we need to pass those on to Terraform.

```
export TF_VAR_checkly_api_key=YOUR_API_KEY
export TF_VAR_checkly_account_id=YOUR_ACCOUNT_ID
```

You are now ready to run your Terraform project.

## Run your project

In your terminal:

```
terraform apply
```

Enter `yes` when requested.
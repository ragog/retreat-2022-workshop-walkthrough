# 2022 Checkly Product Workshop 

Welcome raccoons! :raccoon: In this repository you find both the solutions to the exercise and a walkthrough on how to get them up and running (in this here README).

`
Note for technical users: the below guide is for your colleagues who might not be familiar / have git installed - no need for you to follow this as you already know your way around.
`

## Setup :flight_departure:	

You can get up and running with Terraform and Checkly in just a few minutes! Follow the steps below.

### Create a free account on Checkly

If you already have an account you have access to, you can skip this step. Otherwise, [create a free account](https://app.checklyhq.com/signup) on Checkly and skip the guided onboarding part for this exercise.

### Download & install Terraform

There's different ways you can install Terraform.
If you have [homebrew](https://brew.sh/) installed, you can run the following in your terminal:

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Otherwise, you can manually download and install Terraform:

* [M1 MacBook](https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_arm64.zip) or
* [Intel MacBook](https://releases.hashicorp.com/terraform/1.3.1/terraform_1.3.1_darwin_amd64.zip)

| Tip: you can open your terminal by pressing `Cmd` + `Space`, then entering "terminal" and pressing `Enter`

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

## Run your project :rocket:

In your terminal:

```
terraform apply
```

Enter `yes` when requested.

You should see a success message appeart in your terminal, together with checks and alert channels on your Checkly account. You just took your first step in becoming a Checkly _power_ user. You're awesome! :heart:
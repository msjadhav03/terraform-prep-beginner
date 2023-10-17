# Terraform

- Infrastructure 🗄️ as code tools allow you to `manage infrastructure` with 🛠️ `configuration files`. 🗃️
- `IaC` allows you to build, change and manage your infrastructure. 🗄️
- Infrastruture Management tool.
- `Open source`.
- Used to `build`, `modify` and version control infrastructure.🗄️
- infrastructure is define as `human readable configuration files`. 🛠️ 🗃️
- Terraform interfaces with `APIs` to application and Services.
- Core  (Entery point for using terraform).
- Providers (Logical abstraction for an upstream API)
- written over `1,000 providers to manage resources`.
- Based on `HashiCrop Configuration Language (HCL)`. 🛠️
- `structured Configuration language` 🛠️ rather than data structure serialization language.
- Built around argument and block syntax construct.
- Terraform keeps track of your real infrastructure 🗄️ in a `state file` 🗃️, which acts as a source of `truth for your environment`.
- flow
```js
Practioner ---> Infrastructure as Code ---> Plan ---> Apply ---> Infrastructure 🗄️
```

## To deploy infrastructure with Terraform:

- `Scope` - Identify the 🗄️ infrastructure for your project.
- `Author` - Write the configuration 🛠️ for your infrastructure.
- `Initialize` - Install the plugins Terraform needs to manage the 🗄️ infrastructure.
- `Plan` - Preview the changes Terraform will make to match your configuration. 🛠️
- `Apply` - Make the planned changes.

## Variables
- Input variables resuable values, used like function arguments
```js
variable "access_key" {
    description = "Access Key"
    secrete_key = string
    sensitive = true
}

```

## Provider
- Enables terraform to interact with cloud providers and other APIs
```js
provider "aws" {
    region = ""
    access_key = ""
    secrete_key = ""
}
```

## locals
- Named values that can be assigned in terraform, they are not set by user input
```js
locals {
    name_filter = "vpc-12345-${local.vpc_name}"
}
```

## resource
- Represents infrastructure 🗄️ objects like VPCs, subnets, route tables and gateways
```js
resource "aws_vpc" "dev" {
    cidr_block = "10.5.0.0/20"
    tags = {
        name = "vpc-dev"
    }
}
```
## data
- allows to utilize information that is defined outside the terraform.
```js
data "aws_vpc" "dev" {
    data "aws_vpc" "dev" {
        id = "vpc-12345"
    }
}

resource "aws_subnet" "app" {
    vpc_id = "data.aws_vpc.dev.id"
    cidr_block = "10.5.1.0/24"
    tags = {
        name = "subnet-01"
    }    
}
```

## output
- return structured data from your configuration 🛠️ and work like return values in general-purpose programming language.

```js
output "vpc_id" {
    value = aws_vpc.dev.id
}
```

## Project 

- Seperate Files 🗃️
- versions.tf
- variables.tf
- provider.tf
- main.tf
- outouts.tf


## Example 

```js
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```
- `Terraform Block`

    - `terraform {}` block contains Terraform settings 🛠️, required providers terraform will use to provision your infrastructure. 🗄️
    - `source` attrubute defines an optional hostname, namespace, and the provider type. i.e hashicrop/aws
    - `version` optional, by default installs default version.
    - Installs terraform from terraform registry

- `Providers`

    - Provider bloakc configures the specific provider
    - A plugin terraform uses to create and manage your resources
    
- `Resources`

    - resource block to define components of your infrastructure. 🗄️
    - a resource migth be virtual or physical component like EC2.

- `terraform init`

    - Initalize configuration 🛠️ directory and install the provider defined

- `Formate and Validate` 

    - `terraform fmt` : updates the configurations 🛠️ in the current directory for readability and consistency. `format your configuration` 🛠️
    -  `terraform validate` : Validate your configuration 🛠️

- `Create Infrastructure`

    - `terraform apply` : apply the configuration 🛠️
    - befor applying it prints out execution plan.

- `Inspect State`

    - Terraform wrote data into a file 🗃️ called terraform.tfstate
    - Terraform state file 🗃️ is the only way, terraform can track which resources it manages and often contains sensitive information.
    - Inspect current state using `terraform show`

- `Manually Managing State`

    - `terraform state` : for advanced state management
    - `list` :  to list the resources in your project state.

- Troubleshooting
    -  `terraform validate` can be used to find cause of problem.

# Command Commands
```js
terraform init
terraform fmt
terraform validate
terraform apply 
terraform show
```
`Flow: terraform init ----> terraform fmt ----> terraform validate ----> terraform apply ----> terraform show`


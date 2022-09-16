# Using Terraform with AWS

Terraform is an open-source project maintained by HashiCorp for building, changing, and combining infrastructure 
safely and efficiently. Some of the benefits of using Terraform to provision and manage infrastructure include:

* Version-controlled infrastructure as code
* Multi-cloud support with over 100 providers including Amazon Web Services, Microsoft Azure, and Google Cloud Platform
* Separate plan and apply stages so you can verify changes to your infrastructure before they happen
* A public registry of modules that make provisioning common groups of resources easy HashiCorp also provides enterprise 
versions of Terraform that provide additional features for collaboration, infrastructure policy, and governance.

## Installing Terraform


To install Terraform on a Linux  machine, you will need to download the Terraform binaries provided by HashiCorp.
The most recent version of Terraform for all platforms can be found on Terraform's downloads page.
To download therelease package, for example version 1.0.1 do the following:

```
wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip
```

2. Now extract the zip archive containing the Terraform binary to the /usr/local/bin directory:

```
sudo unzip terraform_1.0.1_linux_amd64.zip -d /usr/local/bin/
```

`/usr/local/bin` is included in the PATH environment variable allowing you to run terraform from any directory.


3. Remove the release package:

```
rm terraform_1.0.1_linux_amd64.zip
```

4. Confirm Terraform version 1.0.1 is installed:

```
terraform version
```

## Configuring providers


Terraform uses a plugin architecture to manage all of the resource providers that it supports. No providers 
are included when you first install Terraform. You declare which providers you need to use in a configuration 
file. Terraform configuration files have a `.tf` file extension.
Create a file `main.tf` and add in the following configuration:



```
}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
```


Starting with Terraform version 13.0,  the required_providers block was introduced for describing the 
version and source of Terraform providers. Providers allow Terraform to communicate with remote systems. 
In this case, the AWS provider is used to connect to AWS and create resources. , In the case, since the 
AWS provider is an official HashiCorp supported provider, the source is hashicorp/aws.

The provider version is described in the AWS block. This is extremely important as the AWS provider is 
updated almost weekly with potential breaking updates. Infrastructure code typically "rots" quickly due to 
the fast-paced development of Cloud Service Providers. The same code used to automate resources in the 
cloud has a good chance of not working after 6 months if it is not maintained and updated. So be sure to 
pin the version of the Terraform provider to reduce this risk.

The provider resource block is used to specify how to authenticate to AWS and what region to connect to.
In this example, the "us-east-1" region is used. 


The resource block types describe the various resources to provision and manage with Terraform. 
You can check out the AWS provider documentation to look up how to manage each type of resource. 
Now add a resource block to `main.tf` to create aws ec2 t2 micro instance. 

```
resource "aws_instance" "app_server" {
  ami           = "ami-082cfa95db1071089"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
```


Initialize the working directory by running the `init` command.
The AWS provider is downloaded during the initialization process. 

```
terraform init
```

The .terraform directory stores the downloaded AWS provider plugin in 
.terraform/providers/registry.terraform.io/hashicorp/aws/3.48.0/linux_amd64. 
The .terraform directory will also store any other data terraform needs later 
on for managing your infrastructure.

Input the terraform plan command into the terminal. An execution plan is generated displaying 
the resources that would be created or destroyed if Terraform were to deploy this configuration.

```
terraform plan
```

Now run `terraform apply` to create the resource. Terraform will first generate an execution plan with the details 
of the resources it will create. It will then prompt whether you want to continue - type yes.
Once complete a summary will appear with the status of the resources added, changed, or destroyed.

We can check the instance is created by using aws cli:

```
aws ec2 describe-instances  --region us-west-2 --filters Name=instance-type,Values=t2.micro 
```


To destroy the resources, use `terraform destroy`.An execution plan shows that the VPC will be destroyed if applied. 
After inputting yes, the EC2 instance is removed from the AWS environment and a summary is displayed. 



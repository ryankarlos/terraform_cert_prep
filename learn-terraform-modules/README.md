# Modules

A Terraform module is a set of Terraform configuration files in a single directory. 
Even a simple configuration consisting of a single directory with one or more .tf files is a module. 
When you run Terraform commands directly from such a directory, it is considered the root module. 
So in this sense, every Terraform configuration is part of a module. 

Use module blocks to call modules in other directories. When Terraform encounters a 
module block, it loads and processes that module's configuration files.
A module that is called by another configuration is sometimes referred to as a "child 
module" of that configuration.
Modules can either be loaded from the local filesystem, or a remote source. 
https://developer.hashicorp.com/terraform/tutorials/modules/module

For best practices in writing modules refer to Hashicorp docs 
https://developer.hashicorp.com/terraform/tutorials/modules/module#module-best-practices

We will use the scripts from the tutorial https://developer.hashicorp.com/terraform/tutorials/modules/module-create
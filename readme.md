# New Relic Terraform JSON Dashboards
This example project demontrates how you can use a [Terraform GraphQL provider](https://registry.terraform.io/providers/sullivtr/graphql/latest/docs) to provision New Relic Dashboards from JSON templates.

Note: This only works with version 2.4.0 of the GraphQL provider. Version 2.5.0 adds  feature that is incompatible. See [Github issue](https://github.com/sullivtr/terraform-provider-graphql/issues/70).

## Installation
Make sure terraform is installed. I recommend [tfenv](https://github.com/tfutils/tfenv) for managing your terraform binaries.

Run terraform how you usually do, or use the helper script to run terraform with the correct vars:  Update the `runtf.sh.sample` file with your credentials and account details and rename it `runtf.sh`. 

> **Important do not commit this new file to git!** (It should be ignored in `.gitignore` already)


## Initialisation
Use the `runtf.sh` helper script where ever you would normally run `terraform`. It simply wraps the terraform with some environment variables that make it easier to switch between projects.

First initialise terraform:
```
./runtf.sh init
```

Now apply the changes:
```
./runtf.sh apply
```

## State storage
This demo does not include remote state storage. State will be stored locally.


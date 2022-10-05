# New Relic Terraform JSON Dashboards
This example project demontrates how you can use a [Terraform GraphQL provider](https://registry.terraform.io/providers/sullivtr/graphql/latest/docs) to provision New Relic Dashboards from JSON templates.

Note: this solution is now deprecated in favour of the new built in newrelic_dashboard_json resource. Example [here](https://github.com/jsbnr/nr-terraform-json-dashboards-native). However the method of using a grpahQL provider as a way to communicate with the New Relic API for unsupported features is still valid ;)

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

---
Theres also this [solution](https://github.com/jsbnr/nr-terraform-json-nr1-dashboards)

terraform {
  required_version = "~> 1.1.7"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.35.0"
    }
    graphql = {
      source = "sullivtr/graphql"
      version = "2.4.0" #This must be 2.4.0, 2.5.0+ does not work. See issue https://github.com/sullivtr/terraform-provider-graphql/issues/70
    }
  }
}

provider "newrelic" {
  region = "US" 
}
variable "accountId" { type = string }
variable "NEW_RELIC_API_KEY" { type = string }

provider "graphql" {
  url = "https://api.newrelic.com/graphql"
  headers = {
    "API-Key" = var.NEW_RELIC_API_KEY
  }
}

resource "graphql_mutation" "dashboard" {
  mutation_variables = {
    dashboard = templatefile("${path.module}/dashQueries/dash.json",{
      DASHBOARD_NAME = "GraphQL Provider Dash" 
      widgets = [
        {
          name = "Amazon traffic"
          accountId = var.accountId
          whereClause ="where api like 'amazon%'"
        },
        {
          name = "Google traffic"
          accountId = var.accountId
          whereClause ="where api like 'google%'"
        }
      ]
    }) 
  }
  compute_mutation_keys = {
    "guid" = "dashboardCreate.entityResult.guid"  # The guid from the the create is used for update, read, destroy
  }
  compute_from_create = true
  create_mutation = file("./dashQueries/createMutation.gql")
  update_mutation = file("./dashQueries/updateMutation.gql")
  delete_mutation = file("./dashQueries/deleteMutation.gql")
  read_query      = file("./dashQueries/readQuery.gql")
}

output "dashboard_guid" {
  value=graphql_mutation.dashboard.computed_read_operation_variables.guid
}

 
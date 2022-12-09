locals {
  env_vars_keys        = var.map_environment != null ? keys(var.map_environment) : var.environment != null ? [for m in var.environment : lookup(m, "name")] : []
  env_vars_values      = var.map_environment != null ? values(var.map_environment) : var.environment != null ? [for m in var.environment : lookup(m, "value")] : []
  env_vars_as_map      = zipmap(local.env_vars_keys, local.env_vars_values)
  sorted_env_vars_keys = sort(local.env_vars_keys)

  sorted_environment_vars = [
    for key in local.sorted_env_vars_keys :
    {
      name  = key
      value = lookup(local.env_vars_as_map, key)
    }
  ]

  secrets_keys        = var.map_secrets != null ? keys(var.map_secrets) : var.secrets != null ? [for m in var.secrets : lookup(m, "name")] : []
  secrets_values      = var.map_secrets != null ? values(var.map_secrets) : var.secrets != null ? [for m in var.secrets : lookup(m, "valueFrom")] : []
  secrets_as_map      = zipmap(local.secrets_keys, local.secrets_values)
  sorted_secrets_keys = sort(local.secrets_keys)

  sorted_secrets_vars = [
    for key in local.sorted_secrets_keys :
    {
      name      = key
      valueFrom = lookup(local.secrets_as_map, key)
    }
  ]

  # https://www.terraform.io/docs/configuration/expressions.html#null
  task_environment = length(local.sorted_environment_vars) > 0 ? local.sorted_environment_vars : null
  task_secret     = length(local.sorted_secrets_vars) > 0 ? local.sorted_secrets_vars : null
}
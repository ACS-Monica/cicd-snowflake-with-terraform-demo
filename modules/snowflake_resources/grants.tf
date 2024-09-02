resource "snowflake_grant_privileges_to_account_role" "database_ro_grant" {
  privileges = ["USAGE"]
  account_role_name = "DEV_PCDR_QA"
  on_account = true
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_demo_database.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "schema_ro_grant" {
  privileges = ["USAGE"]
  account_role_name = "DEV_PCDR_QA"
    on_account        = true
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_demo_database.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "table_ro_grant" {
  privileges = ["SELECT"]
  account_role_name     = "DEV_PCDR_QA"
  with_grant_option = false
  on_schema {
    schema_name = snowflake_schema.tf_demo_schema.name
  }  
}

resource "snowflake_grant_privileges_to_account_role" "view_ro_grant" {
  privileges = ["SELECT"]
  account_role_name     = "DEV_PCDR_QA"
  with_grant_option = false
  on_schema {
    schema_name = snowflake_schema.tf_demo_schema.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_grant" {
  privileges = ["USAGE"]
  account_role_name     = "DEV_PCDR_QA"
  on_account        = true
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.task_warehouse.name
  }
}
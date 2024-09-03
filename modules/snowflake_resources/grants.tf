resource "snowflake_grant_privileges_to_account_role" "database_ro_grant" {
  privileges = ["USAGE"]
  account_role_name = "DEV_PCDR_QA"
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_demo_database.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "schema_ro_grant" {
  privileges = ["USAGE"]
  account_role_name = "DEV_PCDR_QA"
  on_schema {
    schema_name = "\"${snowflake_database.tf_demo_database.name}\".\"${snowflake_schema.tf_demo_schema.name}\"" # note this is a fully qualified name!
  }
}

resource "snowflake_grant_privileges_to_account_role" "table_ro_grant" {
  privileges = ["SELECT"]
  account_role_name     = "DEV_PCDR_QA"
  with_grant_option = false
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "\"${snowflake_database.tf_demo_database.name}\".\"${snowflake_schema.tf_demo_schema.name}\"" # note this is a fully qualified name!
    }
  } 
}

resource "snowflake_grant_privileges_to_account_role" "view_ro_grant" {
  privileges = ["SELECT", "REFERENCES"]
  account_role_name     = "DEV_PCDR_QA"
  with_grant_option = false
  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "\"${snowflake_database.tf_demo_database.name}\".\"${snowflake_schema.tf_demo_schema.name}\"" # note this is a fully qualified name!
    }
  } 
}

resource "snowflake_grant_privileges_to_account_role" "warehouse_grant" {
  privileges = ["USAGE"]
  account_role_name     = "DEV_PCDR_QA"
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.task_warehouse.name
  }
}
terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.87"
    }
  }
}

provider "snowflake" {
  username    = "tf-snow"
  account     = "KBXIPRA-PBS"
  role        = "dev_sys_admin"
  private_key_path = "~/.ssh/snowflake_tf_snow_key.pem"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}
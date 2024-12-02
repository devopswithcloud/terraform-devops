terraform {
    // Required Version will fpcus on underlying terraform CLI which is installed 
    //required_version = "1.9.5"

    // Allow the right most version component to be incremented
    required_version = "~> 1.9.4"

    // Required Providers will focus on the provider version which is used in the configuration
    required_providers {
        aws = {
            version = "5.76.0" // you can implement contsraints here
            source = "hashicorp/aws"
        }
        google = {
            version = "~> 6.12.0"
            source = "hashicorp/google"
        }
    }

    // Remote backend to store the terraform state file
    backend "gcs" {
      
    }

    // experimental features
    experiments = [provider_module_source, provider_installation, provider_requirements]

    provider_meta "" {
      
    }

}
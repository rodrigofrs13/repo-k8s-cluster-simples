//provider "aws" {
//   region = var.region
//}

//provider "aws" {
//access_key = "AKIARUNAH7INFIT2AYLJ"
//secret_key = "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"
//region = "us-east-1"
//}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:/Users/roee/.aws/credentials"
  profile                 = "default"
}

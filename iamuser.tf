terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#provider "aws" {}

#use this COMMAND
#export AWS_ACCESS_KEY_ID="my-access-key"
#export AWS_SECRET_ACCESS_KEY="my-secret-key"
#export AWS_REGION="us-west-2"


provider "aws" {
  #shared_config_files      = ["/home/rana/.aws/config"]
 # shared_credentials_files = ["/home/rana/.aws/credentials"]
  #this was giving error, so I did this. I know this is not good to hardcode account credentials
  region     = "us-east-1"
  access_key = "AKIAZJ33ZUAYC2JNAU7Q"
  secret_key = "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"

}





resource "aws_iam_user" "devops-user" {
  name = "devops_user"
    tags = {
         name = "Demo Test user"
    }
}

data "aws_iam_policy" "administrator_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.devops-user.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}


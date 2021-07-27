terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "${var.REGION}"
}

resource "aws_iam_user" "IAMUser" {
    path = "/"
    name = "seleniumUser"
    tags = {
        role = "selenium"
    }
}

resource "aws_iam_access_key" "IAMAccessKey" {
    status = "Active"
    user = aws_iam_user.IAMUser.name
}

resource "aws_ecr_repository" "ECRRepository" {
    name = "selenium"
}

resource "aws_iam_policy" "IAMManagedPolicy" {
    name = "ci-cd-ecr"
    path = "/"
    policy = file("${var.FILE_PATH}ci-cd-ecr-policy.json")
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "selenium-attachment"
  users      = [aws_iam_user.IAMUser.name]
  policy_arn = aws_iam_policy.IAMManagedPolicy.arn
}
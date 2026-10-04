# Educational stub — do not apply to a real account without review.
# Shows a minimal S3 bucket + VPC skeleton for mentorship walkthroughs.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type        = string
  description = "AWS region for the demo resources"
  default     = "eu-central-1"
}

variable "project_name" {
  type        = string
  description = "Name prefix for tags and resource names"
  default     = "codementor-devops-demo"
}

# --- S3: static assets / Terraform remote-state practice target ---
resource "aws_s3_bucket" "demo" {
  bucket = "${var.project_name}-assets"

  tags = {
    Name    = "${var.project_name}-assets"
    Purpose = "mentorship-demo"
  }
}

resource "aws_s3_bucket_versioning" "demo" {
  bucket = aws_s3_bucket.demo.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "demo" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# --- VPC stub: networking interview talking points ---
resource "aws_vpc" "demo" {
  cidr_block           = "10.42.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = "10.42.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-public-a"
    Tier = "public"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.demo.bucket
  description = "Demo S3 bucket name"
}

output "vpc_id" {
  value       = aws_vpc.demo.id
  description = "Demo VPC ID"
}

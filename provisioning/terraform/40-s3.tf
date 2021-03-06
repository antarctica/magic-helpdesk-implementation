#
# This file is used to define resources for storage resources managed through S3

# MAGIC Helpdesk (Integration)
#
# This resource relies on the AWS Terraform provider being previously configured.
#
# AWS source: https://aws.amazon.com/s3/
# Terraform source: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "magic-helpdesk-integration" {
  bucket = "magic-helpdesk-integration.web.bas.ac.uk"

  # Canned ACL - All objects can be read by anyone, but only the owner can change them
  #
  # Source: https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = "public-read"

  # Bucket policy - All objects can be read by anyone, but only the owner can change them
  #
  # Source: http://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-2
  policy = file("70-resources/s3/bucket-policies/staging-public-read.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name         = "magic-helpdesk-integration.web.bas.ac.uk"
    X-Project    = "MAGIC Helpdesk"
    X-Managed-By = "Terraform"
  }
}

# MAGIC Helpdesk (Production)
#
# This resource relies on the AWS Terraform provider being previously configured.
#
# AWS source: https://aws.amazon.com/s3/
# Terraform source: https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "magic-helpdesk-production" {
  bucket = "magic-helpdesk.web.bas.ac.uk"

  # Canned ACL - All objects can be read by anyone, but only the owner can change them
  #
  # Source: https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = "public-read"

  # Bucket policy - All objects can be read by anyone, but only the owner can change them
  #
  # Source: http://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-2
  policy = file("70-resources/s3/bucket-policies/production-public-read.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name         = "magic-helpdesk.web.bas.ac.uk"
    X-Project    = "MAGIC Helpdesk"
    X-Managed-By = "Terraform"
  }
}

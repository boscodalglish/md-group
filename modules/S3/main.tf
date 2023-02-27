/* Create S3 Bucket */

resource "aws_s3_bucket" "bucket-1" {
  bucket = "www.${var.bucket_name}"
}
data "aws_s3_bucket" "selected-bucket" {
  bucket = aws_s3_bucket.bucket-1.bucket
}

/* S3 Bucket ACL */

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  acl    = "public-read"
}


/* S3 Bucket versioning */

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

/* Enable CORS */

resource "aws_s3_bucket_cors_configuration" "cors_s3_bucket" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket
cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.bucket_name}"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicRead",
            "Effect": "Allow",
            "Action": ["s3:GetObject"],
            "Resource": [
                "arn:aws:s3:::www.${var.bucket_name}",
                "arn:aws:s3:::www.${var.bucket_name}/*"
            ],
            "Principal": "*"
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_website_configuration" "website_hosting" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket

  index_document {
    suffix = "index.html"
  }
  
  error_document {
    key = "404.jpeg"
  }

  routing_rule {
    condition {
      key_prefix_equals = "/abc"
    }
    redirect {
      replace_key_prefix_with = "comming-soon.jpeg"
    }
  }

}

resource "aws_s3_object" "object-upload-html" {
    for_each        = fileset("uploads/", "*.html")
    bucket          = data.aws_s3_bucket.selected-bucket.bucket
    key             = each.value
    source          = "uploads/${each.value}"
    content_type    = "text/html"
    etag            = filemd5("uploads/${each.value}")
    acl             = "public-read"
}
resource "aws_s3_object" "object-upload-jpg" {
    for_each        = fileset("uploads/", "*.jpg")
    bucket          = data.aws_s3_bucket.selected-bucket.bucket
    key             = each.value
    source          = "uploads/${each.value}"
    content_type    = "image/jpeg"
    etag            = filemd5("uploads/${each.value}")
    acl             = "public-read"
}
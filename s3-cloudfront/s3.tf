resource "aws_s3_bucket" "s3_bucket" {  
  bucket = var.bucket_prefix
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_config" {
  bucket = aws_s3_bucket.s3_bucket.id
   index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {  
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy_data.json

}

data "aws_iam_policy_document" "s3_bucket_policy_data" {
  statement {
    effect = "Allow"

    principals {
      type        = "*" 
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}
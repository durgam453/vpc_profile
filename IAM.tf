module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "4.0.0"

  name = var.iam_user_name

  user_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "ec2:Describe*",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ec2:Create*",
          "ec2:Delete*",
          "ec2:Modify*",
          "ec2:Start*",
          "ec2:Stop*"
        ],
        "Resource": [
          "arn:aws:ec2:*:*:instance/*",
          "arn:aws:ec2:*:*:volume/*",
          "arn:aws:ec2:*:*:snapshot/*"
        ]
      },
      {
        "Effect": "Allow",
        "Action": [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        "Resource": [
          "arn:aws:s3:::${var.s3_bucket_name}"
        ]
      },
      {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": [
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
      }
    ]
  }
  EOF

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "s3bucket-access" {
  statement {
    sid = "1"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }
}

## Create Policy 

resource "aws_iam_policy" "s3bucket-access" {
  name   = "s3bucket-access"
  path   = "/"
  policy = "${data.aws_iam_policy_document.s3bucket-access.json}"
}

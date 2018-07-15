## IAM User and Group Policy 
resource "aws_iam_policy" "EC2-FullAcces" {
  name        = "ec2-fullaccess"
  path        = "/"
  description = "ec2, vpc and etc access"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*"
        }
    ]
}
EOF
}

## Create IAM group

resource "aws_iam_group" "cpgroup" {
  name = "cpgroup"
}

## Create IAM user

resource "aws_iam_user" "zfadmin" {
  name = "zfadmin"
}

## Attach IAM policy to the zfadmin user

resource "aws_iam_policy_attachment" "zfadmin" {
  name = "ec2-admin"

  #   users      = ["${aws_iam_user.zfadmin.name}"]
  groups     = ["${aws_iam_group.cpgroup.name}"]
  policy_arn = "${aws_iam_policy.EC2-FullAcces.arn}"
}

## Add zfadmin into cpgroups

resource "aws_iam_group_membership" "cpgroup" {
  name  = "cpgroup"
  users = ["${aws_iam_user.zfadmin.name}"]
  group = "${aws_iam_group.cpgroup.name}"
}

## Create Role

resource "aws_iam_role" "ec2-access" {
  name        = "ec2-access"
  description = "Roles for the EC2 instances"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

## Role Policy Attachment

resource "aws_iam_role_policy_attachment" "ec2-access" {
  role       = "${aws_iam_role.ec2-access.name}"
  policy_arn = "${aws_iam_policy.EC2-FullAcces.arn}"
}

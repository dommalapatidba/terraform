#create iam user
resource "aws_iam_user" "iam_user" {
  name="rihaan"
  
}

#Iam access
resource "aws_iam_access_key" "access_key" {
  user=aws_iam_user.iam_user.name
}

#create inline policy
data "aws_iam_policy_document" "policy" {
  statement {
    actions = [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
    ]
    resources = [
        "arn:aws:s3:::statefile12345/*"
    ]
  }
}

#attach the policy to user
resource "aws_iam_user_policy" "putgetdel" {
  name="putgetdel"
  user=aws_iam_user.iam_user.name
  policy = data.aws_iam_policy_document.policy.json
}
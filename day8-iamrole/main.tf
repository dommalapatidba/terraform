#Iam user creation
resource "aws_iam_user" "iam" {
  name = "rihaan"
}

#policy attachment
resource "aws_iam_user_policy_attachment" "s3access" {
  user = aws_iam_user.iam.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
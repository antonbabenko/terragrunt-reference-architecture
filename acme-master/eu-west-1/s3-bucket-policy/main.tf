resource "aws_s3_bucket_policy" "mess" {
  bucket = "very-popular-mess"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "AWS": [
                  "arn:aws:iam::333333333333:user/deployer",
                  "arn:aws:iam::444444444444:role/ecs-deploy",
                  "arn:aws:iam::111111111111:role/ecs-deploy"
              ]
          },
          "Action": "s3:*",
          "Resource": [
              "arn:aws:s3:::very-popular-mess",
              "arn:aws:s3:::very-popular-mess/*"
          ]
      }
  ]
}
POLICY
}

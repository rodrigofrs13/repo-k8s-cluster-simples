resource "aws_iam_role_policy" "policy-k8s-s3" {
  name = "Policy-k8s-s3" 
  role = "${aws_iam_role.role-k8s-s3.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [ 
          "arn:aws:s3:::s3-k8s-estudos",
          "arn:aws:s3:::s3-k8s-estudos/*"
      ]
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "role-instance-profile" {
  name = "Role-Instance-Kubernetes"
  role = "${aws_iam_role.role-k8s-s3.name}"
}

resource "aws_iam_role" "role-k8s-s3" {
  name = "Role-bucket-s3-k8s"
  path = "/"

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

#resource "aws_iam_role_policy_attachment" "k8s-attach-policy" {
#    role = "${aws_iam_role.role-k8s-s3.name}"
#    policy_arn = "${aws_iam_role_policy.policy-k8s-s3.name}"
#  
#    depends_on = [
#        aws_iam_role.role-k8s-s3,
#        aws_iam_role_policy.policy-k8s-s3
#    ]
#
#}
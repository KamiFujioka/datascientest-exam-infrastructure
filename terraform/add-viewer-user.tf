resource "aws_iam_user" "viewer" {
  name = "viewer"
}

resource "aws_iam_policy" "viewer_eks" {
  name = "AmazonEKSDeveloperPolicy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster",
                "eks:ListClusters"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_user_policy_attachment" "viewer_eks" {
  user       = aws_iam_user.viewer.name
  policy_arn = aws_iam_policy.viewer_eks.arn
}

# lier l'user IAM viewer au groupe RBAC my-viewer à l'aide de l'API EKS
resource "aws_eks_access_entry" "developer" {
  cluster_name      = aws_eks_cluster.eks.name
  principal_arn     = aws_iam_user.viewer.arn
  kubernetes_groups = ["my-viewer"]
}
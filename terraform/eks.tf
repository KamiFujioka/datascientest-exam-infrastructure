resource "aws_iam_role" "eks" {
  name = "${var.project_name}-${var.environment}-eks-cluster"

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "eks.amazonaws.com"
        }
      }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_iam_role_policy_attachment" "attach_ebs_csi_policy_to_node" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.nodes.name
}

resource "aws_eks_addon" "ebs_csi" {
  cluster_name            = aws_eks_cluster.eks.name
  addon_name              = "aws-ebs-csi-driver"
  depends_on = [
    aws_iam_role_policy_attachment.attach_ebs_csi_policy_to_node
  ]
}

resource "aws_eks_cluster" "eks" {
  name     = "${var.project_name}-${var.environment}"
  version  = var.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.private_zone1.id,
      aws_subnet.private_zone2.id
    ]
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [aws_iam_role_policy_attachment.eks]
}
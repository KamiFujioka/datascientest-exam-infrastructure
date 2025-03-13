output "kubeconfig" {
  description = "Configuration du cluster Kubernetes"
  value = <<EOF
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${aws_eks_cluster.eks.certificate_authority[0].data}
    server: ${aws_eks_cluster.eks.endpoint}
  name: eks-cluster
contexts:
- context:
    cluster: eks-cluster
    user: aws
  name: eks-context
current-context: eks-context
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws
      args:
        - eks
        - get-token
        - --cluster-name
        - ${aws_eks_cluster.eks.name}
EOF
}

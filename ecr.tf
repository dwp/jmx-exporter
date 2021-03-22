resource "aws_ecr_repository" "jmx-exporter" {
  name = "jmx-exporter"
  tags = merge(
    local.common_tags,
    { DockerHub : "dwpdigital/jmx-exporter" }
  )
}

resource "aws_ecr_repository_policy" "jmx-exporter" {
  repository = aws_ecr_repository.jmx-exporter.name
  policy     = data.terraform_remote_state.management.outputs.ecr_iam_policy_document
}

output "ecr_example_url" {
  value = aws_ecr_repository.jmx-exporter.repository_url
}

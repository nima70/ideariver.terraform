output "domain_name" {
  value = aws_codeartifact_domain.ideariver_domain.domain
}

output "repository_name" {
  value = aws_codeartifact_repository.ideariver_repo.repository
}

resource "aws_codeartifact_domain" "ideariver_domain" {
  domain = var.codeartifact_domain
}

resource "aws_codeartifact_repository" "ideariver_repo" {
  repository = var.codeartifact_repository
  domain     = aws_codeartifact_domain.ideariver_domain.domain
}

# Define a variable for the CodeArtifact domain
variable "codeartifact_domain" {
  description = "The name of the AWS CodeArtifact domain"
  type        = string
}

# Define a variable for the CodeArtifact repository
variable "codeartifact_repository" {
  description = "The name of the AWS CodeArtifact repository"
  type        = string
}

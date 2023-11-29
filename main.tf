provider "github" {
  owner        = "YOUR_GITHUB_ORGA_HERE"
}

# Repos

resource "github_repository" "example-repo" {
  name        = "terraform-github-repository-example"
  description = "A Repo for the Terraform GitHub Provider Example"
  visibility  = "public"
}

# Define a new GitHub repository
# resource "github_repository" "cooler-repo" {
#  name        = "devops-meetup-2023"
#  description = "All Your Base Belong to us"
#  visibility  = "public"
# }


# TEAMS 
#Pull Access
resource "github_team" "pull_team" {
  name        = "Pull Team"
  description = "A team to manage access on Terraform-managed repositories"
}

# Push Access
resource "github_team" "push_team" {
  name        = "Push Team"
  description = "A team to manage access on Terraform-managed repositories"
}

# Admin Access
resource "github_team" "admin_team" {
  name        = "Admin Team"
  description = "A Admin team to manage access on Terraform-managed repositories"
}


resource "github_team_repository" "team_repo_pull" {
  team_id    = github_team.pull_team.id
  repository = github_repository.example-repo.name
  permission = "pull"
}

resource "github_team_membership" "team_membership_pull" {
  team_id  = github_team.pull_team.id
  username = "johnDoe"
  role     = "member"
}

resource "github_team_repository" "team_repo_push" {
  team_id    = github_team.push_team.id
  repository = github_repository.example-repo.name
  permission = "push"
}

resource "github_team_membership" "team_membership_push" {
  team_id  = github_team.push_team.id
  username = "johnDoe"
  role     = "member"
}

resource "github_team_repository" "team_repo_admin" {
  team_id    = github_team.admin_team.id
  repository = github_repository.example-repo.name
  permission = "admin"
}

resource "github_team_membership" "team_membership_admin" {
  team_id  = github_team.admin_team.id
  username = "johnDoe"
  role     = "member"
}


resource "github_team_repository" "team_repo_cooler_admin" {
  team_id    = github_team.admin_team.id
  repository = github_repository.cooler-repo.name
  permission = "admin"
}


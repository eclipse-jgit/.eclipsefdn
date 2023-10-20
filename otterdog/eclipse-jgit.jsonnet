local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-jgit') {
  settings+: {
    billing_email: "webmaster@eclipse.org",
    default_repository_permission: "none",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse JGit",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('jgit') {
      allow_merge_commit: true,
      auto_init: false,
      default_branch: "master",
      description: "JGit, the Java implementation of git",
      has_discussions: true,
      homepage: "https://www.eclipse.org/jgit/",
    },
    orgs.newRepo('jgit-pipelines') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "CI pipelines for JGit",
      has_discussions: true,
      homepage: "https://www.eclipse.org/jgit/",
    },
    orgs.newRepo('jgit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}

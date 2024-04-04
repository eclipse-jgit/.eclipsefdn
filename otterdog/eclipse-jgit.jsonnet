local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-jgit') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse JGit",
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/jgit/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('jgit') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "JGit, the Java implementation of git",
      has_discussions: true,
      homepage: "https://www.eclipse.org/jgit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-jgit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('jgit-permissions') {
      allow_merge_commit: true,
      description: "GerritHub permissions for JGit repositories",
      homepage: "https://www.eclipse.org/jgit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-jgit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('jgit-pipelines') {
      allow_merge_commit: true,
      default_branch: "master",
      description: "CI pipelines for JGit",
      has_discussions: true,
      homepage: "https://www.eclipse.org/jgit/",
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-jgit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
    orgs.newRepo('jgit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('*') {
          allows_force_pushes: true,
          push_restrictions+: [
            "@eclipse-jgit-bot"
          ],
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
          restricts_pushes: true,
        },
      ],
    },
  ],
}

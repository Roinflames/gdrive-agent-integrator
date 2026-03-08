# Changelog

All notable changes to this repository will be documented in this file.

## [Unreleased]
### Added
- `docs/operational-checklist.md` with request, approval, creation, and review controls.
- `scripts/new-drive-request.sh` to generate timestamped request files under `docs/requests/`.
- README automation section with command usage.
- `.github/CODEOWNERS` to require owner review for governance/process files.
- `.github/workflows/docs-governance-check.yml` to require `CHANGELOG.md` updates when governance files change.
- `docs/requests/README.md` with naming and lifecycle rules for request records.
- `docs/review-template.md` for quarterly governance review records.
- `scripts/new-quarterly-review.sh` to generate quarterly review files in `docs/reviews/`.
- `docs/reviews/README.md` with naming convention and usage for review records.
- `SECURITY.md` with minimum security controls and incident handling.
- `.github/workflows/scripts-check.yml` to validate bash syntax and run ShellCheck on repo scripts.

## [0.1.0] - 2026-03-08
### Added
- Initial governance baseline in `AGENTS.md`.
- Shared Drive policy in `docs/shared-drive-policy.md`.
- Shared Drive request template in `docs/shared-drive-request-template.md`.
- Operational flow and process documentation in `README.md`.

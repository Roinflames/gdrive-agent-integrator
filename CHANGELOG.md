# Changelog

All notable changes to this repository will be documented in this file.

## [Unreleased]
### Added
- `docs/shared-drive-governance.md` as consolidated governance reference with required operational sections.
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
- `docs/requests/2026-03-08-gdrive-shared-governance.md` as initial completed request record.
- `docs/reviews/2026-Q1.md` as initial quarterly review record.

### Changed
- `docs/shared-drive-governance.md` quarterly review filename convention aligned to `YYYY-QN.md`.
- `docs/requests/2026-03-08-gdrive-shared-governance.md` creation record updated to explicit provisioning status (no placeholder value).
- `.github/workflows/scripts-check.yml` now validates docs placeholders through `scripts/validate-docs.sh`.
- Added `scripts/validate-docs.sh` to fail CI when generated request/review records contain unresolved placeholders.
- `docs/requests/2026-03-08-gdrive-shared-governance.md` updated with the provisioned Shared Drive URL.
- `docs/reviews/2026-Q1.md` action to confirm Shared Drive URL marked as `Closed`.
- `scripts/new-drive-request.sh` now requires explicit `requested_by`, `team`, and `slug` arguments and refuses to overwrite existing request files.
- `scripts/new-quarterly-review.sh` now refuses to overwrite an existing quarterly review file.
- `README.md` automation section updated to document required arguments and overwrite-protection behavior.

## [0.1.0] - 2026-03-08
### Added
- Initial governance baseline in `AGENTS.md`.
- Shared Drive policy in `docs/shared-drive-policy.md`.
- Shared Drive request template in `docs/shared-drive-request-template.md`.
- Operational flow and process documentation in `README.md`.

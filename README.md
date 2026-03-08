# GSD Shared Drive Governance

This repository stores the operational rules and templates for Google Shared Drive governance.

## Scope
- Standardize how shared drives are requested, approved, created, and reviewed.
- Keep operational decisions versioned in Git.

## Documents
- `docs/shared-drive-governance.md`: consolidated governance standard and audit baseline.
- `docs/shared-drive-inventory.md`: active shared drives registry with review due dates.
- `docs/shared-drive-policy.md`: governance baseline and mandatory controls.
- `docs/shared-drive-request-template.md`: standard request format for new drives.
- `docs/operational-checklist.md`: execution checklist from request to quarterly review.
- `docs/requests/`: generated request records.
- `docs/review-template.md`: standard quarterly review record.
- `docs/reviews/`: generated quarterly review records.

## Automation
- Create a new request file:
`./scripts/new-drive-request.sh "<requested_by>" "<team>" "<slug>"`

Example:
`./scripts/new-drive-request.sh "rreyes" "ops" "fin-presupuesto-2026"`

Note:
- All three arguments are required.
- The script exits with error if the target file already exists.

- Create a quarterly review record:
`./scripts/new-quarterly-review.sh "<reviewer>" "[YYYY-QN]"`

Example:
`./scripts/new-quarterly-review.sh "rreyes" "2026-Q1"`

Note:
- The script exits with error if `docs/reviews/YYYY-QN.md` already exists.

- List overdue or due-soon quarterly reviews:
`./scripts/list-review-due.sh`

Optional:
- `./scripts/list-review-due.sh --fail-on-overdue` exits non-zero when any drive is overdue.

- Validate inventory consistency:
`./scripts/validate-inventory.sh`

## Scheduled Monitoring
- GitHub Actions workflow `Review Due Check` runs weekly (Monday) and fails if any review is overdue.

## Operating Flow
1. Request
- Open a request using `docs/shared-drive-request-template.md`.
- Fill ownership, access matrix, and folder baseline.

2. Approval
- A designated owner/admin validates policy compliance.
- Approval must be documented in the request.

3. Creation
- Create the Shared Drive in Google Workspace.
- Assign at least two managers.
- Apply initial structure and access roles.

4. Review (Quarterly)
- Revalidate membership and role necessity.
- Remove expired temporary accesses.
- Record review outcome by updating request/change records.

## Mandatory Rules
- No business-critical files under personal ownership.
- Least-privilege access by role.
- External sharing must be explicit and recorded.
- Any process or access decision must be documented in this repo.

## Change Management
- Use pull requests for policy or template updates.
- Keep a concise changelog in the modified document.

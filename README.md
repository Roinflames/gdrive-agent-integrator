# GSD Shared Drive Governance

This repository stores the operational rules and templates for Google Shared Drive governance.

## Scope
- Standardize how shared drives are requested, approved, created, and reviewed.
- Keep operational decisions versioned in Git.

## Documents
- `docs/shared-drive-policy.md`: governance baseline and mandatory controls.
- `docs/shared-drive-request-template.md`: standard request format for new drives.

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

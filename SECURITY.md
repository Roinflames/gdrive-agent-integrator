# Security Policy

## Scope
This repository governs Shared Drive operational process and access documentation.

## Core Controls
- Least privilege by default for all Shared Drive roles.
- At least two managers per Shared Drive.
- External sharing only when explicitly approved and documented.
- No personal ownership for business-critical shared content.

## Access Review
- Quarterly access review is mandatory.
- Temporary access must include expiration date and be removed on expiry.
- Review evidence must be recorded in `docs/reviews/`.

## Incident Handling
If an unauthorized access/sharing event is detected:
1. Revoke access immediately.
2. Capture impacted drive, files, users, and timestamps.
3. Document actions in a review/incident record.
4. Revalidate role assignments and external sharing settings.

## Reporting
Report security concerns to repository owners through private channels and open a restricted internal ticket.

# Shared Drive Governance Standard

## Purpose and Scope
- Define the mandatory baseline for creating and operating Google Shared Drives.
- Apply to all teams managing business data in Google Workspace.
- Out of scope: personal drives and ad-hoc personal folders.

## Owners and Admins
- Governance owner: Workspace Operations Lead.
- Technical admins: Workspace Admin team.
- Per-drive ownership:
  - Business owner (accountable for content lifecycle and access intent).
  - Primary drive manager.
  - Backup drive manager.

## Membership and Access Matrix
Use role-based access with least privilege. Temporary access must include an end date.

| Team/Person | Role | Business Justification | Temporary End Date | Approved By |
|---|---|---|---|---|
|  | Manager / Content manager / Contributor / Commenter / Viewer |  |  |  |

## Folder Structure Baseline
Every new Shared Drive must include:
- `00-admin/`
- `10-operaciones/`
- `20-proyectos/`
- `30-reportes/`
- `99-archivo/`

## Naming Conventions
- Shared Drive name format: `[AREA]-[TOPIC]-[YYYY]`
- Request file format: `YYYYMMDD-HHMM-<team>-<slug>.md`
- Quarterly review file format: `YYYY-QN.md` (example: `2026-Q1.md`)

## Review Cadence
- Frequency: quarterly.
- Review checks:
  - membership and role necessity,
  - temporary access expiration cleanup,
  - external sharing validation,
  - confirmation of at least two active managers.
- Evidence location: `docs/reviews/` and related request files in `docs/requests/`.

## Change Log
- 2026-03-08: Initial governance standard consolidated from policy and templates.

# Shared Drive Policy

## Objective
Define how shared Google Drive spaces are created, governed, and maintained.

## Minimum Requirements
- A designated admin/owner approves creation.
- The drive has at least 2 managers.
- Access is granted by role, not by convenience.
- Sensitive content follows least-privilege access.

## Required Metadata
- Drive name:
- Business owner:
- Technical/admin owner:
- Creation date:
- Review frequency:

## Access Matrix
| Team/Person | Role | Justification | Expiration (if temporary) |
|---|---|---|---|
|  | Manager / Content manager / Contributor / Commenter / Viewer |  |  |

## Folder Baseline
- `00-admin/`
- `10-operaciones/`
- `20-proyectos/`
- `30-reportes/`
- `99-archivo/`

## Naming Convention
`[AREA]-[TOPIC]-[YYYY]`

Examples:
- `OPS-INCIDENTES-2026`
- `FIN-PRESUPUESTO-2026`

## Operational Rules
- No personal ownership for shared business files.
- Quarterly permissions review is mandatory.
- External sharing must be explicit and logged.
- Critical folders should define managers and backup managers.

## Change Log
- 2026-03-08: Initial policy created.

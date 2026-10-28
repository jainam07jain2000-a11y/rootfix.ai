# Frontend

This is the light-theme React + TypeScript interface exported from Google Stitch/AI Studio and integrated with the local FastAPI API.

For full setup, run instructions, the API contract, and the remaining demo-only features, see the project-root `README.md`.

Main integration points:
- `src/App.tsx`: backend data loading and actions
- `src/components/FastApiBridgeView.tsx`: live backend endpoint explorer
- `src/components/SimulationModal.tsx`: supported simulation cases
- `src/components/InspectorDrawer.tsx`: approve, reject, and retry actions
- `src/index.css`: theme palette

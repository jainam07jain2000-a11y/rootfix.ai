# SelfHeal.ai — Stitch UI connected to the local FastAPI backend

This project combines the light-theme React UI exported from Google Stitch/AI Studio with the existing SelfHeal.ai FastAPI + SQLite backend.

## What is connected

- The incident list and pipeline are populated from `GET /api/executions`.
- Workflow inventory and counts are populated from `GET /api/workflows` and `GET /api/dashboard`.
- Recent backend events are populated from `GET /api/logs`.
- The connection badge checks `GET /api/health`.
- The simulation dialog calls `POST /api/simulate` for the three supported scenarios: `schema_mismatch`, `missing_field`, and `temporary_error`.
- Approve, reject, and retry actions call the existing `/api/executions/{id}/approve`, `/reject`, and `/retry` endpoints.
- The FastAPI Integration screen contains a live GET endpoint explorer; it sends real requests instead of displaying fabricated sample responses.

## Important limitations

- This is a hackathon MVP using a local mock downstream service. Recovery attempts do not modify real production systems.
- The backend records workflow status and events, but it does not collect real p99 latency, throughput, pod count, uptime, or traffic error-rate telemetry. The UI labels these as unavailable rather than inventing values.
- Healing-policy toggles are currently local UI demonstration state. The existing backend has no policy persistence endpoints, so toggles are not saved to SQLite and do not change server-side recovery logic.
- The main payload correction uses predefined schema mappings. Gemini is optional on the backend and is used to assist with the diagnosis text when configured; it does not execute generated code.

## Requirements

- Python 3.11 or newer
- Node.js 20.19+ recommended for the exported Vite 8 project
- An internet connection for the first dependency installation

## Run with VS Code

1. Extract this folder and open `selfheal-ai-integrated` in VS Code.
2. Open a terminal in the project root.
3. Start the backend in Terminal 1:

```powershell
py -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r .\backend\requirements.txt
.\.venv\Scripts\python.exe -m uvicorn --app-dir .\backend main:app --reload --host 127.0.0.1 --port 8000
```

4. Open a second terminal at the project root and start the frontend:

```powershell
cd frontend
npm install
npm run dev
```

5. Open the frontend at `http://127.0.0.1:5173`.
6. Verify the backend at `http://127.0.0.1:8000/docs`.

Keep both terminal windows open while using the app. If Smart App Control blocks `start.bat`, run the commands above directly in PowerShell; do not disable Windows security.

## Environment configuration

`frontend/.env.local` points the React app to `http://127.0.0.1:8000`. Change `VITE_API_BASE_URL` only if your backend runs at a different address. Frontend environment variables are public in the browser bundle, so do not put API secrets in frontend files. Optional Gemini credentials belong in `backend/.env`, based on `backend/.env.example`.

## Main files to customize

- `frontend/src/App.tsx` — API fetching, mapping backend records to UI incidents, simulation and approve/reject/retry handlers.
- `frontend/src/components/SimulationModal.tsx` — supported failure scenarios and their descriptions.
- `frontend/src/components/InspectorDrawer.tsx` — incident diagnosis, payload mapping, and recovery actions.
- `frontend/src/components/FastApiBridgeView.tsx` — backend URL and live API endpoint tester.
- `frontend/src/components/TelemetryView.tsx` — workflow health and recorded error information.
- `frontend/src/index.css` — light-theme palette and base styles.
- `backend/main.py` — original FastAPI API and SQLite recovery logic; not changed by this UI integration.

## Suggested demo flow

1. Open **Incidents & Pipeline**.
2. Click **Simulate Incident**.
3. Choose **JSON Schema Mismatch** and run it.
4. Inspect the generated payload mapping.
5. Click **Approve & Execute** or **Reject Fix**.
6. Confirm the status and recent backend events update from SQLite.
7. Try **Missing Required Field** to show why the system stops for human review.
8. Try **Temporary Service Failure** to demonstrate a bounded retry against the mock service.

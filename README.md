# 🌿 rootfix_AI
### Detect the Problem. Fix the Issue. Keep Things Running.

**rootfix_AI** is a self-healing AI automation project that helps identify common workflow failures, find their likely causes, and suggest fixes to recover from them.

Instead of spending too much time debugging small errors manually, rootfix_AI provides a simple way to simulate failures, review suggested corrections, and retry workflows.

## 🚩 Problem Statement

Small errors in software workflows can interrupt operations and take time to debug. Finding the root cause, correcting the issue, and checking whether the workflow works again can require repeated manual effort.

## 💡 Our Solution

rootfix_AI simplifies this process by bringing failure detection, diagnosis, fix suggestions, and retry actions into one dashboard.

### ✨ Key Features

- **Failure Simulation** — Test common workflow failures.
- **Root Cause Diagnosis** — Understand the likely reason behind a failure.
- **Fix Suggestions** — View proposed corrections for supported scenarios.
- **Human Approval** — Approve or reject a proposed fix.
- **Retry and Recovery** — Retry a workflow and check the result.
- **Execution Logs** — Keep track of workflow activities and outcomes.
- **Dashboard** — Monitor workflows and recovery activity in one place.

## ⚙️ How It Works

1. **Detect:** Simulate or identify a supported workflow failure.
2. **Diagnose:** Determine the likely cause using predefined rules and optional AI-assisted diagnosis.
3. **Suggest:** Prepare a correction for the supported scenario.
4. **Review:** Approve or reject the proposed fix.
5. **Retry:** Run the workflow again and check the outcome.
6. **Record:** Store execution details for monitoring and review.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| React | Frontend and user interface |
| Vite | Frontend development server and build tool |
| Python | Backend programming |
| FastAPI | Backend API |
| SQLite | Storing workflow and execution records |
| Gemini API *(optional)* | AI-assisted diagnosis, when configured |

## 📁 Project Structure

```text
rootfix_AI/
├── backend/
│   ├── main.py
│   ├── requirements.txt
│   └── .env.example
│
├── frontend/
│   ├── package.json
│   └── src/
│       ├── App.jsx
│       ├── main.jsx
│       └── styles.css
│
└── README.md
```

*Note: Update this structure if your actual repository contains additional files or folders.*

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

- Python 3.10 or a compatible version for your dependencies
- Node.js and npm
- Git

### 1. Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
cd YOUR_PROJECT_FOLDER
```

Replace the placeholders with your actual GitHub repository URL and folder name.

### 2. Start the backend

Open a terminal in VS Code:

```bash
cd backend
python -m venv venv
```

Activate the virtual environment.

**Windows:**

```bash
venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Start the FastAPI server:

```bash
uvicorn main:app --reload
```

The backend should be available at:

`http://127.0.0.1:8000`

You can explore the API documentation at:

`http://127.0.0.1:8000/docs`

### 3. Start the frontend

Open a **second terminal** in VS Code:

```bash
cd frontend
npm install
npm run dev
```

Open the local URL shown in the terminal, usually:

`http://localhost:5173`

If needed, configure `VITE_API_BASE_URL` in your frontend environment to point to the running backend.

## 🧪 Example Demo

Try the following flow in the dashboard:

1. Select a failure scenario.
2. Click **Simulate Failure**.
3. Review the diagnosis and proposed correction.
4. Approve or reject the proposed fix.
5. Retry the workflow and review the execution result.

## 🎯 Future Improvements

- Support more workflow types and failure scenarios.
- Improve diagnosis and fix accuracy.
- Add more validation before executing fixes.
- Integrate with real monitoring tools and external services.
- Expand automated recovery while maintaining human oversight.

## 👥 Team

**Project:** rootfix_AI  
**Built for:** Hackathon  
**Team Members:** Add your team members here.

## 📌 Note

rootfix_AI is a hackathon prototype. Its current recovery capabilities depend on the supported test scenarios and implemented logic. It is not intended to automatically repair every type of software failure.

## ❤️ Acknowledgements

Built with curiosity, teamwork, and the goal of making workflow recovery simpler.

---

**rootfix_AI — Less time chasing errors. More time moving forward.**

# Java + React Fullstack Starter

## Structure
- `backend`: Spring Boot API
- `frontend`: React app
- `docs`: Architecture and API contracts
- `scripts`: helper scripts

## Quick Start
1. Start the backend with `backend\mvnw.cmd spring-boot:run` on Windows or `./backend/mvnw spring-boot:run` on macOS/Linux
2. Start the frontend with `npm install` and `npm run dev -- --host` inside `frontend`
3. Use `docker compose up --build` for a containerized setup
4. On Windows, use `scripts\run-all.bat` to open backend and frontend in separate windows
5. If a stale process is blocking a port, use `scripts\stop-dev.bat`

## Same Port Mode
1. Run `scripts\same-port-start.bat` on Windows
2. The script builds the React app into the backend static folder and starts Spring Boot on `http://localhost:8080`
3. Use `scripts\stop-dev.bat` before restarting if `8080` is already in use

## =========================
## 1️⃣ Frontend build stage
## =========================
#FROM node:20 AS frontend-build
#
#WORKDIR /app/frontend
#COPY frontend/package*.json ./
#RUN npm install
#COPY frontend/ ./
#RUN npm run build   # Produces /app/frontend/dist
#
## =========================
## 2️⃣ Backend stage
## =========================
#FROM python:3.11-slim
#
#WORKDIR /app
#
## Install Python dependencies
#COPY backend/requirements.txt .
#RUN pip install --no-cache-dir -r requirements.txt
#
## Copy backend
#COPY backend/ .
#
## Copy frontend build into backend static folder
#COPY --from=frontend-build /app/frontend/dist ./static
#
## Expose port
#EXPOSE 5000
#
## Start with Gunicorn for production
#CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]



# Build Vite React frontend
FROM node:18-alpine as client-builder
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend ./
RUN npm run build

# Python Flask backend
FROM python:3.10-slim as server
WORKDIR /app/backend
COPY backend ./backend
COPY --from=client-builder /app/frontend/dist ./frontend/dist
RUN pip install flask

EXPOSE 5000
CMD ["python", "backend/app.py"]
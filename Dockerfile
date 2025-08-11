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


# Use an official Node image to build the React app
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app/frontend

# Copy package files and install dependencies
COPY frontend/package.json frontend/package-lock.json* ./ 
RUN npm install

# Copy rest of the app source code
COPY frontend/ ./

# Build the production-ready app
RUN npm run build

# Serve the built app with a lightweight web server (nginx)
FROM nginx:alpine

# Copy built files from the build stage
COPY --from=build /app/frontend/dist /usr/share/nginx/html

# Copy custom nginx config if needed (optional)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

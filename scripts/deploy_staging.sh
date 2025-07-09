#!/bin/bash
set -e

# Setze deinen Docker Hub Usernamen und das Tag (z.B. Commit SHA oder latest)
DOCKERHUB_USERNAME=""
IMAGE_TAG="${1:-latest}"  # Übergib das Tag als Argument oder nutze 'latest'

echo "Setze Umgebungsvariablen für Compose..."
export BACKEND_IMAGE="$DOCKERHUB_USERNAME/my-backend:$IMAGE_TAG"
export FRONTEND_IMAGE="$DOCKERHUB_USERNAME/my-frontend:$IMAGE_TAG"

echo "Pull latest images..."
docker compose -f docker-compose.yml -f docker-compose.prod.yml pull

echo "Recreate containers with new images..."
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d

echo "Clean up unused Docker resources..."
docker image prune -af
docker container prune -f

echo "Deployment complete!"

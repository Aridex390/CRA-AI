#!/bin/bash
set -e

# Build image
docker compose -p cra-ai-prod -f docker-compose.yml -f docker-compose.prod.yml up build

# Start the docker image
docker compose -p cra-ai-prod -f docker-compose.yml -f docker-compose.prod.yml up

echo "Waiting for databases to be ready..."
sleep 20  # Adjust as needed for DB initialization

echo "Deployment complete!"
echo "Frontend: http://localhost:3000"
echo "Backend:  http://localhost:8000"
echo "Postgres: http://localhost:5432"
echo "PgAdmin: http://localhost:5050"
echo "MongoDB:  http://localhost:27017"

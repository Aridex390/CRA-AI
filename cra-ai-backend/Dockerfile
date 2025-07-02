# Use an official Python base image
FROM python:3.13-slim

# Set eviroment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# install system dependencies (if needed)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies first (for better Docker caching)
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy application code
COPY ./app ./app

# Expose the port FastAPI will run on
EXPOSE 8000

# Command to run the application with Uvicorn
CMD ["uvicorn", "app.main>app", "--host", "0.0.0.0", "--port", "8000"]
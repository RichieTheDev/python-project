# Stage 1: Build stage
FROM python:3.13-alpine AS build

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Runtime stage
FROM python:3.13-alpine

# Set working directory
WORKDIR /app

# Set environment variable for production
ENV FLASK_ENV=production

# Copy installed dependencies from build
COPY --from=build /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# Copy app code
COPY main.py .

# Expose the app port
EXPOSE 5000

# Command to run the app
CMD ["python", "main.py"]
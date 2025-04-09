# Stage 1: Build stage
FROM python:alpine3.18e as build

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt  # Ensures no cache is stored

# Stage 2: Runtime stage
FROM python:alpine3.18e

# Set working directory
WORKDIR /app

# Set environment variable for production
ENV FLASK_ENV=production

# Copy installed dependencies from build
COPY --from=build /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH

# Copy app code
COPY app/ ./app/
COPY app/main.py .

# Expose the app port
EXPOSE 5000

# Command to run the app
CMD ["python", "main.py"]

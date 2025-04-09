# Flask Time API Docker Setup

This project is a simple Flask-based API that provides the current date and time in ISO 8601 format. It is containerized using Docker for easy deployment and scalability.

## Project Structure

The project consists of the following files:

- `Dockerfile`: Defines the build process for the containerized application.
- `requirements.txt`: Lists the necessary Python dependencies.
- `main.py`: The main Flask application that exposes an API endpoint.

## Steps to Build and Run the Docker Container

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/RichieTheDev/python-project.git
```

### 2. Install Docker

Make sure you have Docker installed on your machine. You can download it from the official Docker website.

### 3. Build the Docker Image

From the root directory of the project, run the following command to build the Docker image:

```bash
docker build -t flask-time-api .
```

This will create a Docker image named flask-time-api using the multi-stage build defined in the Dockerfile.

### 4. Run the Docker Container

Once the image is built, you can run the container:

```bash
docker run -p 5000:5000 flask-time-api
```

### 5. Access the API

You can now access the API endpoint to get the current time. Open your browser or use curl to make a GET request to the /time endpoint:

```bash
curl http://localhost:5000/time
```

This should return a JSON response with the current time.

# Conclusion

This project provides a simple API that can be easily containerized using Docker. It demonstrates how to set up a multi-stage build in Docker for separating the build and production environments. You can modify the app or extend it further based on your requirements.

Enjoy using the Flask Time API!

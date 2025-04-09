from flask import Flask, jsonify
from datetime import datetime
import logging

# Initialize the Flask application
app = Flask(__name__)

# Set up logging configuration for info-level messages
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',  # Add timestamp to logs
    handlers=[
        logging.StreamHandler()  # Logs to the console
    ]
)

# Define the route for '/time' to handle GET requests
@app.route('/time', methods=['GET'])
def get_time():
    # Get the current UTC time and format it in ISO 8601 format with a 'Z' at the end (indicating UTC)
    current_time = datetime.utcnow().isoformat() + "Z"
    
    # Log the current time request
    app.logger.info(f"Current time requested: {current_time}")
    
    # Return the current time as a JSON response
    return jsonify({'current_time': current_time})

# Check if this script is being run directly (not imported as a module)
if __name__ == '__main__':
    # Run the Flask application, accessible on all IP addresses of the host on port 5000
    app.run(host='0.0.0.0', port=5000)

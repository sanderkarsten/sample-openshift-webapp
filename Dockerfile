FROM python:3.6

# Update CA certificates
RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates

# Install Flask, bypassing SSL verification
RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org flask

# Copy the application source code
COPY app.py /opt/

# Set the working directory
WORKDIR /opt

# Expose the application port
EXPOSE 8080

# Define the entry point
ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=8080"]

# Set environment variable for Flask app
ENV FLASK_APP=/opt/app.py

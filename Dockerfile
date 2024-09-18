# Use Python 3.6 as per your tutorial
FROM python:3.6

# Install CA certificates and other necessary utilities
RUN apt-get update && apt-get install -y ca-certificates

# Bypass SSL verification to install pip==19.3.1
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org pip==19.3.1

# Continue with your Flask installation
RUN pip install --trusted-host pypi.org --trusted-host pypi.pythonhosted.org --trusted-host files.pythonhosted.org flask

# Copy the application source code
COPY app.py /opt/

# Set the working directory
WORKDIR /opt

# Set environment variables for Flask
ENV FLASK_APP=/opt/app.py
ENV FLASK_ENV=production

# Expose the application port (Flask will run on this port)
EXPOSE 8080

# Define the entry point for Flask app
ENTRYPOINT ["flask", "run", "--host=0.0.0.0", "--port=8080"]

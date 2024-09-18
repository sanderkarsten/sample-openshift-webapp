FROM python:3.6

# Install CA certificates
RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates

# Install pip without SSL verification
RUN python -m pip install --upgrade --trusted-host pypi.org --trusted-host pypi.pythonhosted.org pip

# Install Flask
RUN python -m pip install --trusted-host pypi.org --trusted-host pypi.pythonhosted.org flask

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

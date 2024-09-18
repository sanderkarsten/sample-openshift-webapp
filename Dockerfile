FROM python:3.6

# Install necessary certificates and update pip
RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates

# Install dependencies
COPY requirements.txt /opt/requirements.txt
RUN pip install --no-cache-dir -r /opt/requirements.txt

# Copy the app code
COPY app.py /opt/app.py

# Set working directory
WORKDIR /opt

# Expose port
EXPOSE 8080

# Set environment variable for Flask
ENV FLASK_APP=/opt/app.py

# Run the app
CMD ["flask", "run", "--host=0.0.0.0", "--port=8080"]

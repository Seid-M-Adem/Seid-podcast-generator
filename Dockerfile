# Use a Python base image
FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential

# Install PyYAML
RUN pip install PyYAML

# Copy necessary files into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]


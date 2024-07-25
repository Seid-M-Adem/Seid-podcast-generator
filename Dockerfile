# Use a base image
FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    build-essential

# Install PyYAML
RUN apt-get install -y python3-yaml

# Copy necessary files into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]




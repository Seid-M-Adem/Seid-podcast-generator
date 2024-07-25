# Use a base image
FROM ubuntu:20.04

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install Python package PyYAML
RUN pip3 install PyYAML

# Verify installation of Python and pip
RUN python3 --version
RUN pip3 --version

# Copy necessary files into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]





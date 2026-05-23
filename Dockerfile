# Use Python 3.9 slim image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install Git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy all project files into container
COPY . /app

# Make entrypoint script executable
RUN chmod +x /app/.github/scripts/entry_point.sh

# Run the entrypoint script
ENTRYPOINT ["/app/.github/scripts/entry_point.sh"]
#!/bin/bash

# Setup script for Evilginx2 + Gophish Docker Deployment

echo "Setting up Evilginx2 + Gophish Docker Deployment..."

# Create necessary directories
echo "Creating data directories..."
mkdir -p evilginx2-data/database
mkdir -p evilginx2-data/phishlets
mkdir -p evilginx2-data/redirectors
mkdir -p gophish-data

# Copy phishlets from original evilginx2 installation if available
if [ -d "/home/adsim-admin/tools/phish-tools/evilginx2/phishlets" ]; then
    echo "Copying phishlets from original evilginx2 installation..."
    cp -r /home/adsim-admin/tools/phish-tools/evilginx2/phishlets/* evilginx2-data/phishlets/
fi

echo "Setup complete! You can now run 'docker-compose up -d' to start the services."
echo "Access Gophish admin interface at: http://localhost:3333 (default credentials: admin:gophish)"
echo "Access Evilginx2 HTTP interface at: http://localhost:9081"
echo "Access Evilginx2 HTTPS interface at: https://localhost:8444"
echo "Access Evilginx2 by running: docker exec -it evilginx2 /bin/sh"

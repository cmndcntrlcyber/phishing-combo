# Evilginx2 + Gophish Docker Deployment

This Docker deployment combines Evilginx2 and Gophish for advanced phishing campaigns. Evilginx2 acts as a man-in-the-middle proxy to capture credentials and session cookies, while Gophish provides campaign management and email phishing capabilities.

## Components

1. **Evilginx2**: A man-in-the-middle attack framework used for phishing login credentials along with session cookies, which allows bypassing 2-factor authentication.
2. **Gophish**: A powerful, open-source phishing toolkit designed for businesses and penetration testers to test their organization's exposure to phishing.

## Prerequisites

- Docker
- Docker Compose
- A domain name (for Evilginx2)
- Valid SSL certificates (for production use)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/phishing-combo.git
cd phishing-combo
```

### 2. Run the Setup Script

```bash
./setup.sh
```

This script will:
- Create necessary data directories
- Copy phishlets from the original evilginx2 installation if available

### 3. Build and Start the Containers

```bash
docker-compose up -d
```

### 4. Access the Services

- **Gophish Admin Interface**: http://localhost:3333
  - Default credentials: admin:gophish
- **Evilginx2**: Access via SSH into the container
  ```bash
  docker exec -it evilginx2 /bin/sh
  ```

### 5. Configure Evilginx2

Once inside the Evilginx2 container:

```
# Set up your domain
evilginx2> config domain yourdomain.com

# Set up your IP (your server's public IP)
evilginx2> config ip 1.2.3.4

# Enable a phishlet
evilginx2> phishlets enable linkedin

# Get the phishing URL
evilginx2> lures create linkedin
evilginx2> lures get-url 0
```

### 6. Configure Gophish

1. Log in to the Gophish admin interface at http://localhost:3333
2. Create a new campaign
3. Use the Evilginx2 phishing URL in your campaign

### 7. Test the Deployment

```bash
./test-deployment.sh
```

This script will:
- Check if both containers are running
- Test network connectivity between containers
- Verify that the Gophish admin interface is accessible

### 8. Cleanup (When Needed)

If you need to clean up the deployment:

```bash
./cleanup.sh
```

This script will:
- Stop and remove the Docker containers
- Optionally remove all data directories
- Optionally remove the Docker images

## Integration Between Evilginx2 and Gophish

The integration between Evilginx2 and Gophish allows you to:

1. Create phishing campaigns in Gophish
2. Use Evilginx2-generated URLs in those campaigns
3. Capture not only credentials but also session cookies to bypass 2FA
4. Track campaign statistics in Gophish

The integration is configured in the `integration-config.json` file, which is mounted into the Gophish container. This configuration enables Gophish to communicate with Evilginx2 and use its phishing URLs in campaigns.

## Security Considerations

This setup is intended for legitimate security testing only. Always ensure you have proper authorization before conducting phishing tests.

## Troubleshooting

### Common Issues

1. **Port Conflicts**: If you have services already using ports 80, 443, 53, 3333, or 8080, modify the port mappings in docker-compose.yml.

2. **DNS Issues**: Evilginx2 requires proper DNS configuration. Ensure your domain's DNS records point to your server's IP address.

3. **SSL Certificate Errors**: For production use, replace the self-signed certificates with valid ones.

## Disclaimer

This tool combination should only be used for legitimate security testing with proper authorization. Unauthorized use for phishing attacks is illegal and unethical.

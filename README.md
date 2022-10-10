## Usage:

Go to GitHub and get your organization name (github.com/${ORGANIZATION}) and your registration token for your runner.

Settings -> Actions -> runners

Update docker-compose.yml with your ORGANIZATION variable

Then run:

```
docker compose build
REG_TOKEN=<TOKEN_HERE> docker compose up -d
```

Verify with `docker compose logs`

# Ubuntu 24.04 Web Terminal on Render

A simple Ubuntu 24.04 browser-based terminal using ttyd.

## Files

```text
.
├── Dockerfile
├── start.sh
└── README.md
```

## What this provides

- Ubuntu 24.04
- Browser-based Bash terminal
- ttyd
- curl
- wget
- sudo
- git
- nano
- vim
- ping
- CA certificates
- Render `$PORT` support

## Deploy on Render

1. Upload `Dockerfile` and `start.sh` to a GitHub repository.
2. Open Render and choose **New → Web Service**.
3. Connect the GitHub repository.
4. Select **Docker** as the runtime.
5. Choose the Free plan if you are testing.
6. Deploy.

The startup script automatically reads Render's `$PORT` environment variable, so you do not need to manually choose the public port.

## Open the terminal

After deployment, open:

```text
https://YOUR-SERVICE-NAME.onrender.com
```

Replace `YOUR-SERVICE-NAME` with your Render service name.

## How it works

```text
Browser
   ↓
Render public URL
   ↓
ttyd
   ↓
Ubuntu 24.04 Bash
```

## Important storage note

This is a reproducible container environment, not a permanent VPS.

If Render recreates the container, the Ubuntu environment and installed packages are rebuilt automatically from the Dockerfile. Files created manually inside the container may be lost because the filesystem is ephemeral on Render Free.

Keep important files in your GitHub repository or another supported persistent storage service.

## Local Docker test

If Docker is installed:

```bash
docker build -t ubuntu-web-terminal .
docker run --rm -p 10000:10000 -e PORT=10000 ubuntu-web-terminal
```

Then open:

```text
http://localhost:10000
```

## Troubleshooting

### The page does not open

Check the Render deploy/runtime logs and confirm that ttyd started successfully.

### The service keeps restarting

Check the runtime logs for the first error. The container exits whenever the main `ttyd` process exits.

### Port problem

The container listens on:

```text
0.0.0.0:$PORT
```

Do not hard-code a different Render public port in `start.sh`.

## Security

This example starts ttyd without an authentication password. Anyone who can access the public URL may be able to use the terminal.

For anything beyond personal testing, add proper authentication/access control before exposing it publicly.

## License

Use and modify this setup for your own projects.

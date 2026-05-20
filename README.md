A simple linux desktop (powered by [Webtop](https://docs.linuxserver.io/images/docker-webtop/))with a couple browsers and OBS installed so that you can record stuff. I use this to make higher quality recordings of video calls on platforms that otherwise don't have great recording capabilities.

## Setup
Clone the repo
```bash
git clone https://github.com/TaylorJadin/webtop-recorder
```

Copy `.env.example` and edit the configuration
```bash
cd webtop-recorder
cp .env.example .env
vim .env
```

Spin it up
```bash
docker-compose up -d && docker compose logs -f
```

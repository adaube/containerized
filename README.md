# What is it?
It's an app that runs in containers.
## Requirements: 
  - `docker` 
  - `docker-compose`
  - `.env`
    - DB_USERNAME
    - DB_PASSWORD

## How to Use
```sh
make build  # builds images
make up     # starts app
make down   # removes app

make        # down build up

make logs   # view app log
```
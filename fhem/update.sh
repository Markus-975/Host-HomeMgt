#!/usr/bin/sh

cd /opt/docker/fhem

echo "... docker compose pull"
docker compose pull

echo "... docker compose down"
docker compose down

echo "... docker compose up"
docker compose up -d


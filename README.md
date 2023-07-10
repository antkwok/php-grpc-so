# php-grpc-so

## For Docker Development Environment
```bash

# for build and recreate
docker-compose up --build --force-recreate --no-deps -d

# for down, it will destroy all container, but the volume still exist
docker-compose down
```

## For Docker Production Image build and push
```bash
# 1. docker build Production
docker build -f Dockerfile -t grpc-image .

# 2. Log on to an instance of Container Registry Enterprise Edition
docker login --username=[your username]

# 3. Push image to the registry
docker login --username=[your username]
docker tag [ImageId] antkwok/php-grpc-so:[tag]
docker push antkwok/php-grpc-so:[tag]
```

#!/bin/bash

# Depending on the param run either docker dev or docker prod
if [ "$1" = "dev" ]; then
  # Run front
  docker-compose -f ./tm-front/docker-compose.dev.yml up --build
  # Run Back
  docker-compose -f ./api/docker-compose.dev.yml up --build
elif [ "$1" = "prod" ]; then
  # Run front
  docker-compose -f ./tm-front/docker-compose.prod.yml up --build
  # Run back
  docker-compose -f ./api/docker-compose.prod.yml up --build
else
  echo "Please provide a valid param"
fi
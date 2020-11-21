#!/bin/bash

# clean build
rm -Rf build
mkdir -p build/web

# build frontend
cd ../kunren-fe
npm run build

cd ../kunren-docker/build/
cp -r ../../kunren-fe/build/* web/
cp -r ../../kunren-be/cmd .
cp -r ../../kunren-be/internal .
cp ../../kunren-be/go.* .
cp ../backend/Dockerfile .

docker build . -t kunren

cd ..

#!/bin/bash
docker build . -t tester
docker run tester /sqlx --help
docker cp $(docker create tester /sqlx):/sqlx sqlx

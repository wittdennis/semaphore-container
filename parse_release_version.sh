#!/bin/sh
VERSION=$(sed '/FROM docker.io\/semaphoreui\/semaphore:/!d' Dockerfile | cut -d'v' -f2)
echo "$VERSION"

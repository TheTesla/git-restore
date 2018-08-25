#!/bin/bash

export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
mkdir -p "$2/$1"
cd "$2/$1"
git init



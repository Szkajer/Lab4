#!/bin/bash

if [ "$1" == "--date" ]; then
  dzisiaj=$(date +%Y-%m-%d)
  echo "Dzisiaj jest: $dzisiaj"
else
  echo "Nieznany argument: $1"
fi

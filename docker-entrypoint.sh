#!/bin/bash
set -e
chmod +x athena.go
gin run athena.go
exec "$@"

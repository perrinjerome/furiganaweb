#!/bin/bash -xe

python3 /src/project/prepare.py
exec python3 /src/project/app.py $@

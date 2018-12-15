#!/usr/bin/env bash

docker run --rm -it \
       -v ${PWD}:/home/atlas/portal \
       -w /home/atlas/portal/code \
       atlas/analysisbase:21.2.56 \
       bash -c "../setup.sh; bash --login"

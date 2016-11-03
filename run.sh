#!/bin/sh

set -e

docker build --rm -t intermezzos-bare-bones image
exec docker run \
  --rm \
  --volume `pwd`:/os \
  --env LOCAL_USER=$USER \
  --env LOCAL_USER_ID=`id -u` \
  --env TERM=$TERM \
  --workdir /os \
  --interactive \
  --tty \
  intermezzos-bare-bones \
  image/run.sh \
  "$@"

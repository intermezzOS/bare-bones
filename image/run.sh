#!/bin/sh

set -e

if [ "$LOCAL_USER_ID" != "" ]; then
  useradd --shell /bin/bash -u $LOCAL_USER_ID -o -c "" -m $LOCAL_USER
  export HOME=/os/target/home
  export LOCAL_USER_ID=
  exec sudo -E -u $LOCAL_USER env PATH=$PATH "$@"
fi

exec "$@"

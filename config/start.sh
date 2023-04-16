#!/bin/sh

set -e

PUID=${PUID:-568}
PGID=${PGID:-568}

echo '
-------------------------------------
GID/UID
-------------------------------------'
echo "
User uid:    $(id -u "$USER_NAME")
User gid:    $(id -g "$USER_NAME")
-------------------------------------
"

touch /script/json/settings.json
touch /script/json/table.json

if [ -f connections/*.sh ]; then sed -i -e 's/\r$//' connections/*.sh; fi

pip3 install --upgrade --no-cache-dir --disable-pip-version-check --quiet animeworld

python3 -u /script/main.py
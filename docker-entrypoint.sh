#!/bin/bash
set -e
DIR=/sickrage
USER=sickrage

getent passwd $USER || useradd $USER -m -d $DIR

if [ ! -z "$USER_ID" ]; then
  usermod -u $USER_ID $USER
fi

if [ ! -z "$USER_GID" ]; then
  getent group $USER_GID || groupadd -g $USER_GID g_"$USER_GID"
  usermod -g $USER_GID $USER
fi

[ -d "$DIR" ] || mkdir -p "$DIR"

if [ ! -d $DIR/.git ]; then
  git clone https://github.com/echel0n/SickRage.git $DIR
fi

chown -R $USER:$USER_GID $DIR

exec su - $USER -s /bin/bash -c "cd $DIR && /usr/bin/python SickBeard.py"

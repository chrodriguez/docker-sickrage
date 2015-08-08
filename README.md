# Sickrage daemon container

Run sickrage allowing you to specify USER_UID and USER_GID, so you
will not have permission problems.

## Example

```
docker run -e TZ=America/Argentina/Buenos_Aires \
  -e USER_ID=`id -u` \
  -e USER_GID=`id -g` \
  -p 8081:8081 \
  -v `pwd`/sickrage:/sickrage \
  -v `pwd`/shows:/shows \
  --volumes-from transmission \
  -d \
  --name=sickrage \
  chrodriguez/sickrage

```

In the above example, we mount volumes from transmission container so downloaded
tv shows can be managed by sickrage. You need to configue this integration
properly

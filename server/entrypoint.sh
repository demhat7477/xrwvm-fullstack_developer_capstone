#!/bin/sh

# Make migrations and migrate the database.
echo "Making migrations and migrating the database. "
python manage.py makemigrations djangoapp --noinput
python manage.py migrate --run-syncdb --noinput
python manage.py collectstatic --noinput
DJANGO_SUPERUSER_PASSWORD=root python manage.py createsuperuser --noinput --username root --email root@example.com || true
exec "$@"

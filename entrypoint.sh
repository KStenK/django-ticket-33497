#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z postgres 5432; do
  sleep 1
done

echo "PostgreSQL started"

python manage.py migrate
python manage.py collectstatic --no-input --clear
echo "from django.contrib.auth.models import User; User.objects.filter(email='django@foo.com').exists() or User.objects.create_superuser('django', 'django@foo.com', 'django')" | python manage.py shell

exec "$@"
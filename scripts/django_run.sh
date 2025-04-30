#!/bin/sh
set -e

poetry run python manage.py collectstatic --noinput
poetry run python manage.py migrate
gunicorn -b :8000 --chdir /app app.wsgi:application
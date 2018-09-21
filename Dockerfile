FROM lukasdornak/djuwinx

COPY testmail /app/testmail/

ENV PROJECT_NAME=testmail
ENV DJANGO_SETTINGS_MODULE=$PROJECT_NAME.settings

RUN mkdir /app/data \
  && django-admin makemigrations \
  && django-admin migrate \
  && django-admin collectstatic --no-input

EXPOSE 25

ENTRYPOINT chown www-data /app/data/ /app/data/db.sqlite3 && uwsgi --ini /app/djuwinx_uwsgi.ini && /etc/init.d/nginx restart && /bin/bash

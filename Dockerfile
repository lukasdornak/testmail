FROM lukasdornak/djuwinx:1.0

COPY . /app/

ENV DJANGO_SETTINGS_MODULE=testmail.settings

RUN mkdir /app/data \
    && django-admin makemigrations \
    && django-admin migrate \
    && chown -R nginx /app/data \
    && django-admin collectstatic

ENTRYPOINT uwsgi --ini /etc/uwsgi/djuwinx_uwsgi.ini && nginx && /bin/ash
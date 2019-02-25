FROM lukasdornak/djuwinx:1.0

COPY . /app/

ENV DJANGO_SETTINGS_MODULE=testmail.settings

ENTRYPOINT uwsgi --ini /etc/uwsgi/djuwinx_uwsgi.ini && nginx && /bin/ash
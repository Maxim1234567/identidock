FROM python

RUN apt-get update && apt-get install dos2unix
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install -U setuptools
RUN pip install wheel Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

RUN dos2unix /cmd.sh

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
FROM python:3.9-slim-bullseye

COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt

WORKDIR /src
COPY src/ /src/
RUN pip install -e /src


ENV FLASK_APP=app/app.py FLASK_ENV=development FLASK_DEBUG=1 PYTHONUNBUFFERED=1
CMD flask run
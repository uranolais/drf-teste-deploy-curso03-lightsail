FROM python:3.11.8-alpine3.18

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt

COPY ./scripts /scripts
RUN chmod -R +x /scripts

ENV PATH="/scripts:/py/bin:$PATH"

COPY ./app /setup
WORKDIR /app

EXPOSE 80

CMD ["/scripts/run.sh"]
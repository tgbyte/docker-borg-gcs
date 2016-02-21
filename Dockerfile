FROM tgbyte/cron

RUN apt-get update && \
    apt-get install -y python-pip build-essential libffi-dev libffi6 python-dev && \
    pip install gsutil && \
    apt-get remove -y --purge build-essential libffi-dev python-dev && \
    apt-get autoremove -y --purge

RUN adduser --uid 500 --disabled-password --gecos "Borg Backup" --quiet borg

VOLUME /var/backups/borg

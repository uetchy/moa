FROM python:3.6

ENV PIPENV_VENV_IN_PROJECT=1
ENV MOA_CONFIG=config.ProductionConfig

RUN apt-get update && apt-get install -y python-dev python3-dev build-essential
RUN pip3 install pipenv

# setup moa
WORKDIR /usr/src/app
COPY . .

# install deps
RUN pipenv install

# scaffold database
# RUN pipenv run python -m moa.models

# start
CMD ["pipenv", "run", "python", "app.py"]

# RUN pipenv run python -m moa.worker

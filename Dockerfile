FROM python:3.6

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/work

COPY Pipfile Pipfile.lock ./

RUN pip install pipenv \
 && pipenv install --system

RUN mkdir data
COPY ./data ./data

RUN mkdir confirmation
COPY ./confirmation ./confirmation

CMD ["pipenv", "run", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

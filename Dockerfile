FROM python:3.7

ENV PYTHONUNBUFFERED=1

WORKDIR /usr/src/source

ENV PIPENV_VENV_IN_PROJECT=1

COPY ./source/Pipfile ./

RUN pip install --upgrade pip \
    && pip install pipenv \
    && pipenv install --skip-lock --system

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]

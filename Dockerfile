FROM python:3.8.1
LABEL maintainer="Paulo Ricardo Rube Almeida <contact@prra.dev>"


ENV POETRY_VERSION=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update -yy && apt-get upgrade -yy
RUN pip install --upgrade pip && pip install "poetry==$POETRY_VERSION"

COPY ./src/poetry.lock ./src/pyproject.toml ./
RUN poetry install

# Copy project files
COPY ./src ./


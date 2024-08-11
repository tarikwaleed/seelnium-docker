FROM python:3.10

ENV VAR1=10

ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

COPY Pipfile Pipfile.lock ./
RUN python -m pip install --upgrade pip
RUN pip install  --progress-bar off pipenv && pipenv install --dev --system --deploy  --progress-bar off

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y wget unzip && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y •/google-chrome-stable_current_amd64. deb && \
    rm google-chrome-stable_current_amd64.deb && \
    apt-get clean
CMD ["python","main.py"]



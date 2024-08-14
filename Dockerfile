FROM python:3.10-bullseye

ENV VAR1=10

ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# COPY Pipfile Pipfile.lock ./
COPY req.txt .
RUN python -m pip install --upgrade  pip --progress-bar off
# RUN pip install --progress-bar off pipenv && pipenv install --dev  --progress-bar off
RUN pip install -r req.txt --progress-bar off

RUN apt-get update
RUN apt-get install -y wget unzip 
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
RUN apt install -y •/google-chrome-stable_current_amd64. deb --allow-insecure-repositories 
RUN rm google-chrome-stable_current_amd64.deb
RUN apt-get clean

WORKDIR /app
COPY . /app

CMD ["python","main.py"]

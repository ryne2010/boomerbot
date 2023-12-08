FROM python:3.7-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    python3-rpi.gpio \
 && rm -rf /var/lib/apt/lists/*

RUN pip install Flask

EXPOSE 5000

CMD ["python", "app.py"]

FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
COPY .env .env

ENV ENV=dev
ENV SQLALCHEMY_DATABASE_URI=sqlite:///db.sqlite3

CMD ["python", "run.py"]

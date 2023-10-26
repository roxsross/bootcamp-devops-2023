# syntax=docker/dockerfile:1
FROM python:3.8
WORKDIR /testingDock
# RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8080
COPY . .
CMD ["python", "server.py"]

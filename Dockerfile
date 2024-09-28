FROM python:3.8-slim
WORKDIR /app
COPY . /app
CMD ["python","test666.py"]

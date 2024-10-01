FROM python:3.8-slim
WORKDIR /ap
COPY . /ap
CMD ["python","test666.py"]

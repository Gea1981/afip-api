FROM python:3.10-slim

WORKDIR /app

# Instalamos herramientas de compilación y dependencias de xmlsec
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libxml2-dev \
    libxmlsec1-dev \
    libxmlsec1-openssl \
    pkg-config \
    && apt-get clean

COPY . .

RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

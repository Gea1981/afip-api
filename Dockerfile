# Imagen base
FROM python:3.10-slim

# Seteo de directorio de trabajo
WORKDIR /app

# Instalamos librerías del sistema necesarias para xmlsec
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxmlsec1-dev \
    libxmlsec1-openssl \
    pkg-config \
    && apt-get clean

# Copiamos todos los archivos del proyecto
COPY . .

# Instalamos las dependencias de Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Exponemos el puerto
EXPOSE 8000

# Comando de arranque
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

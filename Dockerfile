FROM debian:latest

# Update & install system packages
RUN apt update && apt upgrade -y && \
    apt install -y git curl python3-pip python3-venv ffmpeg

# Buat virtual environment
RUN python3 -m venv /venv

# Aktifkan virtualenv & install pip terbaru
RUN /venv/bin/pip install --upgrade pip

# Copy requirements dan install dalam virtualenv
COPY requirements.txt /requirements.txt
RUN /venv/bin/pip install -r /requirements.txt

# Siapkan direktori kerja
RUN mkdir /RadioPlayerV3
WORKDIR /RadioPlayerV3
COPY start.sh /start.sh

# Jalankan bot pakai virtualenv Python
CMD ["/venv/bin/python", "/start.sh"]

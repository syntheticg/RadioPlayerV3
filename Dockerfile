FROM debian:latest

# Update dan install package dasar
RUN apt update && apt upgrade -y && \
    apt install -y git curl python3-pip ffmpeg python3-venv

# Bikin dan aktifin virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Salin dan install requirements awal
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

# Set working directory
WORKDIR /RadioPlayerV3

# Jalankan perintah cloning dan start bot langsung dari CMD
CMD bash -c "\
    echo 'Cloning Repo, Please Wait...' && \
    git clone https://github.com/AsmSafone/RadioPlayerV3.git /RadioPlayerV3 && \
    echo 'Installing Additional Requirements...' && \
    pip install -r /RadioPlayerV3/requirements.txt && \
    echo 'Starting Bot...' && \
    python3 main.py"

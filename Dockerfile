FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg python3-venv -y

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /RadioPlayerV3
CMD ["/bin/bash", "/start.sh"]

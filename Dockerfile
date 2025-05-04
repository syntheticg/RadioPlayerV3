FROM python:3.11-slim

# Install dependency system
RUN apt update && apt install -y git ffmpeg

# Set working dir
WORKDIR /RadioPlayerV3

# Clone repo langsung saat build
RUN git clone https://github.com/syntheticg/RadioPlayerV3.git /RadioPlayerV3

# Install Python requirements
RUN pip install -U pip && pip install -r requirements.txt

# Command to run the bot
CMD ["python3", "main.py"]

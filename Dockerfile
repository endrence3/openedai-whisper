FROM nvidia/cuda:11.8.0-base-ubuntu22.04

RUN apt-get update && apt-get install --no-install-recommends -y ffmpeg python-is-python3 python3-pip

RUN mkdir -p /app
RUN git clone https://github.com/matatonic/openedai-whisper /app
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY *.py /app/

ARG CLI_ARGS=""
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
CMD python whisper.py $CLI_ARGS

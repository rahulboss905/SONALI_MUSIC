FROM python:3.10-slim-bullseye

# Install Node.js and required tools (including git)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    ffmpeg \
    aria2 \
    git \
 && curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
 && apt-get install -y nodejs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["bash", "start"]

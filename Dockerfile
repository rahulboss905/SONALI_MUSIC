FROM python:3.10-slim-bullseye

# Install Node.js (v19) manually
RUN apt-get update && apt-get install -y curl gnupg2 \
 && curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
 && apt-get install -y nodejs ffmpeg aria2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt

CMD ["bash", "start"]

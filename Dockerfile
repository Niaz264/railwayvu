FROM debian:11

RUN apt update && apt upgrade -y
RUN apt-get install git curl python3-pip ffmpeg -y
RUN apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN   mkdir -p /etc/apt/keyrings
RUN sudo mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get install -y nodejs
COPY . /app/
WORKDIR /app/
CMD bash start

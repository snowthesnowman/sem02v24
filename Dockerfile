FROM ubuntu:24.04

RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git

RUN useradd -G sudo -m -d /home/Mathias -s /bin/bash -p "$(openssl passwd -1 Password)" Mathias

USER Mathias
WORKDIR /home/Mathias

RUN mkdir hacking \
&& cd hacking \
&& wget https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..

RUN git config --global user.email "sanzy1207@gmail.com" \
&& git config --global user.name "Mathias-Thorsell" \
&& git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
&& mkdir -p github.com/snowthesnowman

USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-amd64.tar.gz \
| tar xvz -C /usr/local

USER Mathias
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Mathias/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"
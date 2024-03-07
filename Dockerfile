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

RUN useradd -G sudo -m -d /home/Mathias -s /bin/bash -p "$(openssl
passwd -1 Mathias)" Mathias

USER BRUKER
WORKDIR /home/BRUKER

RUN mkdir hacking \
&& cd hacking \
&& curl -SL
https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..

RUN git config --global user.email "Sanzy1207@gmail.com"
\
&& git config --global user.name "Mathias" \
&& git config –global url."https://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:@github.com/".insteadOf
"https://github.com" \
&& mkdir -p github.com/snowthesnowman/sem02v24

USER root
RUN curl -SL https://go.dev/dl/go1.22.0.linux-aMD64.tar.gz \
| tar xvz -C /usr/local

USER BRUKER
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Mathias/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"

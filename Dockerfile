FROM ubuntu:14.04

MAINTAINER Bertrand Martel <bmartel.fr@gmail.com>

RUN apt-get update && apt-get install -y \
    libev4 \
    libssl-dev \
    libev-dev \
    git \
    build-essential

RUN git clone git://github.com/bumptech/stud.git && cd stud && make && make install

RUN mkdir -p /var/run/stud
RUN mkdir -p /usr/local/var/run/stud
RUN mkdir -p /usr/local/etc/stud

RUN useradd -d /var/lib/_stud _stud  
RUN chown _stud: /var/run/stud  
RUN chown -R _stud: /usr/local/var/run/stud /usr/local/etc/stud  
RUN chmod 0770 /usr/local/var/run/stud/

COPY start.sh /var/start.sh
RUN chmod +x /var/start.sh

CMD ["/var/start.sh"]
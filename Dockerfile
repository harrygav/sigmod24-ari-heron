FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools: curl, apt-transport-https, gnupg
RUN apt-get update && apt-get install -y \
    g++ \
    curl \
    make \
    unzip \
    libboost-all-dev \
    git \
    && apt-get clean

RUN git clone https://github.com/HEROAndSIBTree/HEROFramework.git
RUN cd HEROFramework/src/ && make

RUN cd /HEROFramework/data/ && curl -L 'https://drive.usercontent.google.com/download?id=1-08dDoWy-s6qJu38QsbokdnZgzgtUrkM&export=download&confirm=t&uuid=b2091d1c-2dd0-4a5b-9874-1f5b5b97b9c1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/png,image/svg+xml,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br, zstd' -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Connection: keep-alive' -H 'Referer: https://drive.usercontent.google.com/' -H 'Cookie: NID=518=LI0W_WarGWvcDKGs32bzIn5ru35CiC99Dnfyi5MOAy4AdmarQc062BFhi0250d4NgG6DywIqM9vCwvWGg79SP3X6RgQGd_WYtKFwqm027zLmJRvVb_oBi6xtmYOvbsUfoKxPgZhTuQ9mcOK9qJnGq0NzLonhmeJenqQsylqUeVwyPWE' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -H 'Sec-Fetch-User: ?1' -H 'Priority: u=0, i' -o processed.zip
RUN cd /HEROFramework/data/ && yes | unzip processed.zip
RUN mkdir -p /root/benchmark/Set_Intersection/processed/ && cp /HEROFramework/data/* /root/benchmark/Set_Intersection/processed/
#RUN mkdir -p /root/benchmark/Set_Intersection/pairdata/new/


ENTRYPOINT ["/bin/bash"]


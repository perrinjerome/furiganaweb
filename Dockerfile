from debian

RUN apt-get update
RUN apt-get install -y libmecab-dev mecab mecab-ipadic-utf8 python3-dev
RUN apt-get install -y python3-pip
RUN pip3 install mecab-python3 jaconv flask flask-cors

COPY . /src/project/
WORKDIR /src/project/

RUN cd vendor/furigana && pip3 install .

RUN apt-get remove -y libmecab-dev python3-dev perl
RUN apt-get -y autoremove
RUN rm -rf vendor/furigana

# remove everything not used from this debian
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/*
RUN rm -rf /usr/share/locale/*
RUN rm -rf /usr/share/doc/*
RUN rm -rf /usr/share/man/*
RUN rm -rf /usr/share/mime/*
RUN rm -rf /usr/lib/python3.5/__pycache__
RUN rm -rf /usr/lib/file/
RUN rm -rf /usr/lib/python3/dist-packages/Crypto
RUN rm -rf /usr/lib/python3/dist-packages/cryptography

# > ▲ The built image size (101.1M) exceeds the 100MiB limit
# now we really have to hack...
#RUN tar -zcvf mecab.tar.gz /usr/share/mecab/ /var/lib/mecab/
RUN rm -rf /usr/share/mecab/
RUN rm -rf /var/lib/mecab/
# (this will be restored by prepare.py when image starts )

EXPOSE 5500

ENTRYPOINT ["/src/project/start.sh"]

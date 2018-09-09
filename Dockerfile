from debian

RUN apt-get update
RUN apt-get install -y libmecab-dev mecab mecab-ipadic-utf8 python3-dev
RUN apt-get install -y python3-pip
RUN pip3 install mecab-python3 jaconv flask flask-cors

COPY . /src/project/
WORKDIR /src/project/

RUN cd vendor/furigana && pip3 install .

RUN apt-get remove -y libmecab-dev python3-dev perl

EXPOSE 5500

ENTRYPOINT ["/src/project/start.sh"]

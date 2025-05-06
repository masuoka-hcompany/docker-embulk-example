FROM openjdk:8

# コンテナに必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    curl \
    default-mysql-client \
    openssh-client \
    sshpass

# jrubyをインストール
RUN curl --create-dirs -o "./jruby-complete-9.3.14.0.jar" -L "https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.3.14.0/jruby-complete-9.3.14.0.jar"
RUN chmod +x ./jruby-complete-9.3.14.0.jar

# Embulkをダウンロードして実行可能にする
RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://github.com/embulk/embulk/releases/download/v0.11.5/embulk-0.11.5.jar"
RUN chmod +x ~/.embulk/bin/embulk
RUN echo 'export PATH="$HOME/.embulk/bin:$PATH"' >> ~/.bashrc

RUN . ~/.bashrc

COPY ./embulk.properties ./root/.embulk/embulk.properties

RUN java -jar ~/.embulk/bin/embulk gem install embulk -v 0.11.5
RUN java -jar ~/.embulk/bin/embulk gem install embulk-input-mysql
RUN java -jar ~/.embulk/bin/embulk gem install liquid

WORKDIR /work
FROM benatron/android-gradle

ENV NODE_VERSION=8.7.0 \
    NPM_VERSION=5.4.2 \
    IONIC_VERSION=4.3.1 \
    CORDOVA_VERSION=8.1.2 \
    GULP_VERSION=3.9.1 \
    BOWER_VERSION=1.8.4
    
RUN apt-get update && apt-get install -y \ 
    git \
    wget \
    curl \
    unzip \
    build-essential \
    gcc \
    make && \
    curl --retry 3 -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" && \
    tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 && \
    rm "node-v$NODE_VERSION-linux-x64.tar.gz" && \
    npm install -g npm@"$NPM_VERSION" && \
    npm install -g cordova@"$CORDOVA_VERSION" ionic@"$IONIC_VERSION" && \
    npm install -g gulp@"$GULP_VERSION" && \
    npm install -g bower@"$BOWER_VERSION" && \
    npm cache clear --force && \
    git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"
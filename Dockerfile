FROM ghcr.io/cirruslabs/flutter:3.24.3

#User
USER root

# Prerequisites
RUN apt update && apt install -y curl unzip

# Create Folder
RUN mkdir ${HOME}/sonar-scanner

#Download Sonar-Scanner
RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-2.9.0.670.zip
RUN ls
RUN unzip sonar-scanner-cli.zip && rm sonar-scanner-cli.zip
RUN mv sonar-scanner-2.9.0.670 sonar-scanner

#Create system variables
ENV FLUTTER_SONAR=${HOME}/sonar-scanner
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${FLUTTER_SONAR}/bin

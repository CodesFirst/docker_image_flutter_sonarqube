FROM cirrusci/flutter

#User
USER root

# Prerequisites
RUN apt update && apt install -y curl unzip

# Create Folder
RUN mkdir ${HOME}/sonar-scanner

#Download Sonar-Scanner
RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472.zip
RUN unzip sonar-scanner-cli.zip && rm sonar-scanner-cli.zip
RUN mv sonar-scanner-4.6.2.2472 sonar-scanner

#Create system variables
ENV FLUTTER_SONAR=${HOME}/sonar-scanner
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${FLUTTER_SONAR}/bin

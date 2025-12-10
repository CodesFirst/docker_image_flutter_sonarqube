# FROM ghcr.io/cirruslabs/flutter:3.24.3
FROM ghcr.io/cirruslabs/flutter:stable

#User
USER root

# Prerequisites
RUN apt update && apt install -y curl unzip

# Create Folder
RUN mkdir ${HOME}/sonar-scanner

#Download Sonar-Scanner
# RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856.zip
# RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610.zip
RUN wget -O sonar-scanner-cli.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-8.0.1.6346.zip

RUN unzip sonar-scanner-cli.zip && rm sonar-scanner-cli.zip
RUN mv sonar-scanner-8.0.1.6346 sonar-scanner

#Create system variables
ENV FLUTTER_SONAR=${HOME}/sonar-scanner
ENV PATH ${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin:${FLUTTER_SONAR}/bin

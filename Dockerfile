# we are extending everything from tomcat:8.0 image ...
FROM tomcat:9.0

MAINTAINER Bazsalanszky

RUN wget https://github.com/ethereum/solidity/releases/download/v0.5.16/solc-static-linux
RUN chmod +x solc-static-linux
RUN mv solc-static-linux /usr/local/bin/solc_old

COPY target/ChorChain.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
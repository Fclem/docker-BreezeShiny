FROM rocker/shiny

MAINTAINER Clement Fiere "clement.fiere@helsinki.fi"

RUN sudo apt-get update || sudo apt-get update
RUN sudo apt-get install --no-install-recommends --yes apt-utils
RUN sudo apt-get upgrade --no-install-recommends --yes 
RUN sudo apt-get install --no-install-recommends --yes libssl-dev libxml2-dev apt-utils default-jre default-jdk
RUN ["R", "-e", "install.packages('httr', repos='http://cran.us.r-project.org')"]

ADD lib_installer.R /res/


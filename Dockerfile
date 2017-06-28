FROM rocker/shiny

MAINTAINER Clement Fiere "clement.fiere@helsinki.fi"

RUN sudo apt-get update || sudo apt-get update && sudo apt-get upgrade --no-install-recommends --yes && sudo apt-get install --no-install-recommends --yes libssl-dev
RUN ["R", "-e", "install.packages('httr', repos='http://cran.us.r-project.org')"]
# custom R library installer
# ADD https://raw.githubusercontent.com/Fclem/docker-Rcompute-env/master/_res/root_source/res/lib_installer.R /res/
# list of libraries to install
ADD lib_list /res/
ADD lib_installer.R /res/
# install all remaining R libraries
RUN ["R", "-e", "source('/res/lib_installer.R'); packages('/res/lib_list')"]
# specific version of plotly for compatibility purposes
RUN ["R", "-e", "install.packages('https://cran.r-project.org/src/contrib/Archive/plotly/plotly_3.6.0.tar.gz', repos=NULL, type='source')"]
# specific version of base64 as libssl-dev fails to install and is required by the current base64 lib
RUN ["R", "-e", "install.packages('https://cran.r-project.org/src/contrib/Archive/base64/base64_1.1.tar.gz', repos = NULL, type = 'source')"]

# RUN sudo apt-get update && sudo apt-get upgrade --no-install-recommends --yes && sudo apt-get install --no-install-recommends --yes libssl-dev
# RUN ["R", "-e", "install.packages('base64', repos='http://cran.us.r-project.org')"]


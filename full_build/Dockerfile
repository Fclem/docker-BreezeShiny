FROM fimm/shiny-base

MAINTAINER Clement Fiere "clement.fiere@helsinki.fi"

# list of libraries to install
ADD lib_list /res/
# install all remaining R libraries
RUN ["R", "-e", "source('/res/lib_installer.R'); packages('/res/lib_list')"]
# specific version of plotly for compatibility purposes
RUN ["R", "-e", "install.packages('https://cran.r-project.org/src/contrib/Archive/plotly/plotly_3.6.0.tar.gz', repos=NULL, type='source')"]
# specific version of base64 as libssl-dev fails to install and is required by the current base64 lib
RUN ["R", "-e", "install.packages('https://cran.r-project.org/src/contrib/Archive/base64/base64_1.1.tar.gz', repos = NULL, type = 'source')"]


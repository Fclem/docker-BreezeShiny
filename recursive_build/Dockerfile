FROM fimm/shiny:circ

MAINTAINER Clement Fiere "clement.fiere@helsinki.fi"

# list of libraries to install
ADD lib_list /res/
# install all remaining R libraries
RUN ["R", "-e", "source('/res/lib_installer.R'); packages('/res/lib_list')"]


# Author: Cláudio Ferreira Carneiro
# LNLS - Brazilian Synchrotron Light Source Laboratory
ARG EPICS_BASE_IMAGE
FROM  ${EPICS_BASE_IMAGE} AS base

# VIM
RUN apt-get -y update && apt-get -y install \
      procps\
      socat\
      vim

# Epics auto addr list
ENV EPICS_CA_AUTO_ADDR_LIST YES

# Base procServ port
ENV EPICS_IOC_CAPUTLOG_INET 0.0.0.0
ENV EPICS_IOC_CAPUTLOG_PORT 7012
ENV EPICS_IOC_LOG_INET 0.0.0.0
ENV EPICS_IOC_LOG_PORT 7011
ENV EPICS_CAS_SERVER_PORT 5064

ENV IOC_PROCSERV_SOCK /opt/TCU6IOC/sockets/ioc.sock
ENV PCTRL_SOCK /opt/TCU6IOC/procCtrl/sockets/pCtrl.sock

RUN mkdir -p /opt/TCU6IOC/autosave

WORKDIR /opt/TCU6IOC

COPY ./ioc /opt/TCU6IOC

RUN cd /opt/TCU6IOC/procCtrl && envsubst < configure/RELEASE.tmplt > configure/RELEASE &&\
    cat configure/RELEASE && make distclean && make clean && make -j$(nproc) && mkdir sockets &&\
    \
    cd /opt/TCU6IOC/ && mkdir sockets && envsubst < configure/RELEASE.tmplt > configure/RELEASE &&\
    make -j$(nproc)

ENV NAME RF-TCU6
ENV CMD st.cmd
ENV IOC_PROCSERV_PREFIX PCtrl:${NAME}

ENTRYPOINT [ "/bin/bash", "/opt/TCU6IOC/entrypoint.sh" ]


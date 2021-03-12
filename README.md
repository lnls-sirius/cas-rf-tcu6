# cas-rf-tcu6

TCU6 Temperature Compensating Unit - EPICS IOC

It is important to mount the USB device into `/dev/ttyUSB0`.

| Name                    | Default | Desc                         |
| ----------------------- | ------- | ---------------------------- |
| CMD                     |         | iocBoot cmd file             |
| IOC_PROCSERV_PREFIX     |         | procServControl Prefix       |
| EPICS_IOC_CAPUTLOG_INET | 0.0.0.0 | EPICS Logging Inet (generic) |
| EPICS_IOC_CAPUTLOG_PORT | 7012    | EPICS Logging Port (generic) |
| EPICS_IOC_LOG_INET      | 0.0.0.0 | EPICS Logging Inet (caput)   |
| EPICS_IOC_LOG_PORT      | 7011    | EPICS Logging Port (caput)   |
| EPICS_CAS_SERVER_PORT   | 5064    | EPICS IOC server port        |

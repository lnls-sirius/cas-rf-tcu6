#!../../bin/linux-x86_64/TCU6

< envPaths
< logEnv

cd "${TOP}"

epicsEnvSet("EPICS_CAS_SERVER_PORT","$(EPICS_CAS_SERVER_PORT)")

dbLoadDatabase "dbd/TCU6.dbd"
TCU6_registerRecordDeviceDriver pdbbase
asSetFilename("${TOP}/db/Security.as")

drvAsynSerialPortConfigure("L0", "/dev/ttyUSB0")
asynSetOption("L0", 0, "baud", "115200")

dbLoadRecords("db/TCU6.db","P=$(P),R=,PORT=L0,A=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit

caPutLogInit "$(EPICS_IOC_CAPUTLOG_INET):$(EPICS_IOC_CAPUTLOG_PORT)" 2

#var streamDebug 1

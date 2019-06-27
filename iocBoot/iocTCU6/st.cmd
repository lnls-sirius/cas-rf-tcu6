#!../../bin/linux-x86_64/TCU6

## You may have to change TCU6 to something else
## everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/TCU6.dbd"
TCU6_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("L0", "/dev/ttyUSB0")
asynSetOption("L0", 0, "baud", "115200")

## Load record instances
dbLoadRecords("db/TCU6.db","P=RA-TL:RF-Circulator-BO:,R=,PORT=L0,A=0")

cd "${TOP}/iocBoot/${IOC}"
iocInit

#var streamDebug 1

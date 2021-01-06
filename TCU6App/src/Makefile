TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = TCU6
# TCU6.dbd will be created and installed
DBD += TCU6.dbd

# TCU6.dbd will be made up from these files:
TCU6_DBD += base.dbd

# Include dbd files from all support applications:
TCU6_DBD += calcSupport.dbd
TCU6_DBD += asyn.dbd
TCU6_DBD += stream.dbd
TCU6_DBD += drvAsynSerialPort.dbd
TCU6_DBD += caPutLog.dbd
TCU6_DBD += asSupport.dbd

# Add all the support libraries needed by this IOC
TCU6_LIBS += stream
TCU6_LIBS += asyn
TCU6_LIBS += calc
TCU6_LIBS += caPutLog
TCU6_LIBS += autosave

# TCU6_registerRecordDeviceDriver.cpp derives from TCU6.dbd
TCU6_SRCS += TCU6_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TCU6_SRCS_DEFAULT += TCU6Main.cpp
TCU6_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#TCU6_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
TCU6_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE


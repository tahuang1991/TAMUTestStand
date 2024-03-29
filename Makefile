##
#
# This is the TriDAS/emu/emuDCS/TAMUTestStand Package Makefile
#
##

include $(XDAQ_ROOT)/config/mfAutoconf.rules
include $(XDAQ_ROOT)/config/mfDefs.$(XDAQ_OS)
include $(BUILD_HOME)/emu/rpm_version

# change the optimization level for debugging
#CCFlags = -g -O0 -Wall
#.PHONY: flag_check
#flag_check:
#	@echo "Checking g++ flags:  $(CCFlags)"

# Packages to be built
#
Project=emu
Package=emuDCS/TAMUTestStand
PackageName=TAMUTestStand
Description="TAMU EMU test stand software"


Sources=\
	Version.cc \
	TestUtils.cc \
	CCBCommands.cc \
	TestWorkerBase.cc \
	CCBBackplaneTester.cc \
	TMBExternalTester.cc \
	ResultRegisterSerializer.cc \
	ConfigurablePCrates.cc \
	TMBTestManager.cc \
	CCBBackplaneUtilsModule.cc \
	CCBBackplaneTestModule.cc \
	TMBTestModule.cc \
	TAMUTestApplication.cc \
	FirmwareTester.cc \
	TestResultsManager.cc \
	TestResultsManagerModule.cc \
	BasicTable.cc \
	TestLogger.cc \
	XMLWrapper.cc \
	XMLManager.cc


IncludeDirs = \
	$(XDAQ_ROOT)/include \
	$(BUILD_HOME)/emu/emuDCS/TAMUTestStand/include \
	$(BUILD_HOME)/emu/emuDCS/OnlineDB/include \
	$(BUILD_HOME)/emu/base/include \
	$(BUILD_HOME)/emu/soap/include \
	$(BUILD_HOME)/emu/emuDCS/PeripheralCore/include \
	$(BUILD_HOME)/emu/emuDCS/PeripheralApps/include

TestLibraryDirs = \
	$(XDAQ_ROOT)/lib 

UserCFlags  = 
UserCCFlags = 
UserDynamicLinkFlags = -lboost_regex -lboost_filesystem
UserStaticLinkFlags = 
UserExecutableLinkFlags =

# These libraries can be platform specific and
# potentially need conditional processing
#
Libraries = xerces-c xdaq xdata log4cplus toolbox xoap cgicc xcept xgi peer

TestLibraries = xerces-c xdaq xdata log4cplus toolbox xoap cgicc xcept xgi peer \
                mimetic logxmlappender logudpappender asyncresolv config \
                uuid xalan-c xalanMsg xoapfilter tstoreutils tstoreclient tstore \
                b2innub executive pthttp ptfifo xrelay hyperdaq occi nnz11 clntsh ociei \
                emubase emusoap EmuOnlineDB EmuUtils EmuPeripheralCore EmuPeripheralApps EmuConfigDB

#
# Compile the source files and create a shared library
#
DynamicLibrary= EmuTAMUTestStand
StaticLibrary= 

Executables=
TestExecutables= 
#	testTableDefinitions.cc \

include $(XDAQ_ROOT)/config/Makefile.rules
include $(XDAQ_ROOT)/config/mfRPM.rules

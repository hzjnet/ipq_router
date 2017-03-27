
ifndef CC
   CC = gcc
endif

ifndef BLUETOPIA_PATH
   BLUETOPIA_PATH = ../../../Bluetopia
endif

INCLDDIRS = -I../../include                           \
	    -I../../include/client                    \
	    -I$(BLUETOPIA_PATH)/include               \
	    -I$(BLUETOPIA_PATH)/profiles/GATT/include  \
	    -I$(BLUETOPIA_PATH)/profiles/PBAP/include

ifndef SYSTEMLIBS
   SYSTEMLIBS = -lpthread -lm
endif
	
CFLAGS = -Wall $(DEFS) $(INCLDDIRS) $(GLOBINCLDDIRS) -O2 -fno-strict-aliasing $(GLOBCFLAGS)

LDFLAGS = -L../../lib/client $(GLOBLDFLAGS)

LDLIBS = -lSS1BTPM $(SYSTEMLIBS) $(GLOBLDLIBS)

OBJS = LinuxPBAM_PSE.o Phonebook.o

.PHONY:
all: LinuxPBAM_PSE

LinuxPBAM_PSE: $(OBJS)

.PHONY: clean veryclean realclean
clean veryclean realclean:
	-rm -f *.o
	-rm -f *~
	-rm -f LinuxPBAM_PSE

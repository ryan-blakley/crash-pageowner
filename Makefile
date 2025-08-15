ifeq ($(shell arch), aarch64)
  TARGET=AARCH64
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), ppc64le)
  TARGET=PPC64LE
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), x86_64)
  TARGET=X86_64
  TARGET_CFLAGS=
endif
ifeq ($(shell arch), s390x)
  TARGET=S390X
  TARGET_CFLAGS=
endif

INCDIR=/usr/include/crash

all: page_owner.so

page_owner.so: $(INCDIR)/defs.h page_owner.c 
	gcc $(RPM_OPT_FLAGS) -Wall -I$(INCDIR) -nostartfiles -shared -rdynamic -Wl,-soname,page_owner.so -o page_owner.so page_owner.c -fPIC -D$(TARGET) $(TARGET_CFLAGS)

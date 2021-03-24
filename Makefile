obj-m := acpi_call.o

KVERSION := $(shell uname -r)
KV := 5.12.0-rc3_1+
KDIR := /lib/modules/$(KV)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

load:
	-/sbin/rmmod acpi_call
	/sbin/insmod acpi_call.ko

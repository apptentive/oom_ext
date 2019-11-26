#uncomment to disable tainting and module verification error messages on insmod
#CONFIG_MODULE_SIG=n
obj-m += oom_ext.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules_install

test: test.c
	gcc -o test test.c
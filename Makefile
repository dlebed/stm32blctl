CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar
export CC
export AR

all:
	$(MAKE) -C parsers
	$(CC) -g -o stm32blctl -I./ \
		main.c \
		utils.c \
		stm32.c \
		serial_common.c \
		serial_platform.c \
		parsers/parsers.a \
		stm32/stmreset_binary.c \
		-Wall

clean:
	$(MAKE) -C parsers clean
	rm -f stm32blctl

install: all
	cp stm32blctl /usr/local/bin

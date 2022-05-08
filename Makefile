TARGET 		= xfer

OBJS 		= main.o http.o cpc.o parse.o
INCDIR 		= -I.
CC 		    = gcc
CFLAGS 		= -O2  -W
ifeq ($(OS),Windows_NT)
LDFLAGS 	= -s -Wl
LIBS  		= -lwsock32
RM			= del
else
LDFLAGS 	= -s 
LIBS  		= 
RM			= rm -f
endif
STRIP		= strip


all:		$(TARGET)


$(TARGET): ${OBJS}
	${CC} -o "$@" ${OBJS} ${LDFLAGS} ${LIBS}
	$(STRIP) $(TARGET)
	$(RM) ${OBJS}

%.o : %.c
	${CC} ${CFLAGS} ${INCDIR} -c $< -o $@

clean:
	$(RM) ${OBJS}

distclean: clean
	$(RM) $(TARGET)
	$(RM) $(TARGET).exe


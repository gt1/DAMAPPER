CFLAGS = -O3 -Wall -Wextra -Wno-unused-result -fno-strict-aliasing -DUSE_PRS

ALL = damapper HPC.damapper

all: $(ALL)

damapper: damapper.c map.c map.h align.c align.h DB.c DB.h QV.c QV.h prs_uint64_t_pair.c prs_uint64_t_pair.h prs.ic  prs.ih
	gcc $(CFLAGS) -o damapper damapper.c map.c align.c DB.c QV.c prs_uint64_t_pair.c -lpthread -lm

HPC.damapper: HPC.damapper.c DB.c DB.h QV.c QV.h
	gcc $(CFLAGS) -o HPC.damapper HPC.damapper.c DB.c QV.c -lm

clean:
	rm -f $(ALL)
	rm -fr *.dSYM
	rm -f damapper.tar.gz

install:
	cp $(ALL) ~/bin

package:
	make clean
	tar -zcf damapper.tar.gz README.md LICENSE *.h *.c Makefile

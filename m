From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: XTABLES errors...
Date: Fri, 22 Aug 2008 18:08:26 +0200
Message-ID: <48AEE47A.9030300@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi list!

I have a compile problem...

Jan can you help me?

1. Run ./autogen.sh

fw01:/usr/src/xtables# ./autogen.sh
libtoolize: putting auxiliary files in `.'.
libtoolize: copying file `./ltmain.sh'
libtoolize: You should add the contents of the following files to 
`aclocal.m4':
libtoolize:   `/usr/share/aclocal/libtool.m4'
libtoolize:   `/usr/share/aclocal/ltoptions.m4'
libtoolize:   `/usr/share/aclocal/ltversion.m4'
libtoolize:   `/usr/share/aclocal/ltsugar.m4'
libtoolize:   `/usr/share/aclocal/lt~obsolete.m4'
configure.ac:13: installing `./compile'
configure.ac:15: installing `./config.guess'
configure.ac:15: installing `./config.sub'
configure.ac:10: installing `./install-sh'
configure.ac:11: installing `./missing'
libipq/Makefile.am: installing `./depcomp'

2. Run ./configure

fw01:/usr/src/xtables# ./configure
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of gcc... gcc3
checking whether gcc and cc understand -c and -o together... yes
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
checking the name lister (/usr/bin/nm -B) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for /usr/bin/ld option to reload object files... -r
checking how to recognize dependent libraries... pass_all
checking for ar... ar
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm -B output from gcc object... ok
checking how to run the C preprocessor... gcc -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for dlfcn.h... yes
checking for objdir... .libs
checking if gcc supports -fno-rtti -fno-exceptions... no
checking for gcc option to produce PIC... -fPIC -DPIC
checking if gcc PIC flag -fPIC -DPIC works... yes
checking if gcc static flag -static works... yes
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld) supports shared 
libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
checking linux/dccp.h usability... yes
checking linux/dccp.h presence... yes
checking for linux/dccp.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating extensions/GNUmakefile
config.status: creating libipq/Makefile
config.status: creating include/xtables.h
config.status: creating xtables.pc
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands

3. Run make

fw01:/usr/src/xtables# make
make  all-recursive
make[1]: Entering directory `/usr/src/xtables'
Making all in extensions
make[2]: Entering directory `/usr/src/xtables/extensions'
  GEN      initext4.c
  CC       initext4.o
  AR       libext4.a
  GEN      initext6.c
  CC       initext6.o
  AR       libext6.a
  GEN      matches4.man
  GEN      matches6.man
  GEN      targets4.man
  GEN      targets6.man
  CC       libxt_CLASSIFY.oo
In file included from libxt_CLASSIFY.c:7:
../include/xtables.h:26: error: expected identifier or '(' before '<<' token
../include/xtables.h:28: error: expected identifier or '(' before '==' token
../include/xtables.h:30: error: expected identifier or '(' before '>>' token
../include/xtables.h:146: warning: 'struct xtables_match' declared 
inside parameter list
../include/xtables.h:146: warning: its scope is only this definition or 
declaration, which is probably not what you want
../include/xtables.h:190: warning: 'struct in_addr' declared inside 
parameter list
../include/xtables.h:191: warning: 'struct in_addr' declared inside 
parameter list
../include/xtables.h:192: warning: 'struct in_addr' declared inside 
parameter list
../include/xtables.h:196: warning: 'union nf_inet_addr' declared inside 
parameter list
../include/xtables.h:205: warning: 'union nf_inet_addr' declared inside 
parameter list
make[2]: *** [libxt_CLASSIFY.oo] Error 1
make[2]: Leaving directory `/usr/src/xtables/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/xtables'
make: *** [all] Error 2

I have strange lines in the /usr/src/xtables/include/xtables.h file:


fw01:/usr/src/xtables/include# head -n 30 xtables.h
#ifndef _XTABLES_H
#define _XTABLES_H

#include <sys/socket.h> /* PF_* */
#include <sys/types.h>
#include <stdbool.h>
#include <net/if.h>
#include <linux/types.h>
#include <linux/netfilter/x_tables.h>

#ifndef IPPROTO_SCTP
#define IPPROTO_SCTP 132
#endif
#ifndef IPPROTO_DCCP
#define IPPROTO_DCCP 33
#endif
#ifndef IPPROTO_UDPLITE
#define IPPROTO_UDPLITE 136
#endif

#define XTABLES_VERSION "1.4.2-rc1"
#define XTABLES_VERSION_CODE (0x10000 * 1 + 0x100 * 4 + 2)

#define XTABLES_API_VERSION(x,y,z)    (0x10000*(x) + 0x100*(y) + z)

<<<<<<< HEAD:include/xtables.h.in
union nf_inet_addr;
=======
struct in_addr;
 >>>>>>> d91bd17eccd00fd392fbd89568bc21a605e84ea9:include/xtables.h.in

What is wrong ????


Swifty

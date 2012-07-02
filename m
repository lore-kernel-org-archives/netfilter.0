From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: installation issue with xtable addons
Date: Mon, 2 Jul 2012 12:09:24 +0530
Message-ID: <CAE1WnGc7KNZubC0qEJnpcvLkBTAbErqf2EEqEpyz0xx2rmDYvg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=j4rum3j15+ZHCVjbF+rMlVf8of/S+iv1ZW7b8PqWASU=;
        b=Q5FGJWD3EjCm82nml3IW4JZFxDwbFgzPuLTwlufcyni/soBdwtshVosRxJpAeoLzMN
         dmWvFvQGiv96/8T6/IFs6R1xXqSDuA+TRQlTvGlXZKOXDVWlliJLlJj9VVfs5Q76FQNP
         F4hENS9x+Q97MPDIVz+Fk+T/CkfkanD6akWchRNW37DURCtFeNmeS/XsHAy3PMtgte/c
         IeaVo+Dd69188NtL/MsNit/gVodO3ecw6aZbNtweqxariy9q1d2rpQg1imXtUCWaMG9u
         586gnM+vuT8Bt5qP5ITW8z3Zf+XuR7zxi7A53HF+9ND2vNFXn2EDpQaIbcoMcnTHPki0
         n89Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
I am installing xtables-addons-1.43
I am getting following error
what does this error mean
and please tell me wheather i am cross compiling the correct way or not


./configure --host=powerpc
configure: WARNING: if you wanted to set the --build type, don't use --host.
    If a cross compiler is detected then cross compile mode will be used
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for powerpc-strip... no
checking for strip... strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for powerpc-gcc... no
checking for gcc... gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables...
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of gcc... gcc3
checking whether gcc and cc understand -c and -o together... yes
checking for powerpc-ar... no
checking for powerpc-lib... no
checking for powerpc-link... no
checking for ar... ar
checking the archiver (ar) interface... ar
checking build system type... i686-pc-linux-gnu
checking host system type... powerpc-unknown-none
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for fgrep... /bin/grep -F
checking for ld used by gcc... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)... no
checking for powerpc-dumpbin... no
checking for powerpc-link... no
checking for dumpbin... no
checking for link... link -dump
checking the name lister (nm) interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking how to convert i686-pc-linux-gnu file names to
powerpc-unknown-none format... func_convert_file_noop
checking how to convert i686-pc-linux-gnu file names to toolchain
format... func_convert_file_noop
checking for /usr/bin/ld option to reload object files... -r
checking for powerpc-objdump... no
checking for objdump... objdump
checking how to recognize dependent libraries... unknown
checking for powerpc-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for powerpc-ar... ar
checking for archiver @FILE support... @
checking for powerpc-strip... strip
checking for powerpc-ranlib... no
checking for ranlib... ranlib
checking command to parse nm output from gcc object... ok
checking for sysroot... no
checking for powerpc-mt... no
checking for mt... no
checking if : is a manifest tool... no
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
checking if gcc static flag -static works... no
checking if gcc supports -c -o file.o... yes
checking if gcc supports -c -o file.o... (cached) yes
checking whether the gcc linker (/usr/bin/ld) supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... no
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
checking linux/netfilter/x_tables.h usability... yes
checking linux/netfilter/x_tables.h presence... yes
checking for linux/netfilter/x_tables.h... yes
checking for powerpc-pkg-config... no
checking for pkg-config... /usr/bin/pkg-config
checking pkg-config is at least version 0.9.0... yes
checking for libxtables... no
configure: error: Package requirements (xtables >= 1.4.5) were not met:

No package 'xtables' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables libxtables_CFLAGS
and libxtables_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.


Thanks in advance.

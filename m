From: Petr Pisar <petr.pisar@atlas.cz>
Subject: conntrack can't delete more conntrack records
Date: Mon, 10 Mar 2008 19:49:37 +0000 (UTC)
Message-ID: <slrnftb46h.vkl.petr.pisar@album.ics.muni.cz>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm trying to remove all conntrack records for one source IP address. If
I specify only source IP address it will fail:

$ conntrack -D -s 10.0.0.179
Operation failed: such conntrack doesn't exist

However removing only one specific record using full trasport
source/destinaton address works:

$ conntrack -D -s 10.0.0.179 -d X.23.55.166 -p tcp --sport 4369 --dport 6881

I'm using latest conntrack-tools and dependend libraries
(conntrack-tools-0.9.6.tar.bz2.sig
libnetfilter_conntrack-0.0.89.tar.bz2.sig
libnfnetlink-0.0.33.tar.bz2.sig).

The only problem I met during compilation of conntrack-tools was about
shaddowing of global declaration which I've worked around by removing -Werror
compilar option:

make[1]: Entering directory `/tmp/conntrack-tools-0.9.6/src'
gcc -DPACKAGE_NAME=\"conntrack-tools\" -DPACKAGE_TARNAME=\"conntrack-tools\" -DPACKAGE_VERSION=\"0.9.6\" -DPACKAGE_STRING=\"conntrack-tools\ 0.9.6\" -DPACKAGE_BUGREPORT=\"pablo@netfilter.org\" -DPACKAGE=\"conntrack-tools\" -DVERSION=\"0.9.6\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_DLFCN_H=1 -DYYTEXT_POINTER=1 -DHAVE_LINUX_CAPABILITY_H=1 -DHAVE_LIBNFNETLINK=1 -DHAVE_LIBNETFILTER_CONNTRACK=1 -DHAVE_ARPA_INET_H=1 -DHAVE_INET_PTON=1 -DHAVE_INET_PTON_IPV6=1 -I.  -I../include   -std=gnu99 -W -Wall -Werror -Wmissing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-retur
 n -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstrict-prototypes -Wundef -Wno-unused-parameter -g -O2  -I/usr/local/include   -MT conntrack.o -MD -MP -MF .deps/conntrack.Tpo -c -o conntrack.o conntrack.c
cc1: changing search order for system directory "/usr/local/include"
cc1:   as it has already been specified as a non-system directory
cc1: warnings being treated as errors
In file included from /usr/local/include/libnetfilter_conntrack/libnetfilter_conntrack.h:13,
                 from ../include/conntrack.h:6,
                 from conntrack.c:37:
/usr/local/include/libnfnetlink/libnfnetlink.h:198: warning: declaration of `index' shadows a global declaration
<built-in>:0: warning: shadowed declaration is here
make[1]: *** [conntrack.o] Error 1

(I've met this problem twice.)

So, my question is: Can conntrack remove subset of conntrack table? Is it a bug
or a feature?

-- Petr


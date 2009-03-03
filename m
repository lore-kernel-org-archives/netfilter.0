From: dstorvik <dstorvik@consultech.net>
Subject: conntrack-tools compile error on both 0.9.10 and 0.9.11
Date: Tue, 3 Mar 2009 10:55:36 -0500
Message-ID: <F5E47532014E8E45A339717AF42215342F2B942BC2@hild.consultech.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I'm running Fedora 9 and have installed Libnfnetlink 0.0.40  and libnet=
filter-conntrack 0.0.99

When I try and make either 0.9.10 or 0.9.11 I get compile errors as fol=
lows, can anybody help steer me in the right direction?
Thanks
Derek

Error for 0.9.10

gcc -DPACKAGE_NAME=3D\"conntrack-tools\" -DPACKAGE_TARNAME=3D\"conntrac=
k-tools\" -DPACKAGE_VERSION=3D\"0.9.10\" -DPACKAGE_STRING=3D\"conntrack=
-tools\ 0.9.10\" -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\" -DPACKAG=
E=3D\"conntrack-tools\" -DVERSION=3D\"0.9.10\" -DSTDC_HEADERS=3D1 -DHAV=
E_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRI=
NG_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1=
 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DYYTEXT_PO=
INTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1 -DHAVE_LIBNFNETLINK=3D1 -DHAVE_=
LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_PTON=3D1 =
-DHAVE_INET_PTON_IPV6=3D1 -I.  -I../include   -std=3Dgnu99 -W -Wall -Wm=
issing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -W=
pointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -Wm=
issing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstric=
t-prototypes -Wundef -Wno-unused-parameter -g -O2 -I/usr/local/include =
  -MT mcast.o -MD -MP -MF .deps/mcast.Tpo -c -o mcast.o mcast.c
mcast.c: In function =E2mcast_server_create_multi=E2:
mcast.c:165: error: =E2INT_MAX=E2 undeclared (first use in this functio=
n)
mcast.c:165: error: (Each undeclared identifier is reported only once
mcast.c:165: error: for each function it appears in.)
mcast.c: In function =E2mcast_client_create_multi=E2:
mcast.c:335: error: =E2INT_MAX=E2 undeclared (first use in this functio=
n)
make[1]: *** [mcast.o] Error 1
make[1]: Leaving directory `/root/Download/conntrack-tools-0.9.10/src'
make: *** [all-recursive] Error 1


Error for 0.9.11

make[1]: Entering directory `/root/Download/conntrack-tools-0.9.11/src'
gcc -DPACKAGE_NAME=3D\"conntrack-tools\" -DPACKAGE_TARNAME=3D\"conntrac=
k-tools\" -DPACKAGE_VERSION=3D\"0.9.11\" -DPACKAGE_STRING=3D\"conntrack=
-tools\ 0.9.11\" -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\" -DPACKAG=
E=3D\"conntrack-tools\" -DVERSION=3D\"0.9.11\" -DSTDC_HEADERS=3D1 -DHAV=
E_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRI=
NG_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1=
 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DYYTEXT_PO=
INTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1 -DHAVE_LIBNFNETLINK=3D1 -DHAVE_=
LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_PTON=3D1 =
-DHAVE_INET_PTON_IPV6=3D1 -I.   -I../include  -std=3Dgnu99 -W -Wall -Wm=
issing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -W=
pointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -Wm=
issing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstric=
t-prototypes -Wundef -Wno-unused-parameter -g -O2 -I/usr/local/include =
  -MT mcast.o -MD -MP -MF .deps/mcast.Tpo -c -o mcast.o mcast.c
mcast.c: In function =E2mcast_server_create_multi=E2:
mcast.c:158: error: =E2INT_MAX=E2 undeclared (first use in this functio=
n)
mcast.c:158: error: (Each undeclared identifier is reported only once
mcast.c:158: error: for each function it appears in.)
mcast.c: In function =E2mcast_client_create_multi=E2:
mcast.c:321: error: =E2INT_MAX=E2 undeclared (first use in this functio=
n)
make[1]: *** [mcast.o] Error 1
make[1]: Leaving directory `/root/Download/conntrack-tools-0.9.11/src'
make: *** [all-recursive] Error 1






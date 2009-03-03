From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools compile error on both 0.9.10 and 0.9.11
Date: Tue, 03 Mar 2009 17:03:05 +0100
Message-ID: <49AD54B9.1080503@netfilter.org>
References: <F5E47532014E8E45A339717AF42215342F2B942BC2@hild.consultech.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F5E47532014E8E45A339717AF42215342F2B942BC2@hild.consultech.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: dstorvik <dstorvik@consultech.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

dstorvik wrote:
> I'm running Fedora 9 and have installed Libnfnetlink 0.0.40  and libn=
etfilter-conntrack 0.0.99
>=20
> When I try and make either 0.9.10 or 0.9.11 I get compile errors as f=
ollows, can anybody help steer me in the right direction?
> Thanks
> Derek
>=20
> Error for 0.9.10
>=20
> gcc -DPACKAGE_NAME=3D\"conntrack-tools\" -DPACKAGE_TARNAME=3D\"conntr=
ack-tools\" -DPACKAGE_VERSION=3D\"0.9.10\" -DPACKAGE_STRING=3D\"conntra=
ck-tools\ 0.9.10\" -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\" -DPACK=
AGE=3D\"conntrack-tools\" -DVERSION=3D\"0.9.10\" -DSTDC_HEADERS=3D1 -DH=
AVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_ST=
RING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D=
1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DYYTEXT_P=
OINTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1 -DHAVE_LIBNFNETLINK=3D1 -DHAVE=
_LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_PTON=3D1=
 -DHAVE_INET_PTON_IPV6=3D1 -I.  -I../include   -std=3Dgnu99 -W -Wall -W=
missing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -=
Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -W=
missing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstri=
ct-prototypes -Wundef -Wno-unused-parameter -g -O2 -I/usr/local/include=
   -MT mcast.o -MD -MP -MF .deps/mcast.Tpo -c -
o mcast.o mcast.c
> mcast.c: In function =E2mcast_server_create_multi=E2:
> mcast.c:165: error: =E2INT_MAX=E2 undeclared (first use in this funct=
ion)
> mcast.c:165: error: (Each undeclared identifier is reported only once
> mcast.c:165: error: for each function it appears in.)
> mcast.c: In function =E2mcast_client_create_multi=E2:
> mcast.c:335: error: =E2INT_MAX=E2 undeclared (first use in this funct=
ion)
> make[1]: *** [mcast.o] Error 1
> make[1]: Leaving directory `/root/Download/conntrack-tools-0.9.10/src=
'
> make: *** [all-recursive] Error 1
>=20
>=20
> Error for 0.9.11
>=20
> make[1]: Entering directory `/root/Download/conntrack-tools-0.9.11/sr=
c'
> gcc -DPACKAGE_NAME=3D\"conntrack-tools\" -DPACKAGE_TARNAME=3D\"conntr=
ack-tools\" -DPACKAGE_VERSION=3D\"0.9.11\" -DPACKAGE_STRING=3D\"conntra=
ck-tools\ 0.9.11\" -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\" -DPACK=
AGE=3D\"conntrack-tools\" -DVERSION=3D\"0.9.11\" -DSTDC_HEADERS=3D1 -DH=
AVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_ST=
RING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D=
1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DYYTEXT_P=
OINTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1 -DHAVE_LIBNFNETLINK=3D1 -DHAVE=
_LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_PTON=3D1=
 -DHAVE_INET_PTON_IPV6=3D1 -I.   -I../include  -std=3Dgnu99 -W -Wall -W=
missing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshadow -=
Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return -W=
missing-declarations -Wredundant-decls -Wnested-externs -Winline -Wstri=
ct-prototypes -Wundef -Wno-unused-parameter -g -O2 -I/usr/local/include=
   -MT mcast.o -MD -MP -MF .deps/mcast.Tpo -c -
o mcast.o mcast.c
> mcast.c: In function =E2mcast_server_create_multi=E2:
> mcast.c:158: error: =E2INT_MAX=E2 undeclared (first use in this funct=
ion)
> mcast.c:158: error: (Each undeclared identifier is reported only once
> mcast.c:158: error: for each function it appears in.)
> mcast.c: In function =E2mcast_client_create_multi=E2:
> mcast.c:321: error: =E2INT_MAX=E2 undeclared (first use in this funct=
ion)
> make[1]: *** [mcast.o] Error 1
> make[1]: Leaving directory `/root/Download/conntrack-tools-0.9.11/src=
'
> make: *** [all-recursive] Error 1

This is fixed in netfilter's git tree, please apply this patch:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=3Dconntrack-tools.git;a=3D=
commitdiff_plain;h=3D9bf002ff7935e7dff625683787fc3a06ac2ef2cb;hp=3D87c8=
c090e1b64eac27edb968845cb1e8ee65b06b

--=20
"Los honestos son inadaptados sociales" -- Les Luthiers

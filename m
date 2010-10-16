From: Italo Valcy <italo@dcc.ufba.br>
Subject: Gcc error trying to use nf_conntrack->id (dereferencing pointer to
 incomplete type)
Date: Sat, 16 Oct 2010 16:19:43 -0300
Message-ID: <4CB9FACF.7060407@dcc.ufba.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi guys,

I'm trying to use 'id' field of nf_conntrack struct but I'm getting the
following error: "dereferencing pointer to incomplete type".

=46or example, I've tried to modify conntrack-0.9.6 to print this 'id'
field when "Display a real-time event log":

- ------------------
diff --git a/conntrack-0.9.6/src/conntrack.c
b/conntrack-0.9.6/src/conntrack.c
index 82ff544..8b74564 100644
- --- a/conntrack.c
+++ b/conntrack.c
@@ -603,7 +603,7 @@ static int event_cb(enum nf_conntrack_msg_type type=
,
        }

        nfct_snprintf(buf, 1024, ct, type, output_type, output_flags);
- -       printf("%s\n", buf);
+       printf("%s id=3D%u\n", buf, ct->id);
        fflush(stdout);

        return NFCT_CB_CONTINUE;
- ------------------

And tried to compile with gcc 4.3:

- -------------------------
gcc -DPACKAGE_NAME=3D\"conntrack-tools\"
- -DPACKAGE_TARNAME=3D\"conntrack-tools\" -DPACKAGE_VERSION=3D\"0.9.6\"
- -DPACKAGE_STRING=3D\"conntrack-tools\ 0.9.6\"
- -DPACKAGE_BUGREPORT=3D\"pablo@netfilter.org\"
- -DPACKAGE=3D\"conntrack-tools\" -DVERSION=3D\"0.9.6\" -DSTDC_HEADERS=3D=
1
- -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1
- -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1
- -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_=
DLFCN_H=3D1
- -DYYTEXT_POINTER=3D1 -DHAVE_LINUX_CAPABILITY_H=3D1 -DHAVE_LIBNFNETLIN=
K=3D1
- -DHAVE_LIBNETFILTER_CONNTRACK=3D1 -DHAVE_ARPA_INET_H=3D1 -DHAVE_INET_=
PTON=3D1
- -DHAVE_INET_PTON_IPV6=3D1 -I.  -I../include   -std=3Dgnu99 -W -Wall -=
Werror
- -Wmissing-prototypes -Wwrite-strings -Wcast-qual -Wfloat-equal -Wshad=
ow
- -Wpointer-arith -Wbad-function-cast -Wsign-compare -Waggregate-return
- -Wmissing-declarations -Wredundant-decls -Wnested-externs -Winline
- -Wstrict-prototypes -Wundef -Wno-unused-parameter -g -O2   -MT
conntrack.o -MD -MP -MF .deps/conntrack.Tpo -c -o conntrack.o conntrack=
=2Ec
conntrack.c: In function =91event_cb=92:
conntrack.c:606: error: dereferencing pointer to incomplete type
make: ** [conntrack.o] Erro 1
- -------------------------

My gcc version:

~$ gcc --version
gcc (Debian 4.3.2-1.1) 4.3.2
Copyright (C) 2008 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is=
 NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.


Please, any ideas about what I'm doing wrong?

Thanks for any help!


- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAky5+s8ACgkQfidLqjN6RNHnsQCfVXWpecEHf07HJItjye4tNFyB
RXcAoJuxpwsrlpy3EbaFrm7VjIgl5myu
=3DsPwU
-----END PGP SIGNATURE-----

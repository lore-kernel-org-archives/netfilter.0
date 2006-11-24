From: Alan Ezust <alan.ezust@presinet.com>
Subject: segfault in nfct_conntrack_compare() at libnetfilter_conntrack.c:933
Date: Fri, 24 Nov 2006 14:25:35 -0800
Message-ID: <200611241425.39630.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart582207183.KIRgrtZTzi";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart582207183.KIRgrtZTzi
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


I'm using ../libnetfilter_conntrack-0.0.31, conntrack 1.00beta2, and=20
libnfnetlink(svn). Building against kernel 2.6.16.29.

=46or some reason, I'm getting a segfault in nfct_conntrack_compare. It see=
ms as=20
if the memory pointed to by ct1 is invalid, the first time that the compare=
=20
is called. Has anyone else seen this?=20

This happens (the segfault) when I do conntrack -L or conntrack -E (After t=
he=20
first event has arrived).=20

(gdb) [ezust@pocky] /home/ezust/presinet/projects/conntrack-vanilla> sudo g=
db
GNU gdb 6.5-debian
Copyright (C) 2006 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain condition=
s.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i486-linux-gnu".
Using host libthread_db library "/lib/tls/libthread_db.so.1".
Breakpoint 1 at 0x804a0ad: file conntrack.c, line 606.
main (argc=3D2, argv=3D0xbfeb7424) at conntrack.c:606
606         unsigned int command =3D 0, options =3D 0;

Program received signal SIGSEGV, Segmentation fault.
0xb7f85731 in nfct_conntrack_compare (ct1=3D0x15f24, ct2=3D0xbfeb5138,=20
cmp=3D0xb7fb8ff4) at libnetfilter_conntrack.c:933
933             int cop1 =3D ct1->tuple[NFCT_DIR_ORIGINAL].protonum;
(gdb) list
928                     if (l3proto && !l3proto->compare(ct1, ct2, l3flags))
929                             return 0;
930             }
931
932             if (l4flags) {
933             int cop1 =3D ct1->tuple[NFCT_DIR_ORIGINAL].protonum;
934             int cop2 =3D ct2->tuple[NFCT_DIR_ORIGINAL].protonum;
935                     if (cop1 !=3D 0 &&  cop2 !=3D 0 && cop1 !=3D cop2)
936                 return 0;
937             int crp1 =3D ct1->tuple[NFCT_DIR_REPLY].protonum;
(gdb) ct1
Undefined command: "ct1".  Try "help".
(gdb) p ct1
$1 =3D (struct nfct_conntrack *) 0x15f24
(gdb) p *ct1
Cannot access memory at address 0x15f24
(gdb) p ct1
$2 =3D (struct nfct_conntrack *) 0x15f24
(gdb) p ct2
$3 =3D (struct nfct_conntrack *) 0xbfeb5138
(gdb) p *ct2
$4 =3D {tuple =3D {{src =3D {v4 =3D 520161802, v6 =3D {520161802, 0, 0, 0}}=
, dst =3D {v4 =3D=20
4278258186, v6 =3D {4278258186, 0, 0, 0}}, l3protonum =3D 2 '\002', protonu=
m =3D=20
17 '\021',
      l4src =3D {all =3D 35328, tcp =3D {port =3D 35328}, udp =3D {port =3D=
 35328}, icmp =3D=20
{type =3D 0 '\0', code =3D 138 '\212', id =3D 0}, sctp =3D {port =3D 35328}=
}, l4dst =3D {
        all =3D 35328, tcp =3D {port =3D 35328}, udp =3D {port =3D 35328}, =
icmp =3D {type=20
=3D 0 '\0', code =3D 138 '\212', id =3D 0}, sctp =3D {port =3D 35328}}}, {s=
rc =3D {v4 =3D=20
4278258186,
        v6 =3D {4278258186, 0, 0, 0}}, dst =3D {v4 =3D 520161802, v6 =3D {5=
20161802,=20
0, 0, 0}}, l3protonum =3D 2 '\002', protonum =3D 17 '\021', l4src =3D {all =
=3D 35328,=20
tcp =3D {
          port =3D 35328}, udp =3D {port =3D 35328}, icmp =3D {type =3D 0 '=
\0', code =3D=20
138 '\212', id =3D 0}, sctp =3D {port =3D 35328}}, l4dst =3D {all =3D 35328=
, tcp =3D=20
{port =3D 35328},
        udp =3D {port =3D 35328}, icmp =3D {type =3D 0 '\0', code =3D 138 '=
\212', id =3D=20
0}, sctp =3D {port =3D 35328}}}}, timeout =3D 21, mark =3D 0, status =3D 8,=
 use =3D 1, id=20
=3D 354,
  protoinfo =3D {tcp =3D {state =3D 0 '\0'}}, counters =3D {{packets =3D 1,=
 bytes =3D=20
257}, {packets =3D 0, bytes =3D 0}}, nat =3D {min_ip =3D 0, max_ip =3D 0, l=
4min =3D {all=20
=3D 0, tcp =3D {
        port =3D 0}, udp =3D {port =3D 0}, icmp =3D {type =3D 0 '\0', code =
=3D 0 '\0', id=20
=3D 0}, sctp =3D {port =3D 0}}, l4max =3D {all =3D 0, tcp =3D {port =3D 0},=
 udp =3D {port =3D=20
0}, icmp =3D {
        type =3D 0 '\0', code =3D 0 '\0', id =3D 0}, sctp =3D {port =3D 0}}=
}}
(gdb) p *ct1
Cannot access memory at address 0x15f24
(gdb) where
#0  0xb7f85731 in nfct_conntrack_compare (ct1=3D0x15f24, ct2=3D0xbfeb5138,=
=20
cmp=3D0xb7fb8ff4) at libnetfilter_conntrack.c:933
#1  0xb7f84ebd in nfct_default_conntrack_display (arg=3D0xbfeb5138, flags=
=3D253,=20
type=3D2, data=3D0xb7fb8ff4) at libnetfilter_conntrack.c:721
#2  0xb7f8492f in nfct_conntrack_netlink_handler (cth=3D0x804e148,=20
nlh=3D0xbfeb526c, arg=3D0x0) at libnetfilter_conntrack.c:579
#3  0xb7f8355c in callback_handler (nladdr=3D0xbfeb726c, n=3D0xbfeb526c,=20
arg=3D0x804e148) at libnetfilter_conntrack.c:75
#4  0xb7e48734 in nfnl_listen (nfnlh=3D0x804e008, handler=3D0xb7f834b4=20
<callback_handler>, jarg=3D0x804e148) at libnfnetlink.c:491
#5  0xb7f8601a in __nfct_dump_conntrack_table (cth=3D0x804e148, zero=3D0,=20
family=3D2) at libnetfilter_conntrack.c:1110
#6  0xb7f86047 in nfct_dump_conntrack_table (cth=3D0x804e148, family=3D2) a=
t=20
libnetfilter_conntrack.c:1115
#7  0x0804adc3 in main (argc=3D2, argv=3D0xbfeb7424) at conntrack.c:882

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart582207183.KIRgrtZTzi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFZ3FjsJbtw6GURksRAneyAJsGsAwJlzMvvD5hkuGtx+5B9cvhxgCgoKzx
l0mPQ4tNE0e+z8nr8U8Rf20=
=on4V
-----END PGP SIGNATURE-----

--nextPart582207183.KIRgrtZTzi--


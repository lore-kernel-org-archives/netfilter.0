From: "Jeremy" <jeremy@paradise.net.nz>
Subject: PPTP Conntrack pom patch. compile issues.
Date: Wed, 25 Jun 2003 10:02:20 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03a101c33a9c$490d8d80$3964a8c0@comsol.co.nz>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_039E_01C33B00.DE20DBC0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_039E_01C33B00.DE20DBC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there,=20

I run a debian box, and have tried compiling on 2.4.20 & 2.4.21 kernels =
after applying this patch with the same errors. Could someone shed some =
light on this please, im getting very frustrated!! :o) Thanks

p.s. i dont run any debugging of netfilter stuff in the kernel

Compile Errors are as follows:
NAME=3Dip_conntrack_proto_gre  -DEXPORT_SYMTAB -c =
ip_conntrack_proto_gre.c
ip_conntrack_proto_gre.c: In function `ip_ct_gre_keymap_add':
ip_conntrack_proto_gre.c:118: union has no member named `gre'
ip_conntrack_proto_gre.c:120: union has no member named `gre'
ip_conntrack_proto_gre.c: In function `ip_ct_gre_keymap_destroy':
ip_conntrack_proto_gre.c:148: union has no member named `gre'
ip_conntrack_proto_gre.c:150: union has no member named `gre'
ip_conntrack_proto_gre.c:151: union has no member named `gre'
ip_conntrack_proto_gre.c:152: union has no member named `gre'
ip_conntrack_proto_gre.c:154: union has no member named `gre'
ip_conntrack_proto_gre.c:156: union has no member named `gre'
ip_conntrack_proto_gre.c:157: union has no member named `gre'
ip_conntrack_proto_gre.c:158: union has no member named `gre'
ip_conntrack_proto_gre.c: In function `gre_print_conntrack':
ip_conntrack_proto_gre.c:242: union has no member named `gre'
ip_conntrack_proto_gre.c:243: union has no member named `gre'
ip_conntrack_proto_gre.c: In function `gre_packet':
ip_conntrack_proto_gre.c:254: union has no member named `gre'
ip_conntrack_proto_gre.c:258: union has no member named `gre'
ip_conntrack_proto_gre.c: In function `gre_new':
ip_conntrack_proto_gre.c:272: union has no member named `gre'
ip_conntrack_proto_gre.c:273: union has no member named `gre'
make[3]: *** [ip_conntrack_proto_gre.o] Error 1
make[3]: Leaving directory =
`/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory =
`/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter'
make[1]: *** [_subdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/TEMP/linux-2.4.21/net'
make: *** [_dir_net] Error 2



------=_NextPart_000_039E_01C33B00.DE20DBC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi there, </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I run a debian box, and have tried =
compiling on=20
2.4.20 &amp; 2.4.21 kernels after applying this patch with the same =
errors.=20
Could someone shed some light on this please, im getting very =
frustrated!! :o)=20
Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>p.s. i dont run any debugging of =
netfilter stuff in=20
the kernel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Compile Errors are as =
follows:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>NAME=3Dip_conntrack_proto_gre&nbsp; =
-DEXPORT_SYMTAB=20
-c ip_conntrack_proto_gre.c<BR>ip_conntrack_proto_gre.c: In function=20
`ip_ct_gre_keymap_add':<BR>ip_conntrack_proto_gre.c:118: union has no =
member=20
named `gre'<BR>ip_conntrack_proto_gre.c:120: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c: In function=20
`ip_ct_gre_keymap_destroy':<BR>ip_conntrack_proto_gre.c:148: union has =
no member=20
named `gre'<BR>ip_conntrack_proto_gre.c:150: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:151: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:152: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:154: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:156: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:157: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:158: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c: In function=20
`gre_print_conntrack':<BR>ip_conntrack_proto_gre.c:242: union has no =
member=20
named `gre'<BR>ip_conntrack_proto_gre.c:243: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c: In function=20
`gre_packet':<BR>ip_conntrack_proto_gre.c:254: union has no member named =

`gre'<BR>ip_conntrack_proto_gre.c:258: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c: In function=20
`gre_new':<BR>ip_conntrack_proto_gre.c:272: union has no member named=20
`gre'<BR>ip_conntrack_proto_gre.c:273: union has no member named=20
`gre'<BR>make[3]: *** [ip_conntrack_proto_gre.o] Error 1<BR>make[3]: =
Leaving=20
directory =
`/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter'<BR>make[2]: ***=20
[first_rule] Error 2<BR>make[2]: Leaving directory=20
`/usr/src/linux/TEMP/linux-2.4.21/net/ipv4/netfilter'<BR>make[1]: ***=20
[_subdir_ipv4/netfilter] Error 2<BR>make[1]: Leaving directory=20
`/usr/src/linux/TEMP/linux-2.4.21/net'<BR>make: *** [_dir_net] Error=20
2<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_039E_01C33B00.DE20DBC0--



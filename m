From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: Can't install iptables 1.2.7a   AND:   RE: [PATCH] conntracker/nat helper for Microsoft Media Services
Date: Fri, 11 Oct 2002 00:16:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F74@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C270AA.9E8C4FFA"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Martin Josefsson <gandalf@wlug.westbo.se>, Rickard Eriksson <riceri@home.se>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C270AA.9E8C4FFA
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C270AA.9E8C4FFA"


------_=_NextPart_002_01C270AA.9E8C4FFA
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Martin Josefsson [mailto:gandalf@wlug.westbo.se] wrote:
>Hi,
>
>I just committed a small change to cvs.
>http://cvs.netfilter.org/cgi-bin/cvsweb/netfilter/patch-o-matic/extra/mm=
s-conntrack-nat.patch?r1=3D1.2&r2=3D1.3&f=3Du
>
>Without this change nfnetlink-stuff won't compile in userspace, all
>other helpers have been changed over to this format.
>

Martin,

Thanks for this fix!

Rickard,=20

Martin's fix solves the problem you experienced (see mail below - the=20
compile error is due to a mistake of mine in the mms conntracker, fixed =
by=20
Martin).

The attached patch is the same thing but diffed against a kerneltree,
so you don't have to run patch-o-matic again: You can apply it with:

cd /path/to/kernel/linux-2.4.19
patch -p1 < /path/to/fix_ip_conntrack_mms.h.patch

and then retry the compilation of the iptables userspace program.

Sorry for the inconvenience,
Filip



-----Original Message-----
From:	Rickard Eriksson [mailto:riceri@home.se]
Sent:	do 10/10/2002 21:28
To:	netfilter@lists.netfilter.org
Cc:=09
Subject:	Can't install iptables 1.2.7a
I can't install iptables 1.2.7a

When i try to install i get this:

# make KERNEL_DIR=3D/usr/src/linux-2.4.19
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.19/include -Iinclude/=20
-DIPTABLES_VERSION=3D\"1.2.7a\"  -fPIC -o =
extensions/libipt_conntrack_sh.o=20
-c extensions/libipt_conntrack.c
In file included from=20
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack.h:65,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack_mms.h:6:2=
:=20
#error Only in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1


anyone that can help me?









------_=_NextPart_002_01C270AA.9E8C4FFA
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: Can't install iptables 1.2.7a   AND:   RE: [PATCH] =
conntracker/nat helper for Microsoft Media Services</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Martin Josefsson [<A =
HREF=3D"mailto:gandalf@wlug.westbo.se">mailto:gandalf@wlug.westbo.se</A>]=
 wrote:<BR>
&gt;Hi,<BR>
&gt;<BR>
&gt;I just committed a small change to cvs.<BR>
&gt;<A =
HREF=3D"http://cvs.netfilter.org/cgi-bin/cvsweb/netfilter/patch-o-matic/e=
xtra/mms-conntrack-nat.patch?r1=3D1.2&r2=3D1.3&f=3Du">http://cvs.netfilte=
r.org/cgi-bin/cvsweb/netfilter/patch-o-matic/extra/mms-conntrack-nat.patc=
h?r1=3D1.2&r2=3D1.3&f=3Du</A><BR>
&gt;<BR>
&gt;Without this change nfnetlink-stuff won't compile in userspace, =
all<BR>
&gt;other helpers have been changed over to this format.<BR>
&gt;<BR>
<BR>
Martin,<BR>
<BR>
Thanks for this fix!<BR>
<BR>
Rickard,<BR>
<BR>
Martin's fix solves the problem you experienced (see mail below - =
the<BR>
compile error is due to a mistake of mine in the mms conntracker, fixed =
by<BR>
Martin).<BR>
<BR>
The attached patch is the same thing but diffed against a =
kerneltree,<BR>
so you don't have to run patch-o-matic again: You can apply it with:<BR>
<BR>
cd /path/to/kernel/linux-2.4.19<BR>
patch -p1 &lt; /path/to/fix_ip_conntrack_mms.h.patch<BR>
<BR>
and then retry the compilation of the iptables userspace program.<BR>
<BR>
Sorry for the inconvenience,<BR>
Filip<BR>
<BR>
<BR>
<BR>
-----Original Message-----<BR>
From:&nbsp;&nbsp; Rickard Eriksson [<A =
HREF=3D"mailto:riceri@home.se">mailto:riceri@home.se</A>]<BR>
Sent:&nbsp;&nbsp; do 10/10/2002 21:28<BR>
To:&nbsp;&nbsp;&nbsp;&nbsp; netfilter@lists.netfilter.org<BR>
Cc:&nbsp;&nbsp;&nbsp;&nbsp;<BR>
Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can't install =
iptables 1.2.7a<BR>
I can't install iptables 1.2.7a<BR>
<BR>
When i try to install i get this:<BR>
<BR>
# make KERNEL_DIR=3D/usr/src/linux-2.4.19<BR>
Extensions found:<BR>
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.19/include -Iinclude/<BR>
-DIPTABLES_VERSION=3D\&quot;1.2.7a\&quot;&nbsp; -fPIC -o =
extensions/libipt_conntrack_sh.o<BR>
-c extensions/libipt_conntrack.c<BR>
In file included from<BR>
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack.h:65,<BR>=

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; from extensions/libipt_conntrack.c:12:<BR>
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/ip_conntrack_mms.h:6:2=
:<BR>
#error Only in kernel.<BR>
make: *** [extensions/libipt_conntrack_sh.o] Error 1<BR>
<BR>
<BR>
anyone that can help me?<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_002_01C270AA.9E8C4FFA--

------_=_NextPart_001_01C270AA.9E8C4FFA
Content-Type: application/octet-stream;
	name="fix_ip_conntrack_mms.h.patch"
Content-Transfer-Encoding: base64
Content-Description: fix_ip_conntrack_mms.h.patch
Content-Disposition: attachment;
	filename="fix_ip_conntrack_mms.h.patch"

ZGlmZiAtdXJOIC1YIGRvbnRkaWZmIGxpbnV4LTIuNC4yMC1wcmU1LW1tcy1vbGQvaW5jbHVkZS9s
aW51eC9uZXRmaWx0ZXJfaXB2NC9pcF9jb25udHJhY2tfbW1zLmggbGludXgtMi40LjIwLXByZTUt
bW1zL2luY2x1ZGUvbGludXgvbmV0ZmlsdGVyX2lwdjQvaXBfY29ubnRyYWNrX21tcy5oCi0tLSBs
aW51eC0yLjQuMjAtcHJlNS1tbXMtb2xkL2luY2x1ZGUvbGludXgvbmV0ZmlsdGVyX2lwdjQvaXBf
Y29ubnRyYWNrX21tcy5oCTIwMDItMDktMTYgMDE6MTg6MjQuMDAwMDAwMDAwICswMjAwCisrKyBs
aW51eC0yLjQuMjAtcHJlNS1tbXMvaW5jbHVkZS9saW51eC9uZXRmaWx0ZXJfaXB2NC9pcF9jb25u
dHJhY2tfbW1zLmgJMjAwMi0xMC0xMSAwMDozOTowNy4wMDAwMDAwMDAgKzAyMDAKQEAgLTIsMTAg
KzIsNyBAQAogI2RlZmluZSBfSVBfQ09OTlRSQUNLX01NU19ICiAvKiBNTVMgdHJhY2tpbmcuICov
CiAKLSNpZm5kZWYgX19LRVJORUxfXwotI2Vycm9yIE9ubHkgaW4ga2VybmVsLgotI2VuZGlmCi0K
KyNpZmRlZiBfX0tFUk5FTF9fCiAjaW5jbHVkZSA8bGludXgvbmV0ZmlsdGVyX2lwdjQvbG9ja2hl
bHAuaD4KIAogREVDTEFSRV9MT0NLX0VYVEVSTihpcF9tbXNfbG9jayk7CkBAIC0xOCw2ICsxNSw3
IEBACiAjZGVmaW5lIE1NU19TUlZfQ0hVTktMRU5MVl9PRkZTRVQgICAgICAgIDE2CiAjZGVmaW5l
IE1NU19TUlZfQ0hVTktMRU5MTV9PRkZTRVQgICAgICAgIDMyCiAjZGVmaW5lIE1NU19TUlZfTUVT
U0FHRUxFTkdUSF9PRkZTRVQgICAgIDgKKyNlbmRpZgogCiAvKiBUaGlzIHN0cnVjdHVyZSBpcyBw
ZXIgZXhwZWN0ZWQgY29ubmVjdGlvbiAqLwogc3RydWN0IGlwX2N0X21tc19leHBlY3Qgewo=

------_=_NextPart_001_01C270AA.9E8C4FFA--


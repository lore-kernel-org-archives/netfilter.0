From: "Rohit Neupane" <bikrant@wlink.com.np>
Subject: Bug in INPUT mangle table?
Date: Wed, 2 Apr 2003 15:49:06 +0545
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c2f8ff$32eb8540$a8244fca@bharat>
Mime-Version: 1.0
Content-Type: multipart/alternative;	boundary="----=_NextPart_000_002F_01C2F92F.644E2FE0"
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

------=_NextPart_000_002F_01C2F92F.644E2FE0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
    I don't know if this is a bug in  iptables or in my implementation. =
The problem is, if I add a single entry in mangle table in INPUT chain =
I'm not able to ping the host from anywhere!
I've hundreds of rules in FORWARD mangle table, which I've been using =
for shaping traffice to my clients  and it is working fine. I tried it =
another pc,  though running the same version of iptables, but the result =
is same. I can't ping the pc from anywhere once a single rule is added =
to INPUT manlge table. But once the INPUT mangle table is flushed I can =
ping it. The problem is ony with ICMP packets because I'm still able to =
connect to the pc using ssh!

I'm using :
iptables v1.2.6a
Kernel : 2.4.20  with HTB 3.6-020525 Patch applied
Distribution : Red Hat Linux 8.0


thanks a lot,
Rohit Neupane

------=_NextPart_000_002F_01C2F92F.644E2FE0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I don't know if this =
is a bug=20
in&nbsp; iptables or in my implementation. The problem is, if I add a =
single=20
entry in&nbsp;mangle table in INPUT chain&nbsp;I'm not able to ping the =
host=20
from anywhere!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I've hundreds of rules in FORWARD =
mangle table,=20
which I've been using for shaping traffice to my clients&nbsp; and it is =
working=20
fine. I tried it another pc,&nbsp; though running the same version of =
iptables,=20
but the result is same. I can't ping the pc from anywhere once a single =
rule is=20
added to INPUT manlge table. But once the INPUT mangle table is flushed =
I can=20
ping it. The problem is ony with ICMP packets because I'm still able to =
connect=20
to the pc using ssh!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm using :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables v1.2.6a</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Kernel : 2.4.20&nbsp; with =
HTB&nbsp;3.6-020525=20
Patch applied</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Distribution : Red Hat Linux =
8.0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks a lot,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Rohit =
Neupane</FONT></DIV></BODY></HTML>

------=_NextPart_000_002F_01C2F92F.644E2FE0--




From: "Rasmus Aveskogh" <rasmus.aveskogh@utfors.se>
Subject: Problems with arbitrary TOS-field settings.
Date: Thu, 19 Dec 2002 18:15:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2a782$3a8c8570$a10214ac@SE.INTRA>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C2A78A.9B295D60"
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
Cc: erland.almstrom@utfors.se

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C2A78A.9B295D60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi.

I'm having some trouble setting the TOS-field in the IP header _to an =
arbitrary value_
using iptables.
To manage to do this I first patched iptables (1.2.5) and my kernel =
(2.4.18-3) with=20
the patches for FTOS. I recompiled and reinstalled but ended up with:

# iptables -t mangle -A OUTPUT -j FTOS --set-ftos 128
iptables: No chain/target/match by that name

"Ok? Well I might as well upgrade to latest iptables and latest =
kernel-patches"

Though and done, iptables 1.2.7a installed and all the =
"patch-o-matic"-patches
installed. According to the documentation the TOS/FTOS-features was now =
obsolete
in favor of the DSCP option. So I tried again:

# iptables -t mangle -A OUTPUT -j DSCP --set-dscp 128
iptables: No chain/target/match by that name

Well, it says somewhere that only values up to 0x4f was supported
by DSCP, but a lower values doesn't affect the error.

FTOS still seems to be part of the cose though, but same error occurs.

What can I do to fix this? And even if DSCP works, how can I set the 8 =
IP-header
TOS-bits to a value between 0x00 and 0xff?

Thanks in advance
Rasmus Aveskogh - Utfors AB

------=_NextPart_000_0005_01C2A78A.9B295D60
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm having some trouble setting the =
TOS-field in=20
the IP header _to an arbitrary value_</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>using iptables.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>To manage to do this I first patched =
iptables=20
(1.2.5) and my kernel (2.4.18-3) with </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the patches for FTOS. I recompiled and =
reinstalled=20
but ended up with:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># iptables -t mangle -A OUTPUT -j FTOS =
--set-ftos=20
128</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables: No chain/target/match by that =

name</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>"Ok? Well I might as well upgrade to =
latest=20
iptables and latest kernel-patches"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Though and done, iptables 1.2.7a =
installed and all=20
the "patch-o-matic"-patches</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>installed. According to the =
documentation the=20
TOS/FTOS-features was now obsolete</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>in favor of the DSCP option. So I tried =

again:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2># iptables -t mangle -A OUTPUT =
-j&nbsp;DSCP=20
--set-dscp 128</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables: No chain/target/match by that =

name</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Well, it says somewhere that only values up to 0x4f was =
supported</DIV>
<DIV>by DSCP, but a lower values doesn't affect the error.</DIV>
<DIV>&nbsp;</DIV>
<DIV>FTOS still seems to be part of the cose though, but same error=20
occurs.</DIV>
<DIV>&nbsp;</DIV>
<DIV>What can I do to fix this? And even if DSCP works, how can I set =
the 8=20
IP-header</DIV>
<DIV>TOS-bits to a value between 0x00 and 0xff?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance</DIV>
<DIV>Rasmus Aveskogh - Utfors AB</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C2A78A.9B295D60--



From: "Calvin" <calvinproject@ihug.com.au>
Subject: why packet get through the netfilter even if i drop all in FORWARD
Date: Sun, 8 Jun 2003 16:07:11 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c32d84$34f4fe70$95dc6f89@wonderland>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C32DD8.04DB4290"
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
To: netfilter-devel-request@lists.netfilter.org, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_001B_01C32DD8.04DB4290
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Dear all,

I got a funny problem here and got no idea why it happen.
my simple network is
A
 |(eth0)
GWa
||(eth1)
||
||(eth1)
GWb
|(eth0)

I running netfilter with freeswan, I add a rule in FORWARD chain to drop =
all packets forward from
internal iface(eth0) to public iface(eth1).
    iptables - A FORWARD -i eth0 -i eth1 -j DROP

it works fine when , when i try to ping GWb's eth0 from machine A, it =
get blocked.

however once I start up the IPSEC, I do the ping again and A can ping =
GWb's eth0. The rule in FORWARD chain is still there.

Why does this happen? Is that anyway I can fix this?

Thanks very much
Calvin


------=_NextPart_000_001B_01C32DD8.04DB4290
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I got a funny problem here and got no =
idea why it=20
happen.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>my simple network is</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>A</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;|(eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>GWa</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||(eth1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>||(eth1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>GWb</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>|(eth0)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I running netfilter with freeswan, I =
add a rule in=20
FORWARD chain to drop all packets forward from</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>internal iface(eth0) to public=20
iface(eth1).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables - A FORWARD =
-i eth0 -i=20
eth1 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>it works fine when , when i try to ping =
GWb's eth0=20
from machine A, it get blocked.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>however once I start up the IPSEC, I do =
the ping=20
again and A can ping GWb's eth0. The rule in FORWARD chain is still=20
there.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Why does this happen? Is that anyway I =
can fix=20
this?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks very much</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Calvin</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_001B_01C32DD8.04DB4290--



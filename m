From: "Jean Khosalim" <jkhosali@nps.navy.mil>
Subject: NAT and UDP
Date: Fri, 28 Mar 2003 10:50:52 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c2f55a$f4d13bd0$c00a7883@ad.nps.navy.mil>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01C2F517.E6A1C6D0"
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
Cc: David Shifflett <shifflett@nps.navy.mil>

This is a multi-part message in MIME format.

------=_NextPart_000_000A_01C2F517.E6A1C6D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We are trying to NAT some UDP traffic and can't get iptables configured =
correctly.
We are using version 1.27 on familiar linux version 0.5.3

Here is our configuration:
# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere           =
to:192.168.0.31

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

When a TFTP packet comes in on 192.168.1.1 it gets SNAT'd
and sent out 192.168.0.31, but the reply is always dropped
and an unreachable messages is sent out.

We have tried it with:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

this configuration does the same thing.

Does NAT work for UDP in general, and TFTP in particular?
The man page has lots of UDP specific options
do those only apply to filtering, and not NAT?

Thanks for any help.
Jean Khosalim and David Shifflett

------=_NextPart_000_000A_01C2F517.E6A1C6D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>We are trying to NAT some UDP traffic =
and can't get=20
iptables configured correctly.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>We are using version 1.27 on familiar =
linux version=20
0.5.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is our configuration:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2># iptables -t nat -L<BR>Chain =
PREROUTING (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain POSTROUTING (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
to:192.168.0.31</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain OUTPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When a TFTP packet comes in on =
192.168.1.1 it gets=20
SNAT'd</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and sent out 192.168.0.31, but the =
reply is always=20
dropped</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and an unreachable messages is sent=20
out.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We have tried it with:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o eth0 =
-j=20
MASQUERADE</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>this configuration does the same=20
thing.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Does NAT work for UDP in general, and =
TFTP in=20
particular?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The man page has lots of UDP specific=20
options</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>do those only apply to filtering, and =
not=20
NAT?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for any help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jean Khosalim and David=20
Shifflett</FONT></DIV></BODY></HTML>

------=_NextPart_000_000A_01C2F517.E6A1C6D0--



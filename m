From: "Peter Pohlmann" <peter@e-partner.com>
Subject: Masquerade Problem
Date: Tue, 27 May 2003 21:16:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d601c324b6$c1f19a30$3801a8c0@Peters>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00D3_01C32495.3AAD7880"
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

------=_NextPart_000_00D3_01C32495.3AAD7880
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello list,

I have a problem with my masquerading.=20
Can someone supply me a basic configuration. I want to have the private =
network
open for everything.=20

The current rules are below. Works for pop ,http etc. But ftp is not =
proper and connecting to an outside=20
smtp server is a problem too. I can send very small emails but if some =
larger email or attachment it stops after transferring some kbs.  What =
am I missing here ?  The server is redhat 9 pppoe to the dsl modem.

#!/bin/sh

modprobe ip_conntrack_ftp
modprobe iptable_nat
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

echo 1 >/proc/sys/net/ipv4/ip_forward
echo 1 >/proc/sys/net/ipv4/ip_dynaddr

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS =
--clamp-mss-to-pmtu

Thank you in advance,
Peter


------=_NextPart_000_00D3_01C32495.3AAD7880
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT size=3D2>Hello list,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I have a problem with my masquerading. </FONT></DIV>
<DIV><FONT size=3D2>Can someone supply me a basic configuration. I want =
to have=20
the private network</FONT></DIV>
<DIV><FONT size=3D2>open for everything. </FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>The current rules are below. Works for pop ,http =
etc. But ftp=20
is not proper and connecting to an outside </FONT></DIV>
<DIV><FONT size=3D2>smtp server is a problem too. I can send very small =
emails but=20
if some larger email or attachment it stops after transferring some =
kbs.&nbsp;=20
What am I missing here ?&nbsp; The server is redhat 9 pppoe to the dsl=20
modem.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>#!/bin/sh</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>modprobe ip_conntrack_ftp<BR>modprobe =
iptable_nat</FONT></DIV>
<DIV><FONT size=3D2>iptables -P INPUT ACCEPT<BR>iptables -P OUTPUT=20
ACCEPT<BR>iptables -P FORWARD ACCEPT</FONT></DIV><FONT size=3D2>
<DIV><BR>echo 1 &gt;/proc/sys/net/ipv4/ip_forward<BR>echo 1=20
&gt;/proc/sys/net/ipv4/ip_dynaddr</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE<BR>iptables -A =
FORWARD=20
-p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thank you in advance,</DIV>
<DIV>Peter</DIV>
<DIV>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_00D3_01C32495.3AAD7880--



From: "zze-KHOURY Jad FTRD/DMI/CAE" <jad.khoury@rd.francetelecom.com>
Subject: Netfilter Logs
Date: Fri, 30 Apr 2004 14:08:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D4EF10CCEB2CE742BEEA9838C590B0E801AA2E30@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C42EAB.CDEF00D0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C42EAB.CDEF00D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Hi ,=20
 I'm having some problems finding how to log ONLY iptable log messages
to another file other than messages. So I made some changes in the
"sylsog.conf" file by adding: kern.warning /var/log/firewall since the
Default log level entry is" warning". But I still reveive some message
other than the packets, from the kernel itself!

 how can I limit the input messages to only Netfilter packets?=20
What should I change in the syslog.conf file If I don't want to receive
Netfilter messages in this file?=20
 =20

regards=20
Jad=20


------_=_NextPart_001_01C42EAB.CDEF00D0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D247350612-30042004><FONT=20
color=3D#0000ff>&nbsp;<FONT color=3D#000000>Hi</FONT></FONT></SPAN><SPAN =

class=3D247350612-30042004><FONT =
color=3D#0000ff>&nbsp;</FONT></SPAN>,</FONT></FONT>=20
<BR><FONT face=3DArial size=3D2>&nbsp;I'm having some problems finding =
how to log=20
ONLY iptable log messages to another file other than messages. So I made =
some=20
changes in the "sylsog.conf" file by adding:<B> kern.warning=20
/var/log/firewall</B> since the Default log level entry is" warning". =
But I=20
still reveive some message other than the packets, from the kernel=20
itself!</FONT></DIV>
<P><FONT face=3DArial size=3D2>&nbsp;how can I limit the input messages =
to only=20
Netfilter packets?</FONT> <BR><FONT face=3DArial size=3D2>What should I =
change in=20
the syslog.conf file If I don't want to receive Netfilter messages in =
this=20
file?</FONT> <BR><FONT face=3DArial size=3D2>&nbsp;</FONT> </P>
<P><FONT face=3DArial size=3D2>regards</FONT> <BR><FONT face=3DArial =
size=3D2>Jad=20
</FONT></P></BODY></HTML>

------_=_NextPart_001_01C42EAB.CDEF00D0--


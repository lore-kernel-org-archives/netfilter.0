From: Niels Bach <NB@maconomy.dk>
Subject: PPTP through iptables firewall
Date: Fri, 7 Feb 2003 09:43:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E88493086664D511A1E4000103330E82027FE05C@mail.maconomy.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CE84.F89192D0"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2CE84.F89192D0
Content-Type: text/plain;
	charset="iso-8859-1"

I have an MS PPTP server (win2k) behind a linux firewall (kernel 2.4.20 /
iptables 1.2.7a) this does not work very well. You can only connect from one
source at a time. Then there is a 10 minute (600 seconds) timeout before the
next connection from a different source can be made. If you come from a LAN
that is NAT'ed to one IP address (the firewalls) then all these clients can
connect simultaneously. So it is either one client with a public ip address
or several clients sharing a public IP address. But once their is a
connection (either type) everybody else is blocked out.

I have tried to patch the kernel (patch-o-matic-20030107) with the
pptp-conntrack-nat.patch. With this patch the firewall is able to recognize
the GRE protocol. This can be seen in /proc/net/ip_conntrack where the
connections involving GRE has changed from UNKNOWN to GRE. But with this
patch it is not possible to connect, now the windows client only reach
"verifying username and password" and then times out. 

Without the patch it is possible to connect to the server one at a time and
wait 10 minutes before the next connection from a different location

With the patch it is not possible to connect at all.

I run Debian 3.0 (woody) Kernel 2.4.20 and iptables 1.2.7a with the patched
version and 1.2.6a with the unpatched version of the kernel.

I have seen more people talking about this issue on the web, but no one
seems to have at solution. 

regards Niels



------_=_NextPart_001_01C2CE84.F89192D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>PPTP through iptables firewall</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Verdana">I have an MS PPTP server (win2k) =
behind a linux firewall (kernel 2.4.20 / iptables 1.2.7a) this does not =
work very well. You can only connect from one source at a time. Then =
there is a 10 minute (600 seconds) timeout before the next connection =
from a different source can be made. If you come from a LAN that is =
NAT'ed to one IP address (the firewalls) then all these clients can =
connect simultaneously. So it is either one client with a public ip =
address or several clients sharing a public IP address. But once their =
is a connection (either type) everybody else is blocked out.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">I have tried to patch the kernel =
(patch-o-matic-20030107) with the pptp-conntrack-nat.patch. With this =
patch the firewall is able to recognize the GRE protocol. This can be =
seen in /proc/net/ip_conntrack where the connections involving GRE has =
changed from UNKNOWN to GRE. But with this patch it is not possible to =
connect, now the windows client only reach &quot;verifying username and =
password&quot; and then times out. </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">Without the patch it is possible to =
connect to the server one at a time and wait 10 minutes before the next =
connection from a different location</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">With the patch it is not possible to =
connect at all.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">I run Debian 3.0 (woody) Kernel =
2.4.20 and iptables 1.2.7a with the patched version and 1.2.6a with the =
unpatched version of the kernel.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">I have seen more people talking =
about this issue on the web, but no one seems to have at solution. =
</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Verdana">regards Niels</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C2CE84.F89192D0--


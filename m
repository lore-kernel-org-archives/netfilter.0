From: "Jon Wagoner" <jwagoner@wlion.com>
Subject: NAT stops working after a couple of minutes
Date: Thu, 10 Apr 2003 12:31:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2027D25E03C43D41A240C0F3CD4AC614014426@exchback.primusnetworks.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2FF86.F68996D6"
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

------_=_NextPart_001_01C2FF86.F68996D6
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am trying to get NAT set up for use with my Zaurus (PDA).  The basic =
layout of my network is:
cable modem -> linux firewall (with NAT, works fine) -> desktop -> =
Zaurus
=20
The Zaurus is connected to the desktop through USB.  The usbdnet modules =
allows network access to the Zaurus from my desktop.  The Zaurus has the =
IP address 192.168.129.201, and my desktop has the IP address =
192.168.129.200 on the usb0 interface, and 192.168.1.2 on the eth0 =
interface.  Without nat I can ping, ssh, etc. to the Zaurus with no =
problem, for long periods of time.  The usb0 interface on my desktop is =
set up by:
ifconfig usb0 192.168.129.200 netmask 255.255.255.255 up=20
route add -host 192.168.129.201 usb0=20
So, I have network access to/from the Zaurus at this point, but no =
internet access.  So at this point I want to set up NAT on my desktop, =
so it can take care of interfacing the Zaurus to the internet.  So on =
the desktop I add the following rules:
=20

iptables -F

iptables -t nat -F

iptables -t nat -A POSTROUTING -j SNAT -o eth0 --to-source 192.168.1.2

=20

This works fine at first, but after less than a minute I can no longer =
get to the Zaurus from my desktop.  If I rmmod the iptables modules, I =
can then see it again. =20

=20

I am running kernel 2.4.20 on Gentoo.  I am using the default gcc that =
it comes with (3.2.2 I believe). =20

/proc/sys/net/ipv4/ip_forward is set to 1

/proc/sys/net/ipv4/ip_conntrack_max is 32760

I'm not really sure what other information is relevant here. I did see =
an almost identical problem when I was setting up the linux firewall =
mentioned above. There, it was just a low-end box with 2 ethernet cards, =
with the cable modem on one and my hub on the other.  I got NAT set up =
with kernel 2.4.8 (I think) and it would work fine for a few minutes.  =
After that, though, I could not communicate from my desktop to the =
firewall or internet.  So, it is pretty much the identical problem, but =
with usb0 now instead of eth1 for the end computer.  That time was with =
a vanilla kernel compiled with gcc 2.95.3.
=20
Any ideas on what I'm doing wrong here?
=20
Jon
=20

------_=_NextPart_001_01C2FF86.F68996D6
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D410281517-10042003>I am =
trying to get=20
NAT set up for use with my Zaurus (PDA).&nbsp; The basic layout of my =
network=20
is:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D410281517-10042003>cable =
modem -&gt;=20
linux firewall (with NAT, works fine) -&gt; desktop -&gt;=20
Zaurus</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D410281517-10042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D410281517-10042003>The =
Zaurus is=20
connected to the desktop through USB.&nbsp; The usbdnet modules allows =
network=20
access to the Zaurus from my desktop.&nbsp; The Zaurus has the IP =
address=20
192.168.129.201, and my desktop has the IP address 192.168.129.200 on =
the usb0=20
interface, and 192.168.1.2 on the eth0 interface.&nbsp; Without nat I =
can ping,=20
ssh, etc. to the Zaurus with no problem, for long periods of time.&nbsp; =
The=20
usb0 interface on my desktop is set up by:</SPAN></FONT></DIV><PRE><SPAN =
class=3D410281517-10042003><!--StartFragment -->ifconfig usb0 =
192.168.129.200 netmask 255.255.255.255 up <BR>route add -host =
192.168.129.201 usb0 </SPAN></PRE>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D410281517-10042003>So, I =
have network=20
access to/from the Zaurus at this point, but no internet access.&nbsp; =
So at=20
this point I want to set up NAT on my desktop, so it can take care of=20
interfacing the Zaurus to the internet.&nbsp; So on the desktop I add =
the=20
following rules:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D410281517-10042003></SPAN></FONT>&nbsp;</DIV><PRE><SPAN =
class=3D410281517-10042003><P><FONT size=3D2>iptables =
-F</FONT></P><P><FONT size=3D2>iptables -t nat -F</FONT></P><P><FONT =
size=3D2>iptables -t nat -A POSTROUTING -j SNAT -o eth0 --to-source =
192.168.1.2</FONT></P><P><FONT size=3D2></FONT>&nbsp;</P><P><SPAN =
class=3D410281517-10042003><FONT face=3DArial size=3D2>This works fine =
at first, but after less than a minute I can no longer get to the Zaurus =
from my desktop.  If I rmmod the iptables modules, I can then see it =
again.  </FONT></SPAN></P><P><SPAN class=3D410281517-10042003><FONT =
face=3DArial size=3D2></FONT></SPAN>&nbsp;</P><P><SPAN =
class=3D410281517-10042003><FONT face=3DArial size=3D2>I am running =
kernel 2.4.20 on Gentoo.  I am using the default gcc that it comes with =
(3.2.2 I believe).  </FONT></SPAN></P><SPAN =
class=3D410281517-10042003><FONT =
size=3D2><P>/proc/sys/net/ipv4/ip_forward is set to =
1</P><P>/proc/sys/net/ipv4/ip_conntrack_max is 32760</P></PRE>
<DIV><SPAN class=3D410281517-10042003><FONT face=3DArial size=3D2>I'm =
not really sure=20
what other information is relevant here.  I did see an almost identical =
problem=20
when I was setting up the linux firewall mentioned above.  There, it was =
just a=20
low-end box with 2 ethernet cards, with the cable modem on one and my =
hub on the=20
other.&nbsp; I got NAT set up with kernel 2.4.8 (I think) and it would =
work fine=20
for&nbsp;a few minutes.&nbsp; After that, though, I could not =
communicate from=20
my desktop to the firewall or internet.&nbsp; So, it is pretty much the=20
identical problem, but with usb0 now instead of eth1 for the end =
computer.&nbsp;=20
That time was with a vanilla kernel compiled with&nbsp;gcc=20
2.95.3.</FONT></SPAN></DIV>
<DIV><SPAN class=3D410281517-10042003><FONT =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D410281517-10042003><FONT face=3DArial>Any ideas on =
what I'm doing=20
wrong here?</FONT></SPAN></DIV>
<DIV><SPAN class=3D410281517-10042003><FONT =
face=3DArial></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D410281517-10042003><FONT =
face=3DArial>Jon</FONT></SPAN></DIV>
<DIV><FONT =
face=3DArial></FONT></SPAN></SPAN></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C2FF86.F68996D6--


From: "Kevin Conaway" <kconaway@ucwphilly.rr.com>
Subject: iptables + apache2 logging irregularity
Date: Wed, 22 Jan 2003 22:21:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005b01c2c28e$79f8faa0$0201a8c0@conaway.us>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0058_01C2C264.90D82E00"
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

------=_NextPart_000_0058_01C2C264.90D82E00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have one gateway machine with iptables 1.2.7a. It is has an external =
ip address FW_EXT =3D 1.2.3.4 and an internal ip address FW_INT =3D =
2.3.4.5
I have a machine hiding behind this gateway running apache 2.0.43.  It =
has an internal ip address HTTP_INT =3D 4.5.6.7

Here is how I have my rules setup:

-A FORWARD -p tcp -j ACCEPT

-A PREROUTING -d FW_EXT -p tcp -m tcp --dport 80 -j DNAT =
--to-destination HTTP_INT:80
-A POSTROUTING -d FW_EXT -p tcp -m tcp --dport 80 -j SNAT --to-source =
FW_INT
-A POSTROUTING -o eth0 -j MASQUERADE

-A OUTPUT -d FW_EXT -p tcp -m tcp --dport 80 -j DNAT --to-destination =
HTTP_INT

I set this up just as described in the netfilter tutorial
http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutori=
al.html#AEN2601

If I leave it as is, everything works fine from hosts outside my network =
and on the apache server, the log files indicate the correct source =
address.  I cannot however access the server from my internal network.

If I add a rule like
-A POSTROUTING -o eth1 -j SNAT --to-source FW_EXT

I can then access the server from my internal network but in the apache =
logs, it shows all requests as coming from FW_EXT.

How can I fix this?

Thank you,

Kevin Conaway

------=_NextPart_000_0058_01C2C264.90D82E00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4522.1800" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I have one gateway machine with =
iptables 1.2.7a. It=20
is has an external ip address FW_EXT =3D 1.2.3.4 and an internal ip =
address FW_INT=20
=3D 2.3.4.5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have a machine hiding behind this =
gateway running=20
apache 2.0.43.&nbsp; It has an internal ip address HTTP_INT =3D=20
4.5.6.7</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is how I have my rules =
setup:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-A FORWARD -p tcp -j =
ACCEPT<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-A PREROUTING -d&nbsp;FW_EXT -p tcp -m =
tcp --dport=20
80 -j DNAT --to-destination HTTP_INT:80</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-A POSTROUTING -d&nbsp;FW_EXT -p tcp -m =
tcp --dport=20
80 -j SNAT --to-source FW_INT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-A POSTROUTING -o eth0 -j =
MASQUERADE</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-A OUTPUT -d&nbsp;FW_EXT -p tcp -m tcp =
--dport 80=20
-j DNAT --to-destination HTTP_INT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I set this up just as described in the =
netfilter=20
tutorial</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><A=20
href=3D"http://www.netfilter.org/documentation/tutorials/blueflux/iptable=
s-tutorial.html#AEN2601">http://www.netfilter.org/documentation/tutorials=
/blueflux/iptables-tutorial.html#AEN2601</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I leave it as is, everything works =
fine from=20
hosts outside my network and on the apache server, the log files =
indicate the=20
correct source address.&nbsp; I cannot however access the server from my =

internal network.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I add a rule like</FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2>-A POSTROUTING -o eth1 -j SNAT =
--to-source=20
FW_EXT</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>I can then access the server from =
my internal=20
network but in the apache logs, it shows all requests as coming from=20
FW_EXT.</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>How can I fix =
this?</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>Thank you,</FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>Kevin=20
Conaway</FONT></DIV></FONT></BODY></HTML>

------=_NextPart_000_0058_01C2C264.90D82E00--



From: "Peter Marshall" <peter.marshall@caris.com>
Subject: proxy and ftp
Date: Wed, 26 May 2004 08:34:47 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0da401c44315$730d6b50$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0DA1_01C442FC.4DB6BD70"
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

------=_NextPart_000_0DA1_01C442FC.4DB6BD70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone. =20

I have most of my firewall rules configured, however, I am not sure what =
I should do for rules for my ftp and proxy servers.  I have a diagram =
below giving a picture of how my setup is configured.  If someone (or =
many-ones ) would not mind giving me some ideas for forward chain rules =
for my ftp and proxy servers, I would really appreciate it ... I am kind =
of stumped as to how to not open my firewall up to the world .....

Thank you very much
Peter


-----------------------------
eth0 a.a.a.1/29
external firewall
eth1 b.b.b.1/26
----------------------------
-
- proxy server b.b.b.3
- ftpserver b.b.b.4
-
-
-----------------------------
eth1 b.b.b.2/26
internal firewall
eth0 c.c.c.1/21
----------------------------



------=_NextPart_000_0DA1_01C442FC.4DB6BD70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello everyone.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have most of my firewall rules =
configured,=20
however, I am not sure what I should do for rules for my ftp and proxy=20
servers.&nbsp; I have a diagram below giving a picture of how my setup =
is=20
configured.&nbsp; If someone (or many-ones ) would not mind giving me =
some ideas=20
for forward chain rules for my ftp and proxy servers, I would really =
appreciate=20
it ... I am kind of stumped as to how to not open my firewall up to the =
world=20
.....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you very much</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Peter</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>-----------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 a.a.a.1/29</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>external firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1 b.b.b.1/26</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>----------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- proxy server b.b.b.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- ftpserver b.b.b.4</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial =
size=3D2>-----------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1 b.b.b.2/26</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>internal firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 c.c.c.1/21</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0DA1_01C442FC.4DB6BD70--



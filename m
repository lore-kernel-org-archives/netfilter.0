From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: proxy and ftp
Date: Wed, 26 May 2004 09:17:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0e2101c4431b$64ec6b10$49caa8c0@caris.priv>
References: <0da401c44315$730d6b50$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0E1E_01C44302.3F934C30"
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
To: Peter Marshall <peter.marshall@caris.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0E1E_01C44302.3F934C30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I should have also mentioned, that my concern with ftp is mostly weather =
to configure the rules with passive or active mode ... I realize the =
active mode is "better" for me as a server admin ... however could cause =
many problems on the client side ....=20

Peter
  ----- Original Message -----=20
  From: Peter Marshall=20
  To: netfilter@lists.netfilter.org=20
  Sent: Wednesday, May 26, 2004 8:34 AM
  Subject: proxy and ftp


  Hello everyone. =20

  I have most of my firewall rules configured, however, I am not sure =
what I should do for rules for my ftp and proxy servers.  I have a =
diagram below giving a picture of how my setup is configured.  If =
someone (or many-ones ) would not mind giving me some ideas for forward =
chain rules for my ftp and proxy servers, I would really appreciate it =
... I am kind of stumped as to how to not open my firewall up to the =
world .....

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



------=_NextPart_000_0E1E_01C44302.3F934C30
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
<DIV><FONT face=3DArial size=3D2>I should have also mentioned, that my =
concern with=20
ftp is mostly weather to configure the rules with passive or active mode =
... I=20
realize the active mode is "better" for me as a server admin ... however =
could=20
cause many problems on the client side .... </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Peter</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dpeter.marshall@caris.com =
href=3D"mailto:peter.marshall@caris.com">Peter=20
  Marshall</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, May 26, 2004 =
8:34=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> proxy and ftp</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hello everyone.&nbsp; </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I have most of my firewall rules =
configured,=20
  however, I am not sure what I should do for rules for my ftp and proxy =

  servers.&nbsp; I have a diagram below giving a picture of how my setup =
is=20
  configured.&nbsp; If someone (or many-ones ) would not mind giving me =
some=20
  ideas for forward chain rules for my ftp and proxy servers, I would =
really=20
  appreciate it ... I am kind of stumped as to how to not open my =
firewall up to=20
  the world .....</FONT></DIV>
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
  <DIV><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0E1E_01C44302.3F934C30--



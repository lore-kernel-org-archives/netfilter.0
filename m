From: "Venkatesh. K" <venkatesh@cbayscribe.com>
Subject: Re: Connecting to PPtP Servers from a LAN
Date: Mon, 22 Sep 2003 13:26:47 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012401c380df$2a7ddda0$2800a8c0@karu>
References: <200309211252.h8LCq5K25534@circle.mikroplan.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_011C_01C3810D.2C90C930"
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
Cc: Alexander Wied <mikroplan@gmx.de>

This is a multi-part message in MIME format.

------=_NextPart_000_011C_01C3810D.2C90C930
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

You have not given full details.

You need to check=20

1. You need to allow GRE protocol through your firewall
2. Assuming you are using NAT, you need to compile support for pptp =
connection tracking in kernel. Please note that conntrack_pptp is not =
part of stock kernel. Have a look at www.netfilter.org. Else, only one =
remote PPTP session works.

Venkatesh. K
  ----- Original Message -----=20
  From: Alexander Wied=20
  To: netfilter@lists.netfilter.org=20
  Sent: Sunday, September 21, 2003 6:31 PM
  Subject: Connecting to PPtP Servers from a LAN


  Hello everybody,

  =20

  we have set up a simple firewall configuration:

  =20

  ournetwork   -----------------   Router with iptables =
----------------Internet

  =20

  the router with iptables does Masquerading on outgoing Packets from =
the LAN.

  =20

  When connecting to an PPtP Server in the Internet, connection does not =
work.

  =20

  When trying it with the old router, an Windows Winroute Router, the =
connection works fine without configuring anything.

  What  rules do I have to configure for my Clients, so that they may =
access an PPtP-Server localted in the Internet?

  =20

  =20

  Thanks in advance,

  =20

  Alex

------=_NextPart_000_011C_01C3810D.2C90C930
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE>@page Section1 {size: 595.3pt 841.9pt; margin: 70.85pt 70.85pt =
2.0cm 70.85pt; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.E-MailFormatvorlage17 {
	COLOR: windowtext; FONT-FAMILY: Arial; mso-style-type: personal-compose
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DDE vLink=3Dpurple link=3Dblue bgColor=3D#ffffff>
<DIV><FONT size=3D2>You have not given full details.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>You need to check </FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>1. You need to allow GRE protocol through your=20
firewall</FONT></DIV>
<DIV><FONT size=3D2>2. Assuming you are using NAT, you need to compile =
support for=20
pptp connection tracking in kernel. Please note that conntrack_pptp is =
not part=20
of stock kernel. Have a look at <A=20
href=3D"http://www.netfilter.org">www.netfilter.org</A>. Else, only one =
remote=20
PPTP session works.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Venkatesh. K</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dmikroplan@gmx.de href=3D"mailto:mikroplan@gmx.de">Alexander =
Wied</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Sunday, September 21, =
2003 6:31=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Connecting to PPtP =
Servers from=20
  a LAN</DIV>
  <DIV><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Hello=20
  everybody,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">we have set up a simple =
firewall=20
  configuration:<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">ournetwork&nbsp;&nbsp;=20
  -----------------&nbsp;&nbsp; Router with iptables=20
  ----------------Internet<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">the router with iptables =
does=20
  Masquerading on outgoing Packets from the =
LAN.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">When connecting to an =
PPtP Server=20
  in the Internet, connection does not =
work.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-BOTTOM: 12pt"><FONT face=3DArial =
size=3D2><SPAN=20
  lang=3DEN-GB style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">When trying =
it with the=20
  old router, an Windows Winroute Router, the connection works fine =
without=20
  configuring anything.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">What&nbsp; rules do I =
have to=20
  configure for my Clients, so that they may access an PPtP-Server =
localted in=20
  the Internet?<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Thanks in=20
  advance,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Alex<o:p></o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML>=


------=_NextPart_000_011C_01C3810D.2C90C930--



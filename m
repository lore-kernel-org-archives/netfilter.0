From: "hare ram" <hareram@sol.net.in>
Subject: Re: Kazza
Date: Mon, 17 Mar 2003 19:15:08 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c2ec8b$6f976fc0$13fcc5cb@Housecall>
References: <000001c2ebfc$38afb380$2f6a81d9@pccarol>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002F_01C2ECB9.86658420"
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
To: =?iso-8859-1?B?Sm/jbw==?= <joao.paulo.dente@netvisao.pt>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_002F_01C2ECB9.86658420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This should work for you

iptables -I FORWARD -i eth1 -p tcp -m string --string "KazaaClient" -j =
REJECT --reject-with tcp-reset

hare
  ----- Original Message -----=20
  From: Jo=E3o=20
  To: netfilter@lists.netfilter.org=20
  Sent: Monday, March 17, 2003 2:10 AM
  Subject: Kazza


  Can you give me ana example how to block kazaa


------=_NextPart_000_002F_01C2ECB9.86658420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE>@page Section1 {size: 595.3pt 841.9pt; margin: 70.85pt 3.0cm =
70.85pt 3.0cm; }
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
SPAN.EstiloCorreioElectrnico17 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DPT vLink=3Dpurple link=3Dblue bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>This should work for you</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -I FORWARD -i eth1 -p tcp -m =
string=20
--string "KazaaClient" -j REJECT --reject-with tcp-reset</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>hare</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Djoao.paulo.dente@netvisao.pt=20
  href=3D"mailto:joao.paulo.dente@netvisao.pt">Jo=E3o</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, March 17, 2003 =
2:10=20
AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Kazza</DIV>
  <DIV><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Can you give me ana =
example how to=20
  block kazaa</SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_002F_01C2ECB9.86658420--



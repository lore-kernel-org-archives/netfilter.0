From: "John Black" <black@arbbs.net>
Subject: Re: static nat with iptables
Date: Sun, 22 Feb 2004 09:13:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3f956$60983f80$ed02fea9@black>
References: <000501c3f912$c70bc230$190da8c0@iomco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C3F924.1512D340"
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

------=_NextPart_000_001F_01C3F924.1512D340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

is your eth0 ip address a static ip or dynamic?  if it is static try =
this:

iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED, =
RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -j LOG


iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth1  -j SNAT --to =
213.29.76.153


  Dear sir=20

  Pls kindly help me

  I have a private address like 192.168.20.19/24 and I have a public =
address like 213.29.76.153/27 im going to translate (STATIC NAT) my =
private ip address to public address (213.29.76.19) with iptables

  Meanwhile my router is redhat linux 8.0 and have 2 network adapter =
like below

  Eth0 192.168.20.1 /24  (connect to private network)

  Eth1 213.29.76.154 /27 (connected to internet )

  =20


------=_NextPart_000_001F_01C3F924.1512D340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE>P.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
LI.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
}
DIV.MsoNormal {
	FONT-FAMILY: "Times New Roman"; FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt
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
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY bgColor=3D#ffffff lang=3DEN-US link=3Dblue vLink=3Dpurple>
<DIV><FONT face=3DArial size=3D2>is your eth0 ip address a static ip or=20
dynamic?&nbsp; if it is static t</FONT><FONT face=3DArial size=3D2>ry=20
this:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -i eth1 -o eth0 -m =
state=20
--state ESTABLISHED, RELATED -j ACCEPT<BR>iptables -A FORWARD -i eth0 -o =
eth1 -j=20
ACCEPT<BR>iptables -A FORWARD -j LOG<BR></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -s =
192.168.20.0/24=20
-o eth1&nbsp; -j SNAT --to 213.29.76.153</FONT></DIV>
<DIV>&nbsp;</DIV>
<BLOCKQUOTE=20
style=3D"BORDER-LEFT: #000000 2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: =
0px; PADDING-LEFT: 5px; PADDING-RIGHT: 0px">
  <DIV>&nbsp;</DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Dear sir =
</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Pls kindly help=20
  me</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">I have a private address =
like=20
  192.168.20.19/24 and I have a public address like 213.29.76.153/27 im =
going to=20
  translate (STATIC NAT) my private ip address to public address =
(213.29.76.19)=20
  with iptables</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Meanwhile my router is =
redhat=20
  linux 8.0 and have 2 network adapter like below</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Eth0 192.168.20.1 =
/24&nbsp;=20
  (connect to private network)</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: 10pt">Eth1 213.29.76.154 /27 =
(connected=20
  to internet )</SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-FAMILY: Arial; FONT-SIZE: =
10pt">&nbsp;</SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_001F_01C3F924.1512D340--



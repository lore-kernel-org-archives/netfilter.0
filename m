From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: forwarding all ports from a particular IP?
Date: Fri, 16 Apr 2004 00:28:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c42362$f84846f0$51a2fea9@heretic>
References: <E1BEJdE-0005aN-Ho@ht8b10.server4sale.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C42349.CF76F140"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C42349.CF76F140
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 for the first question, the answer is yes

do=20

iptables -t nat -A PREROUTING -s the_ip_you_need -j DNAT --to =
the_destination_ip

for the entire ip range, yes too, do this in the same way, just adding a =
mask or a cidr value to the net.

for a name, its not possible iptables will resolve a specific name at =
the moment that it reads and insert the rule to the table. So if the =
name change its ip, it wont be reflected on the rules until you reload =
them.

What you can do is this

dig www.aol.com

if the response is 1.2.3.4 do

whois 1.2.3.4 and look the ip range of aol, (suppose 1.2.0.0/16) so, you =
can do

iptables -t nat -A PREROUTING -s 1.2.0.0/16 -j DNAT --to =
the_destination_ip


dont forget to turn on ip_forwarding and check the FORWARD policy



  ----- Original Message -----=20
  From: James=20
  To: netfilter@lists.netfilter.org=20
  Sent: Friday, April 16, 2004 12:04 AM
  Subject: forwarding all ports from a particular IP?


  Hi,

  =20

  I was wondering if anybody could tell me how to setup a rule that =
forwards all inbound packets from a particular IP, regardless of the =
ports, on to a machine on the local network? If so, what would this rule =
look like?

  =20

  I was also wondering if it is possible to forward an entire IP range, =
or the DNS using wildcards? For example forwarding all connections from =
*.aol.com regardless of the port onto a specific IP? If this is =
possible, could anybody tell me how I would go about it?

  =20

  Thanks,

  James

  =20

------=_NextPart_000_000C_01C42349.CF76F140
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE>@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.25in 1.0in =
1.25in; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"
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
	COLOR: windowtext; FONT-FAMILY: Arial; mso-style-type: personal-compose
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue bgColor=3D#d8d0c8>
<DIV><FONT face=3DArial size=3D2>&nbsp;for the first question, the =
answer is=20
yes</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>do </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -s =
the_ip_you_need -j=20
DNAT --to the_destination_ip</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>for the entire ip range, yes too, do =
this in the=20
same way, just adding a mask or a cidr value to the net.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>for a name, its not possible iptables =
will resolve=20
a specific name at the moment that it reads and insert the rule to the =
table. So=20
if the name change its ip, it wont be reflected on the rules until you =
reload=20
them.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What you can do is this</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>dig <A=20
href=3D"http://www.aol.com">www.aol.com</A></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>if the response is 1.2.3.4 =
do</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>whois 1.2.3.4 and look the ip range of =
aol,=20
(suppose 1.2.0.0/16) so, you can do</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -s =
1.2.0.0/16 -j DNAT=20
--to the_destination_ip</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>dont forget to turn on ip_forwarding =
and check the=20
FORWARD policy</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Djames@bluetrident.net =
href=3D"mailto:james@bluetrident.net">James</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, April 16, 2004 =
12:04=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> forwarding all ports =
from a=20
  particular IP?</DIV>
  <DIV><BR></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Hi,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I was wondering if =
anybody could=20
  tell me how to setup a rule that forwards all inbound packets from a=20
  particular IP, regardless of the ports, on to a machine on the local =
network?=20
  If so, what would this rule look like?<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I was also wondering if =
it is=20
  possible to forward an entire IP range, or the DNS using wildcards? =
For=20
  example forwarding all connections from *.aol.com regardless of the =
port onto=20
  a specific IP? If this is possible, could anybody tell me how I would =
go about=20
  it?<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Thanks,<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">James<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTM=
L>

------=_NextPart_000_000C_01C42349.CF76F140--



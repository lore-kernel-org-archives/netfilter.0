From: Aldo Lagana <ALagana@p21.com>
Subject: RE: NAT and VPN
Date: Thu, 3 Jun 2004 13:26:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0776B9DA384FFB4C94A6B73F7DC87A6003F35CC9@newman.p21.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4498F.E3E56870"
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
To: 'Derek Storvik' <dstorvik@consultech.net>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4498F.E3E56870
Content-Type: text/plain;
	charset="iso-8859-1"

What VPN?  Cisco IPSec client?  other IPSec clients?  PoPToP?.....
 
yes it matters
 
for Poptop - there is a module ip_nat_pptp
 
I think for IPSec there are other netfilter modules to provide VPN over a
NAT connection.
 
The reason why is that VPN require that the packets are not touched (they
have a checksum stored within each packet which it checks against) and NAT
breaks that - it chanegs the packet thus changing the new checksum value
thus breaking the VPN.  
 
so
 
you need to find out which vpn it is and you need to google if there is a
Netfilter module available for it.!
 
 

-----Original Message-----
From: Derek Storvik [mailto:dstorvik@consultech.net]
Sent: Thursday, June 03, 2004 12:53 PM
To: netfilter@lists.netfilter.org
Subject: NAT and VPN



I'm having trouble with NAT and VPN   

 

I have a linux server running Fedora core 1   that is a
NAT/FIREWALL/VLAN/DHCP server for a large client network.

 

Internet

  |

  |

Linux

  |

  |

Large network with many vlans and 1000 nodes or so.

 

 

 The internal network is natted to the 10.0.0.0 network and my clients can
not VPN out to the internet.   Specifically they get back an error 619

What has to be done to allow VPN to traverse through the firewall and NAT?
at the moment the firewall rules are wide open to make sure that isn't my
issue. 

 

Any help would be appreciated.

----------------------------------

Derek Storvik

Network & Systems Administrator

ConsulTech, LLC

 

 

Phone: 812.323.8324

Fax: 812.323.1272

E-mail:  <mailto:dstorvik@consultech.net> dstorvik@consultech.net

 

1441 Fenbrook Lane

Bloomington, IN 47401

----------------------------------

 



Visit our website at http://www.p21.com/visit 
The information in this e-mail is confidential and may contain legally
privileged information.  It is intended solely for the person or entity to
which it is addressed.  Access to this e-mail by anyone else is
unauthorized. If you are not the intended recipient, any disclosure,
copying, distribution, action taken, or action omitted to be taken in
reliance on it, is prohibited and may be unlawful.  If you received this
e-mail in error, please contact the sender and delete the material from any
computer. 



------_=_NextPart_001_01C4498F.E3E56870
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word" xmlns:st1 =3D=20
"urn:schemas-microsoft-com:office:smarttags"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1400" =
name=3DGENERATOR><o:SmartTagType=20
name=3D"place"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><o:SmartTagType=20
name=3D"PostalCode"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><o:SmartTagType=20
name=3D"State"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><o:SmartTagType=20
name=3D"City"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><o:SmartTagType=20
name=3D"Street"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><o:SmartTagType=20
name=3D"address"=20
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"></o:SmartTag=
Type><!--[if !mso]>
<STYLE>st1\:* {
	BEHAVIOR: url(#default#ieooui)
}
</STYLE>
<![endif]-->
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
P {
	FONT-SIZE: 12pt; MARGIN-LEFT: 0in; MARGIN-RIGHT: 0in; FONT-FAMILY: =
"Times New Roman"; mso-margin-top-alt: auto; mso-margin-bottom-alt: =
auto
}
SPAN.EmailStyle17 {
	COLOR: windowtext; FONT-FAMILY: Arial; mso-style-type: =
personal-compose
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>What=20
VPN?&nbsp; Cisco IPSec client?&nbsp; other IPSec clients?&nbsp;=20
PoPToP?.....</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>yes it=20
matters</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>for=20
Poptop - there is a module ip_nat_pptp</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>I=20
think for IPSec there are other netfilter modules to provide VPN over a =
NAT=20
connection.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>The=20
reason why is that VPN require that the packets are not touched (they =
have a=20
checksum stored within each packet which it checks against) and NAT =
breaks that=20
- it chanegs the packet thus changing the new checksum value thus =
breaking the=20
VPN.&nbsp; </SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004>so</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D531552217-03062004>you=20
need to find out which vpn it is and you need to google if there is a =
Netfilter=20
module available for it.!</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D531552217-03062004></SPAN></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Derek Storvik=20
  [mailto:dstorvik@consultech.net]<BR><B>Sent:</B> Thursday, June 03, =
2004 12:53=20
  PM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> NAT =
and=20
  VPN<BR><BR></FONT></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I'm having trouble with =
NAT and=20
  VPN&nbsp;&nbsp; <o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">I have a linux server =
running=20
  Fedora core 1&nbsp;&nbsp; that is a NAT/FIREWALL/VLAN/DHCP server for =
a large=20
  client network.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Internet<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">&nbsp;=20
  |<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">&nbsp;=20
  |<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Linux<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">&nbsp;=20
  |<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">&nbsp;=20
  |<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Large network with many =
vlans and=20
  1000 nodes or so.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">&nbsp;The internal =
network is=20
  natted to the 10.0.0.0 network and my clients can not VPN out to the=20
  internet.&nbsp;&nbsp; Specifically they get back an error=20
  619<o:p></o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">What has to be done to =
allow VPN=20
  to traverse through the firewall and NAT?&nbsp;&nbsp; at the moment =
the=20
  firewall rules are wide open to make sure that isn't my issue.=20
  <o:p></o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial">Any help would be=20
  appreciated.<o:p></o:p></SPAN></FONT></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">----------------------------------<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">Derek Storvik<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">Network&nbsp;&amp; Systems=20
  Administrator<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">ConsulTech, =
LLC<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">Phone: =
812.323.8324<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">Fax: =
812.323.1272<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">E-mail: <A =
href=3D"mailto:dstorvik@consultech.net"><FONT=20
  face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">dstorvik@consultech.net</SPAN></FONT></A><o:p></o:p></SPAN></FONT=
></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><st1:Street w:st=3D"on"><st1:address =
w:st=3D"on"><FONT=20
  face=3D"Times New Roman" size=3D3><SPAN style=3D"FONT-SIZE: =
12pt">1441 Fenbrook=20
  Lane</SPAN></FONT></st1:address></st1:Street><o:p></o:p></P>
  <P class=3DMsoNormal><st1:place w:st=3D"on"><st1:City =
w:st=3D"on"><FONT=20
  face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt">Bloomington</SPAN></FONT></st1:City>, =
<st1:State=20
  w:st=3D"on">IN</st1:State> <st1:PostalCode=20
  w:st=3D"on">47401</st1:PostalCode></st1:place><o:p></o:p></P>
  <P><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">----------------------------------</SPAN></FONT><FONT=20
  face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3D"Times New Roman" size=3D3><SPAN=20
  style=3D"FONT-SIZE: =
12pt"><o:p>&nbsp;</o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTM=
L>
<BR>
<BR>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">Visit our website at =
http://www.p21.com/visit </FONT></B></P>

<P><B><FONT SIZE=3D2 FACE=3D"Arial">The information in this e-mail is =
confidential and may contain legally privileged information.  It is =
intended solely for the person or entity to which it is addressed.  =
Access to this e-mail by anyone else is unauthorized. If you are not =
the intended recipient, any disclosure, copying, distribution, action =
taken, or action omitted to be taken in reliance on it, is prohibited =
and may be unlawful.  If you received this e-mail in error, please =
contact the sender and delete the material from any computer. =
</FONT></B></P>
<BR>
<BR>

------_=_NextPart_001_01C4498F.E3E56870--


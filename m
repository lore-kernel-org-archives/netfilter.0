From: "Thomas Hanson" <klon@nybro.dk>
Subject: RE: is it posible to change the log output of iptables?
Date: Fri, 24 Oct 2003 15:22:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c39a31$eb4812b0$31de26c0@r58>
References: <D8FBABA1EF6F2E4DBCC88903F60691F30200C929@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C39A42.AED0E2B0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D8FBABA1EF6F2E4DBCC88903F60691F30200C929@houxchsvr.ucscorp.ucs.pvt>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'Netfilter (E-mail)'" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C39A42.AED0E2B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We only log one protocol, ICMP type 8. We do this to catch viruses =
scanning
for vurnurabilties. But this one protocol gives 2+ Gb a day log. which =
is a
little less than the amount of packets droped a day (about 2.5 Gbytes a =
day)
for that one protocol. our iptables lookes like this :
=20
-A FORWARD -p icmp -m icmp -m state -s 192.38.222.0/255.255.255.0
--icmp-type 8 --state NEW -j LOG
-A FORWARD -p icmp -m icmp -m state -s 192.38.223.0/255.255.255.0
--icmp-type 8 --state NEW -j LOG
-A FORWARD -p icmp -m icmp -m state -s 192.38.222.0/255.255.255.0
--icmp-type 8 --state NEW -j DROP
-A FORWARD -p icmp -m icmp -m state -s 192.38.223.0/255.255.255.0
--icmp-type 8 --state NEW -j DROP=20
=20
but which 600 students and about 40 computers filled with viruses this =
adds
up.
=20
Thomas
=20
=20
 -----Original Message-----
From: Hildebrand, Brian =
[mailto:BrianHildebrand@universalcomputersys.com]=20
Sent: 24. oktober 2003 15:14
To: Thomas Hanson
Cc: Netfilter (E-mail)
Subject: RE: is it posible to change the log output of iptables?


It would be better to reduce the amount of traffic you are logging. If =
you
are logging everything that gets dropped your log files are still going =
to
huge. I usually drop all the Microsoft RPC ports without logging, as =
well as
other scan ports (like skiddies scanning on 8080 for HTTP proxies).=20
=20
-----Original Message-----
From: Thomas Hanson [mailto:klon@nybro.dk]
Sent: Friday, October 24, 2003 7:59
To: netfilter@lists.netfilter.org
Subject: is it posible to change the log output of iptables?
=20
Hi,
=20
I am logging what our firewall is dropping (with the -j LOG  option), =
and
the log file is enormous (2+ Gb a day). I was wondering if it is posible =
to
define what goes into the log.
currently it gives this :
Oct 24 14:46:52 MEGALOMANIA kernel: IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth1 =
PHYSOUT=3Deth0
SRC=3D192.38.223.82 DST=3D192.38.103.193 LEN=3D92 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128
ID=3D27977 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D60760
=20
But all I am interested in is the time, src, dst and len variables,
everything else is not needed for our logging. Can you adjust this? if =
so,
how?
=20
=20
Thanks,
Thomas Hanson

----------------------------------------
The information transmitted in this message is intended only for the =
person
or entity to whom it is addressed and may contain confidential and/or
privileged material. Any review, retransmission, dissemination or other =
use
of, or taking of any action in reliance upon this information by persons =
or
entities other than the intended recipient is prohibited. If you =
received
this in error, please contact the sender and destroy any copies of this
document.=20

------=_NextPart_000_000D_01C39A42.AED0E2B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<META content=3D"Microsoft Word 9" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C39A06.C1D88660" rel=3DFile-List><!--[if gte =
mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:ForgetLastTabAlignment/>
   <w:DoNotUseHTMLParagraphAutoSpacing/>
  </w:Compatibility>
 </w:WordDocument>
</xml><![endif]-->
<STYLE>@font-face {
	font-family: Arial Black;
}
@font-face {
	font-family: Garamond;
}
@font-face {
	font-family: Tahoma;
}
@page Section1 {size: 8.5in 11.0in; margin: 1.0in 1.25in 1.0in 1.25in; =
mso-header-margin: .5in; mso-footer-margin: .5in; mso-paper-source: 0; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
H1 {
	FONT-WEIGHT: normal; FONT-SIZE: 16pt; MARGIN: 0in 0in 0pt; =
LAYOUT-GRID-MODE: line; COLOR: gray; FONT-FAMILY: "Arial Black"; =
mso-bidi-font-size: 12.0pt; mso-pagination: none; mso-outline-level: 1; =
mso-font-kerning: 0pt
}
P.MsoBodyText {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; LAYOUT-GRID-MODE: line; =
FONT-FAMILY: Garamond; mso-pagination: none; mso-fareast-font-family: =
"Times New Roman"; mso-bidi-font-family: "Times New Roman"
}
LI.MsoBodyText {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; LAYOUT-GRID-MODE: line; =
FONT-FAMILY: Garamond; mso-pagination: none; mso-fareast-font-family: =
"Times New Roman"; mso-bidi-font-family: "Times New Roman"
}
DIV.MsoBodyText {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; LAYOUT-GRID-MODE: line; =
FONT-FAMILY: Garamond; mso-pagination: none; mso-fareast-font-family: =
"Times New Roman"; mso-bidi-font-family: "Times New Roman"
}
P.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
LI.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
DIV.MsoAutoSig {
	FONT-SIZE: 12pt; MARGIN: 0in 0in 0pt; FONT-FAMILY: "Times New Roman"; =
mso-pagination: widow-orphan; mso-fareast-font-family: "Times New Roman"
}
SPAN.EmailStyle16 {
	COLOR: navy; mso-bidi-font-family: Arial; mso-style-type: =
personal-reply; mso-ansi-font-size: 10.0pt; mso-ascii-font-family: =
Arial; mso-hansi-font-family: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US style=3D"tab-interval: .5in">
<DIV><SPAN class=3D613451613-24102003><FONT face=3DArial color=3D#0000ff =
size=3D2>We=20
only log one protocol, ICMP type 8. We do this to catch viruses scanning =
for=20
vurnurabilties. But this one protocol gives 2+ Gb a day log. which is a =
little=20
less than the amount of packets droped a day (about 2.5 Gbytes a day) =
for that=20
one protocol. our iptables lookes like this :</FONT></SPAN></DIV>
<DIV><SPAN class=3D613451613-24102003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma><FONT size=3D2>-A FORWARD -p icmp -m icmp -m state -s=20
  192.38.222.0/255.255.255.0&nbsp;--icmp-type 8 --state NEW -j LOG<BR>-A =
FORWARD=20
  -p icmp -m icmp -m state -s 192.38.223.0/255.255.255.0&nbsp;<SPAN=20
  class=3D613451613-24102003><FONT face=3DArial color=3D#0000ff><FONT =
face=3DTahoma=20
  color=3D#000000>-</FONT></FONT></SPAN>-icmp-type 8 --state NEW -j =
LOG<BR>-A=20
  FORWARD -p icmp -m icmp -m state -s=20
  192.38.222.0/255.255.255.0&nbsp;--icmp-type 8 --state NEW -j =
DROP<BR>-A=20
  FORWARD -p icmp -m icmp -m state -s=20
  192.38.223.0/255.255.255.0&nbsp;--icmp-type 8 --state NEW -j DROP<SPAN =

  class=3D613451613-24102003><FONT face=3DArial=20
  color=3D#0000ff>&nbsp;</FONT></SPAN></FONT></FONT></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D613451613-24102003></SPAN></FONT></FONT>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D613451613-24102003>but which 600 students and about 40 =
computers filled=20
  with viruses this adds up.</SPAN></FONT></FONT></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D613451613-24102003></SPAN></FONT></FONT>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
  class=3D613451613-24102003>Thomas</SPAN></FONT></FONT></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2><SPAN =
class=3D613451613-24102003></SPAN></FONT>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2><SPAN =
class=3D613451613-24102003></SPAN></FONT>&nbsp;</DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2><SPAN =
class=3D613451613-24102003>&nbsp;</SPAN>-----Original=20
  Message-----<BR><B>From:</B> Hildebrand, Brian=20
  [mailto:BrianHildebrand@universalcomputersys.com] <BR><B>Sent:</B> 24. =
oktober=20
  2003 15:14<BR><B>To:</B> Thomas Hanson<BR><B>Cc:</B> Netfilter=20
  (E-mail)<BR><B>Subject:</B> RE: is it posible to change the log output =
of=20
  iptables?<BR><BR></DIV></FONT>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt">It=20
  would be better to reduce the amount of traffic you are logging. If =
you are=20
  logging everything that gets dropped your log files are still going to =
huge. I=20
  usually drop all the Microsoft RPC ports without logging, as well as =
other=20
  scan ports (like skiddies scanning on 8080 for HTTP proxies).=20
  <o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal><SPAN class=3DEmailStyle16><FONT face=3DArial =
color=3Dnavy=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-bidi-font-size: =
12.0pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></SPAN></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DTahoma =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Tahoma">-----Original=20
  Message-----<BR><B><SPAN style=3D"FONT-WEIGHT: bold">From:</SPAN></B> =
Thomas=20
  Hanson [mailto:klon@nybro.dk]<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> Friday, October 24, 2003=20
  7:59<BR><B><SPAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B>=20
  netfilter@lists.netfilter.org<BR><B><SPAN=20
  style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> is it posible to =
change the log=20
  output of iptables?</SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt"><![if =
!supportEmptyParas]><![endif]>&nbsp;<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">Hi,</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: black">&nbsp;</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">I am=20
  logging what our firewall is dropping (with the -j LOG&nbsp; option), =
and the=20
  log file is enormous (2+ Gb&nbsp;a day). I was wondering if it is =
posible to=20
  define what goes into the log.</SPAN></FONT><FONT color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial">currently =
it gives=20
  this :</SPAN></FONT><FONT color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">Oct 24=20
  14:46:52 MEGALOMANIA kernel: IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth1 =
PHYSOUT=3Deth0=20
  SRC=3D192.38.223.82 DST=3D192.38.103.193 LEN=3D92 TOS=3D0x00 =
PREC=3D0x00 TTL=3D128=20
  ID=3D27977 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 =
SEQ=3D60760</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: black">&nbsp;</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">But all=20
  I am interested in is the time, src, dst and len variables, everything =
else is=20
  not needed for our logging. Can you adjust this? if so,=20
  how?</SPAN></FONT><FONT color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: black">&nbsp;</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3D"Times =
New Roman"=20
  color=3Dblack size=3D3><SPAN=20
  style=3D"FONT-SIZE: 12pt; COLOR: black">&nbsp;</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">Thanks,</SPAN></FONT><FONT=20
  color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal style=3D"MARGIN-LEFT: 0.5in"><FONT face=3DArial =
color=3Dblack=20
  size=3D2><SPAN style=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: =
Arial">Thomas=20
  Hanson</SPAN></FONT><FONT color=3Dblack><SPAN=20
  style=3D"COLOR: black; mso-color-alt: =
windowtext"><o:p></o:p></SPAN></FONT></P></DIV>
  <P></P>
  <DIV =
name=3D"uccdisclaimer">----------------------------------------<BR>The=20
  information transmitted in this message is intended only for the =
person or=20
  entity to whom it is addressed and may contain confidential and/or =
privileged=20
  material. Any review, retransmission, dissemination or other use of, =
or taking=20
  of any action in reliance upon this information by persons or entities =
other=20
  than the intended recipient is prohibited. If you received this in =
error,=20
  please contact the sender and destroy any copies of this document.=20
</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_000D_01C39A42.AED0E2B0--



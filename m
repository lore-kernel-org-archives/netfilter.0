From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: is it posible to change the log output of iptables?
Date: Fri, 24 Oct 2003 08:13:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F30200C929@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39A30.ABC72FA2"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Thomas Hanson <klon@nybro.dk>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C39A30.ABC72FA2
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It would be better to reduce the amount of traffic you are logging. If =
you are logging everything that gets dropped your log files are still =
going to huge. I usually drop all the Microsoft RPC ports without =
logging, as well as other scan ports (like skiddies scanning on 8080 for =
HTTP proxies).=20
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
and the log file is enormous (2+ Gb a day). I was wondering if it is =
posible to define what goes into the log.
currently it gives this :
Oct 24 14:46:52 MEGALOMANIA kernel: IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth1 =
PHYSOUT=3Deth0 SRC=3D192.38.223.82 DST=3D192.38.103.193 LEN=3D92 =
TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D27977 PROTO=3DICMP TYPE=3D8 =
CODE=3D0 ID=3D512 SEQ=3D60760
=20
But all I am interested in is the time, src, dst and len variables, =
everything else is not needed for our logging. Can you adjust this? if =
so, how?
=20
=20
Thanks,
Thomas Hanson

----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

------_=_NextPart_001_01C39A30.ABC72FA2
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C39A06.C1D88660">
<title>Message</title>
<!--[if gte mso 9]><xml>
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
<style>
<!--
 /* Font Definitions */
@font-face
	{font-family:"Arial Black";
	panose-1:2 11 10 4 2 1 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
@font-face
	{font-family:Garamond;
	panose-1:2 2 4 4 3 3 1 1 8 3;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:553679495 -2147483648 8 0 66047 0;}
 /* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
h1
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:none;
	mso-outline-level:1;
	font-size:16.0pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Arial Black";
	color:gray;
	mso-font-kerning:0pt;
	layout-grid-mode:line;
	font-weight:normal;}
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:none;
	font-size:12.0pt;
	font-family:Garamond;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Times New Roman";
	layout-grid-mode:line;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle16
	{mso-style-type:personal-reply;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
</head>

<body lang=3DEN-US style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>It=
 would
be better to reduce the amount of traffic you are logging. If you are =
logging
everything that gets dropped your log files are still going to huge. I =
usually
drop all the Microsoft RPC ports without logging, as well as other scan =
ports
(like skiddies scanning on 8080 for HTTP proxies). =
<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle16><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Thomas Hanson
[mailto:klon@nybro.dk]<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Friday, October 24, =
2003
7:59<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> is it posible to =
change
the log output of iptables?</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Hi,</span></font=
><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>I am
logging what our firewall is dropping (with the -j LOG&nbsp; option), =
and the
log file is enormous (2+ Gb&nbsp;a day). I was wondering if it is =
posible to
define what goes into the log.</span></font><font color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>currently
it gives this :</span></font><font color=3Dblack><span =
style=3D'color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Oct 24
14:46:52 MEGALOMANIA kernel: IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth1 =
PHYSOUT=3Deth0
SRC=3D192.38.223.82 DST=3D192.38.103.193 LEN=3D92 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D27977
PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D512 SEQ=3D60760</span></font><font =
color=3Dblack><span
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>But all
I am interested in is the time, src, dst and len variables, everything =
else is
not needed for our logging. Can you adjust this? if so, =
how?</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Thanks,</span></=
font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:black'>Thomas
Hanson</span></font><font color=3Dblack><span =
style=3D'color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

</div>


<p></p>
<DIV name=3Duccdisclaimer>
----------------------------------------<br>The information transmitted =
in this message is intended only for the person or entity to whom it is =
addressed and may contain confidential and/or privileged material.  Any =
review, retransmission, dissemination or other use of, or taking of any =
action in reliance upon this information by persons or entities other =
than the intended recipient is prohibited.  If you received this in =
error, please contact the sender and destroy any copies of this =
document.
</DIV>
</body>

</html>

------_=_NextPart_001_01C39A30.ABC72FA2--


From: "Omar Castaneda Acosta" <omar@idea.com.mx>
Subject: RE: ftp forward to internal machine
Date: Tue, 4 Jun 2002 16:23:44 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3A5DC36EC1506C40825C05BE65E62AEF0E8B29@neptuno.idea.com.mx>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20C16.7D0C3AC4"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Travis Crook <travis@visionsbeyond.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C20C16.7D0C3AC4
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Why do you have 2 PREROUTING chains?
=20
These chains are correct, be sure your ftp NAT modules are loaded with
lsmod (ip_conntrack_ftp & ip_nat_ftp)
=20
FTPSERVER=3D192.168.2.5
SERVICE=3D21
INTIP=3D192.168.2.254
EXTIP=3D1.2.3.4
=20
#
# Let's forward traffic with destination $EXTIP to somewhere else, you
can discard the -i $EXTIF if you want
# other interfaces to access the service
#
$IPTABLES -A PREROUTING -t nat -i $EXTIF -p tcp -d $EXTIP --dport
$SERVICE -j DNAT --to-destination $FTPSERVER
#
# Not really necessary if the default gateway on the FTP server is the
INTIP on the firewall
#
$IPTABLES -A POSTROUTING -t nat -o $INTIF -p tcp -d $FTPSERVER --dport
$SERVICE -j SNAT --to-source $INTIP
#
# A MUST, unless your FORWARD policy is default to ACCEPT
#
$IPTABLES -A FORWARD -i $EXTIF -o $EXTIF -p tcp --dport $SERVICE -m
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#
# Just in case your INTERNAL policy is default to DROP
#
$IPTABLES -A FORWARD -o $EXTIF -i $EXTIF -p tcp --dport $SERVICE -m
state --state ESTABLISHED,RELATED -j ACCEPT
=20
-- Omar
=20
-----Original Message-----
From: Travis Crook [mailto:travis@visionsbeyond.com]
Sent: Tuesday, June 04, 2002 4:00 PM
To: netfilter@lists.samba.org
Subject: ftp forward to internal machine
=20
Hello everyone,
    I have a firewall configured to forward port 80 traffic to an
internal machine.  I was wondering if the same thing is possible with
ftp traffic.  The rules I am using are as follows:
=20
iptables -A PREROUTING -t nat -i EXTINF -p tcp -d 1.2.3.4 --dport 21 -j
DNAT --to 192.168.2.5:21
=20
iptables -A FORWARD -i EXTINF -p tcp -d 192.168.2.5 --dport 21 ACCEPT
=20
iptables -A FORWARD -i EXTINF -o INTIF -p tcp --dport 21 -m state
--state NEW,ESTABLISHED,RELATED -j ACCEPT
=20
iptables -t nat -A PREROUTING -i EXTINF -p tcp --dport 21 -d 1.2.3.4 -j
DNAT --to-destination 192.168.2.5:21
=20
iptables -t nat -A POSTROUTING -o INTIF -p tcp --dport 21 -d 192.168.2.5
-j SNAT --to-source 192.168.2.254
=20
I can connect to the ftp server but then I cannot establish a data
channel between the client and the server.=20
=20
Any help would be appreciated.  If you want to see output of anything I
can include it.
=20
Thanks
=20
Travis Crook
Visions Beyond

------_=_NextPart_001_01C20C16.7D0C3AC4
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 9">
<meta name=3DOriginator content=3D"Microsoft Word 9">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C20BE4.326E1780">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:ActiveWritingStyle Lang=3D"EN-US" VendorID=3D"64" =
DLLVersion=3D"131077"=20
   NLCheck=3D"1">1</w:ActiveWritingStyle>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle15
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
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1027"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body bgcolor=3Dwhite lang=3DEN-US style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>Why do you have 2 PREROUTING =
chains?<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>These chains are correct, be sure your ftp =
NAT
modules are loaded with lsmod (ip_conntrack_ftp &amp; =
ip_nat_ftp)<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'><![if =
!supportEmptyParas]>&nbsp;<![endif]></span></font></span><span
class=3DEmailStyle15><font size=3D2 color=3Dnavy face=3D"Courier =
New"><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:"Courier =
New";
color:navy;mso-color-alt:windowtext'><o:p></o:p></span></font></span></p>=


<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier =
New"'>FTPSERVER=3D192.168.2.5<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier =
New"'>SERVICE=3D21<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier =
New"'>INTIP=3D192.168.2.254<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier =
New"'>EXTIP=3D1.2.3.4<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'># Let&#8217;s forward traffic with =
destination $EXTIP to
somewhere else, you can discard the &#8211;i $EXTIF if you =
want<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'># other interfaces to access the =
service<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>$IPTABLES &#8211;A PREROUTING &#8211;t nat =
&#8211;i $EXTIF &#8211;p tcp &#8211;d $EXTIP
&#8211;-dport $SERVICE &#8211;j DNAT &#8211;-to-destination =
$FTPSERVER<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#</span></font></span><span =
class=3DEmailStyle15><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial'><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'># Not really necessary if the default gateway =
on the
FTP server is the INTIP on the =
firewall<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>$IPTABLES &#8211;A POSTROUTING &#8211;t nat =
&#8211;o $INTIF &#8211;p tcp &#8211;d $FTPSERVER
&#8211;-dport $SERVICE &#8211;j SNAT &#8211;-to-source =
$INTIP<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#</span></font></span><span =
class=3DEmailStyle15><font
size=3D2 color=3Dnavy face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:"Courier =
New";color:navy;mso-color-alt:windowtext'><o:p></o:p></span></font></span=
></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'># A MUST, unless your FORWARD policy is =
default to
ACCEPT</span></font></span><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier =
New";color:navy;mso-color-alt:windowtext'><o:p></o:p></span></font></span=
></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>#</span></font></span><span =
class=3DEmailStyle15><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:
12.0pt;font-family:Arial'><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>$IPTABLES &#8211;A FORWARD &#8211;i $EXTIF =
&#8211;o $EXTIF &#8211;p tcp &#8211;-dport
$SERVICE &#8211;m state &#8211;-state NEW,ESTABLISHED,RELATED &#8211;j =
ACCEPT<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>#<=
o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'># Just in case your INTERNAL policy is =
default to
DROP<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>#<=
o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>$IPTABLES &#8211;A FORWARD &#8211;o $EXTIF =
&#8211;i $EXTIF &#8211;p tcp &#8211;-dport
$SERVICE &#8211;m state &#8211;-state ESTABLISHED,RELATED &#8211;j =
ACCEPT<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy
face=3D"Courier New"><span =
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;
font-family:"Courier New"'>-- Omar<o:p></o:p></span></font></span></p>

<p class=3DMsoNormal><span class=3DEmailStyle15><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><!=
[if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dblack
face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Travis Crook =
[mailto:travis@visionsbeyond.com]<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, June 04, =
2002 4:00
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.samba.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> ftp forward to =
internal
machine</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><![if =
!supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>Hello
everyone,</span></font><font color=3Dblack><span =
style=3D'color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>&nbsp;&nbsp;&nbsp;
I have a firewall configured to forward port 80 traffic to an internal
machine.&nbsp; I was wondering if the same thing is possible with ftp
traffic.&nbsp; The rules I am using are as follows:</span></font><font
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
style=3D'font-size:12.0pt;color:black'>iptables -A
PREROUTING -t nat -i EXTINF -p tcp -d 1.2.3.4 --dport 21 -j DNAT --to
192.168.2.5:21</span></font><font color=3Dblack><span =
style=3D'color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

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
style=3D'font-size:12.0pt;color:black'>iptables -A
FORWARD -i EXTINF -p tcp -d 192.168.2.5 --dport 21 =
ACCEPT</span></font><font
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
style=3D'font-size:12.0pt;color:black'>iptables -A
FORWARD -i EXTINF -o INTIF -p tcp --dport 21 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT</span></font><font color=3Dblack><span
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
style=3D'font-size:12.0pt;color:black'>iptables -t
nat -A PREROUTING -i EXTINF -p tcp --dport 21 -d 1.2.3.4 -j DNAT
--to-destination 192.168.2.5:21</span></font><font color=3Dblack><span
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
style=3D'font-size:12.0pt;color:black'>iptables -t
nat -A POSTROUTING -o INTIF -p tcp --dport 21 -d 192.168.2.5 -j SNAT
--to-source 192.168.2.254</span></font><font color=3Dblack><span
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
face=3D"Times New Roman"><span style=3D'font-size:12.0pt;color:black'>I =
can connect
to the ftp server but then I cannot establish a data channel between the =
client
and the server. </span></font><font color=3Dblack><span =
style=3D'color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

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
style=3D'font-size:12.0pt;color:black'>Any help
would be appreciated.&nbsp; If you want to see output of anything I can =
include
it.</span></font><font color=3Dblack><span =
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
style=3D'font-size:12.0pt;color:black'>Thanks</span></font><font
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
style=3D'font-size:12.0pt;color:black'>Travis Crook</span></font><font
color=3Dblack><span =
style=3D'color:black;mso-color-alt:windowtext'><o:p></o:p></span></font><=
/p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
color=3Dblack
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:black'>Visions
Beyond</span></font><font color=3Dblack><span =
style=3D'color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C20C16.7D0C3AC4--


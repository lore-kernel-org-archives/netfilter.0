From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: HTTP Port forwarding issues
Date: Mon, 08 Jul 2002 12:50:19 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPIENPCHAA.stewart.thompson@shaw.ca>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_Wk6mwNeEvenmBcu6h5cecg)"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Big Daddy <bigdaddy@monster-solutions.net>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

--Boundary_(ID_Wk6mwNeEvenmBcu6h5cecg)
Content-type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Try changing your NEW statement to NEW, ESTABLISHED, RELATED and see if that
helps your situation.

Stu=85=85


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Big Daddy
Sent: July 8, 2002 12:38 PM
To: netfilter@lists.samba.org
Subject: HTTP Port forwarding issues

all,
     for some reason i can get my smtp and pop3 to route from the  internet,
but i cannot get http requests to forward correctly.
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m
state --state NEW -j ACCEPT
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport smtp -m
state --state NEW -j ACCEPT (works)
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport pop3 -m
state --state NEW -j ACCEPT (works)

 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport smtp -j
DNAT --to-destination $int_smtp:25 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport pop3 -j
DNAT --to-destination $int_pop3:110 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j
DNAT --to-destination $int_http:80

 web server is running IIS5.
any help would be great!
Big D@ddy <mailto:D@ddy>

--Boundary_(ID_Wk6mwNeEvenmBcu6h5cecg)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 9">
<meta name=Originator content="Microsoft Word 9">
<link rel=File-List href="cid:filelist.xml@01C2267E.03AF2560">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>0</w:Zoom>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:DrawingGridHorizontalSpacing>9.35 pt</w:DrawingGridHorizontalSpacing>
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
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.EmailStyle17
	{mso-style-type:personal-reply;
	mso-ansi-font-size:10.0pt;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:2.0cm 1.0cm 2.0cm 2.0cm;
	mso-header-margin:35.45pt;
	mso-footer-margin:2.0cm;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1027"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body bgcolor=white lang=EN-CA link=blue vlink=blue style='tab-interval:36.0pt'>

<div class=Section1>

<p class=MsoNormal><span class=EmailStyle17><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Try
changing your NEW statement to NEW, ESTABLISHED, RELATED and see if that helps
your situation.<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle17><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle17><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Stu&#8230;&#8230;<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle17><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle17><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Tahoma><span style='font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style='font-weight:bold'>From:</span></b>
netfilter-admin@lists.samba.org [mailto:netfilter-admin@lists.samba.org]<b><span
style='font-weight:bold'>On Behalf Of </span></b>Big Daddy<br>
<b><span style='font-weight:bold'>Sent:</span></b> July 8, 2002 12:38 PM<br>
<b><span style='font-weight:bold'>To:</span></b> netfilter@lists.samba.org<br>
<b><span style='font-weight:bold'>Subject:</span></b> HTTP Port forwarding
issues</span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3
face="Times New Roman"><span style='font-size:12.0pt'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>all,<br>
&nbsp;&nbsp;&nbsp;&nbsp; for some reason i can get my smtp and pop3 to route
from the&nbsp;&nbsp;internet, but i cannot get http requests to forward
correctly.</span></font><font color=black><span style='color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;iptables
-A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m state --state NEW
-j ACCEPT<br>
&nbsp;iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport smtp -m
state --state NEW -j ACCEPT (works)<br>
&nbsp;iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport pop3 -m
state --state NEW -j ACCEPT (works)<br>
<br>
&nbsp;iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport smtp -j DNAT
--to-destination $int_smtp:25 (works)<br>
&nbsp;iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport pop3 -j DNAT
--to-destination $int_pop3:110 (works)<br>
&nbsp;iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j DNAT
--to-destination $int_http:80<br>
<br>
&nbsp;web server is running IIS5.<br>
any help would be great!<br>
Big <a href="mailto:D@ddy">D@ddy</a></span></font><font color=black><span
style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

</div>

</body>

</html>

--Boundary_(ID_Wk6mwNeEvenmBcu6h5cecg)--


From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: port forward using iptables not happening
Date: Fri, 05 Jul 2002 00:48:00 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPKEKCCHAA.stewart.thompson@shaw.ca>
References: <001e01c223ef$7bdc0d50$0805010a@gecs.net>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_S9s4USvJPnDSktWk4Y/AlQ)"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001e01c223ef$7bdc0d50$0805010a@gecs.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

--Boundary_(ID_S9s4USvJPnDSktWk4Y/AlQ)
Content-type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Deepali:

            Questions:

            1) Is packet forwarding enabled networking?
            2) Is this your full rule set?
            3) What is your forward policy/rules? DNAT/SNAT is not enough if
you don=92t forward it.


Do a iptables =96L =96v, and post it to the group. Also your full rule set.

Stu=85=85=85.


-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of deepali
Sent: July 4, 2002 11:45 PM
To: netfilter@lists.samba.org
Subject: port forward using iptables not happening

Dear Support
My setup is ..I have one linux box having eth0(valid ip202.140.152.33) and
eth1(invalid ip-local lan192.168.220.250) .I have one more machine in my
Local Lan (192.168.220.90) which is a mail server in my local LAN.Now I want
to
1.enable port forwarding ie any request comming on 202.140.152.33 port 285
should get forwarded to 192.168.220.90 port 25 my mail server.

2.Also any request comming from my lan ie 192.168.220.0/24 to invalid ip of
linux box ie 192.168.220.90 285 should also forwarded to my Mail server in
lan ie 192.168.220.30 port 25.

My first synario is also not working.

my rules are

iptables -t nat -A PREROUTING -i eth0 -p tcp -d 202.140.136.90 --dport
285 -j DNAT 182.168.220.90:25

iptables -t nat -A POSTROUTING  -o eth0 -j MASQURADE
iptables -t nat -A POSTROUTING -s 192.168.220.0/24 -j MASQURADE

Pls help


Thanks and Regards
Deepali


--Boundary_(ID_S9s4USvJPnDSktWk4Y/AlQ)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 9">
<meta name=Originator content="Microsoft Word 9">
<link rel=File-List href="cid:filelist.xml@01C223BD.9C709450">
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0cm;
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

<body bgcolor=white lang=EN-CA style='tab-interval:36.0pt'>

<div class=Section1>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Hi
Deepali:<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Questions:<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>1)
Is packet forwarding enabled networking?<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>2)
Is this your full rule set?<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>3)
What is your forward policy/rules? DNAT/SNAT is not enough if you don&#8217;t forward
it.<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Do a
iptables &#8211;L &#8211;v, and post it to the group. Also your full rule set.<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Stu&#8230;&#8230;&#8230;.<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Tahoma><span style='font-size:10.0pt;font-family:Tahoma;color:black'>-----Original
Message-----<br>
<b><span style='font-weight:bold'>From:</span></b>
netfilter-admin@lists.samba.org [mailto:netfilter-admin@lists.samba.org]<b><span
style='font-weight:bold'>On Behalf Of </span></b>deepali<br>
<b><span style='font-weight:bold'>Sent:</span></b> July 4, 2002 11:45 PM<br>
<b><span style='font-weight:bold'>To:</span></b> netfilter@lists.samba.org<br>
<b><span style='font-weight:bold'>Subject:</span></b> port forward using
iptables not happening</span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3
face="Times New Roman"><span style='font-size:12.0pt'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>Dear
Support</span></font><font color=black><span style='color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>My
setup is ..I have one linux box having eth0(valid ip202.140.152.33) and
eth1(invalid ip-local lan192.168.220.250) .I have one more machine in my Local
Lan (192.168.220.90) which is a mail server in my local LAN.Now I want to </span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>1.enable
port forwarding ie any request comming on 202.140.152.33 port 285 should get
forwarded to 192.168.220.90 port 25 my mail server.</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>2.Also
any request comming from my lan ie 192.168.220.0/24 to invalid ip of linux box
ie 192.168.220.90 285 should also forwarded to my Mail server in lan ie
192.168.220.30 port 25.</span></font><font color=black><span style='color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>My
first synario is also not working.</span></font><font color=black><span
style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>my
rules are</span></font><font color=black><span style='color:black;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>iptables
-t nat -A PREROUTING&nbsp;-i eth0 -p tcp -d 202.140.136.90 --dport 285 -j DNAT
182.168.220.90:25</span></font><font color=black><span style='color:black;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color=black
face="Times New Roman"><span style='font-size:12.0pt;color:black'>&nbsp;</span></font><font
color=black><span style='color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>iptables
-t nat -A POSTROUTING&nbsp; -o eth0 -j MASQURADE</span></font><font size=2
color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>iptables
-t nat -A POSTROUTING -s 192.168.220.0/24 -j MASQURADE</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>&nbsp;</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>Pls
help</span></font><font size=2 color=black face=Arial><span style='font-size:
10.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>&nbsp;</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>&nbsp;</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>Thanks
and Regards</span></font><font size=2 color=black face=Arial><span
style='font-size:10.0pt;font-family:Arial;color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>Deepali</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color=black
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:black'>&nbsp;</span></font><font
size=2 color=black face=Arial><span style='font-size:10.0pt;font-family:Arial;
color:black;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

</div>

</body>

</html>

--Boundary_(ID_S9s4USvJPnDSktWk4Y/AlQ)--


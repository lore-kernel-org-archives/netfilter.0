From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: Doubt about DNAT
Date: Tue, 10 Sep 2002 13:27:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPIEDHCOAA.stewart.thompson@shaw.ca>
References: <009d01c258d4$aadbfc90$0100a8c0@desktop>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="Boundary_(ID_VO5l4Wm0rWt4xIOISR224A)"
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <009d01c258d4$aadbfc90$0100a8c0@desktop>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Rodrigo Leme de Mello <rodrigo@idg.com.br>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

--Boundary_(ID_VO5l4Wm0rWt4xIOISR224A)
Content-type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo:

            Do you have a Forward rule to match the Prerouting rule?
Is your SQL server on the Internal Net expecting connections on
Port 1433?

Stu=85=85=85


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Rodrigo Leme de
Mello
Sent: September 10, 2002 7:17 AM
To: netfilter@lists.samba.org
Subject: Doubt about DNAT

Hi all,

I am in trouble to do a rule. Anybody can help me?

I want to redirect all traffic from a specific valid ip and specific
destination port to a machine located inside a LAN.

This rule is to access SQL Server that is located inside a LAN and i have a
valid ip address in a linux machine with iptables.

I've tried the following:

Lan IP with SQL Server: 192.168.0.10
Valid IP with iptables: 200.221.98.123
Valid IP that will acess SQL Server. 200.206.123.112

This rule i've put in the machine 200.221.98.123

iptables -t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j
DNAT --to 192.168.0.10

And now i configure my SQL Server to connect to 200.221.98.123 but i still
can't connect. Dou you have any idea why it is not working?

The ip's i've mentioned are just for example.

Thanks a lot

Rodrigo







--Boundary_(ID_VO5l4Wm0rWt4xIOISR224A)
Content-type: text/html; charset=iso-8859-1
Content-transfer-encoding: 7BIT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 9">
<meta name=Originator content="Microsoft Word 9">
<link rel=File-List href="cid:filelist.xml@01C258CD.D58AF970">
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
Rodrigo:<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><span
style='mso-tab-count:1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Do
you have a Forward rule to match the Prerouting rule?<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Is your
SQL server on the Internal Net expecting connections on<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Port 1433?<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'>Stu&#8230;&#8230;&#8230;<o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal><span class=EmailStyle15><font size=2 color=navy face=Arial><span
style='font-size:10.0pt;mso-bidi-font-size:12.0pt;font-family:Arial'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></span></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Tahoma><span style='font-size:10.0pt;font-family:Tahoma;color:#060606'>-----Original
Message-----<br>
<b><span style='font-weight:bold'>From:</span></b>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]<b><span style='font-weight:bold'>On
Behalf Of </span></b>Rodrigo Leme de Mello<br>
<b><span style='font-weight:bold'>Sent:</span></b> September 10, 2002 7:17 AM<br>
<b><span style='font-weight:bold'>To:</span></b> netfilter@lists.samba.org<br>
<b><span style='font-weight:bold'>Subject:</span></b> Doubt about DNAT</span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3
face="Times New Roman"><span style='font-size:12.0pt'><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Hi
all,</span></font><font color="#060606"><span style='color:#060606;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>I am
in trouble to do a rule. Anybody can help me?</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>I
want to redirect all traffic from a specific valid ip and specific destination
port to a machine located inside a LAN.</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>This
rule is to access SQL Server that is located inside a LAN and i have a valid ip
address in a linux machine with iptables.</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>I've
tried the following:</span></font><font color="#060606"><span style='color:
#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Lan
IP with SQL Server: 192.168.0.10</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Valid
IP with iptables: 200.221.98.123</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Valid
IP that will acess SQL Server. 200.206.123.112</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>This
rule i've put in the machine 200.221.98.123</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>iptables
-t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j DNAT --to
192.168.0.10</span></font><font color="#060606"><span style='color:#060606;
mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>And
now i configure my SQL Server to connect to 200.221.98.123 but i still can't
connect. Dou you have any idea why it is not working?</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>The
ip's i've mentioned are just for example.</span></font><font color="#060606"><span
style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Thanks
a lot</span></font><font color="#060606"><span style='color:#060606;mso-color-alt:
windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=2 color="#060606"
face=Arial><span style='font-size:10.0pt;font-family:Arial;color:#060606'>Rodrigo</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

<p class=MsoNormal style='margin-left:36.0pt'><font size=3 color="#060606"
face="Times New Roman"><span style='font-size:12.0pt;color:#060606'>&nbsp;</span></font><font
color="#060606"><span style='color:#060606;mso-color-alt:windowtext'><o:p></o:p></span></font></p>

</div>

</body>

</html>

--Boundary_(ID_VO5l4Wm0rWt4xIOISR224A)--


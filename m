From: "IZEM Farid" <Farid.IZEM@abxlogistics.fr>
Subject: Problem or not on SNAT and Forwarding Rules
Date: Wed, 7 Jul 2004 18:36:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B732FD42D68974438C1451C73C1D030FD1F573@FR92EX02.eu.abxlogistics.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C46440.B6FD4629"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

------_=_NextPart_001_01C46440.B6FD4629
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

=20

I'm currently experiencing some problems with SNAT=20

And I think I made a bad configuration in order to have that problem.

=20

We have the following situation:=20

=20

            MYCLIENT --> MYFIREWALL --> CUSTOMERFIREWALL --> =
CLIENT-CUSTOMER

=20

MyClient ip address is: 192.168.1.12

MyClient ip address is source nated: 172.19.93.101

Client-Customer ip address is: 172.19.92.100

=20

I have implemented the following rules:=20

=20

            Iptables -A POSTROUTING -s 192.168.1.12 -d =
172.19.92.0/255.255.255.0 -p tcp -m tcp -j SNAT --to-source =
172.19.93.101=20

Iptables -A TBTSNAT -s 172.19.92.100 -d 192.168.1.12 -i eth0 -o eth1 -p =
tcp -m tcp --sport 10040 --dport 1023:65535 -j ACCEPT

Iptables -A FORWARD -j TBTSNAT

=20

I think I should be because of SNAT occurs after the forwarding rules :=20

            Iptables -A POSTROUTING -s 192.168.1.12 -d =
172.19.92.0/255.255.255.0 -p tcp -m tcp -j SNAT --to-source =
172.19.93.101

            Iptables -A TBTSNAT -s 172.19.92.100 -d 172.19.93.101 -i =
eth0 -o eth1 -p tcp -m tcp --sport 10040 --dport 1023:65535 -j ACCEPT

            Iptables -A FORWARD -j TBTSNAT

=20

I'm wrong?

=20

Thanks you for you help,

=20

Best regards

=20

Farid IZEM

Ing=E9nieur Syst=E8me Unix

Soci=E9t=E9 ABX Logistics France

48-50, route principale du port

92232 Gennevilliers

T=E9l. : 01-41-47-61-78

Email : farid.izem@abxlogistics.fr

=20


------_=_NextPart_001_01C46440.B6FD4629
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PersonName"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DFR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi all,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I&#8217;m currently experiencing some problems =
with
SNAT <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>And I think I made a bad configuration in =
order to
have that problem.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>We have the following situation: =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MYCLIENT =
</span></font><font size=3D2
face=3DWingdings><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Wingdings'>=E0</span></font><font
size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'> MYFIREWALL
</span></font><font size=3D2 face=3DWingdings><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Wingdings'>=E0</span></font><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'> =
CUSTOMERFIREWALL </span></font><font
size=3D2 face=3DWingdings><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:
Wingdings'>=E0</span></font><font size=3D2 face=3DArial><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial'> =
CLIENT-CUSTOMER<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>MyClient ip address is: =
192.168.1.12<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>MyClient ip address is source nated: =
172.19.93.101<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Client-Customer ip address is: =
172.19.92.100<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I have implemented the following rules: =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Iptables -A =
POSTROUTING -s 192.168.1.12 -d
172.19.92.0/255.255.255.0 -p tcp -m tcp -j SNAT --to-source =
172.19.93.101 <o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Iptables -A =
TBTSNAT -s 172.19.92.100
-d 192.168.1.12 -i eth0 -o eth1 -p tcp -m tcp --sport 10040 --dport =
1023:65535 -j
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-indent:35.4pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>Iptables -A =
FORWARD -j
TBTSNAT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I think I should be because of SNAT occurs =
after the
forwarding rules : <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Iptables -A =
POSTROUTING -s 192.168.1.12 -d
172.19.92.0/255.255.255.0 -p tcp -m tcp -j SNAT --to-source =
172.19.93.101<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Iptables -A =
TBTSNAT -s 172.19.92.100 -d 172.19.93.101
-i eth0 -o eth1 -p tcp -m tcp --sport 10040 --dport 1023:65535 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Iptables -A =
FORWARD -j TBTSNAT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I&#8217;m wrong?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks you for you =
help,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Best regards<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Farid IZEM</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Ing=E9nieur Syst=E8me =
Unix</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Soci=E9t=E9 ABX Logistics =
France</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>48-50, route principale du =
port</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>92232 Gennevilliers</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>T=E9l. : 01-41-47-61-78</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Email : <st1:PersonName =
w:st=3D"on">farid.izem@abxlogistics.fr</st1:PersonName></span></font><o:p=
></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C46440.B6FD4629--


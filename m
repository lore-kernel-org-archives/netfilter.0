From: "Russell Seymour" <russell.seymour@energis.com>
Subject: Linux Gateway/Firewall with NAT
Date: Wed, 26 Jun 2002 12:34:36 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <057638BF9D8C4045B3D809250015FA62A4FCF8@EXCL-GRL-01V1.mas.corp.energis.com>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----_=_NextPart_001_01C21D05.7305418C";
	type="multipart/alternative"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C21D05.7305418C
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C21D05.7305418C"


------_=_NextPart_002_01C21D05.7305418C
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Afternoon to everyone,

=20

I am trying to work out how to use iptables to create a firewall/gateway
on Red Hat Linux and I having problems trying to isolate how to do what
I need to do (hope that makes sense).

=20

I have a DSL router that goes into one interface on the Linux box
(external), the other interface on this box is connected to the internal
LAN.

=20

I (think) have worked out how to use iptables to setup a simple NAT
relationship from the IP address on the external card to the internal so
that I can use the internet on the LAN.

=20

However I have an SMTP server in the internal LAN and I have an mx
record for it on the internet.  What I want to do is put another IP
address on the external interface (virtual IP??) and have that NAT'ed
through to the internal IP address for the mail server on ports 25, 110,
389, 3389.

Also all traffic is allowed outbound, but only selected services are
allowed inbound for the primary external IP address.

=20

Here are the questions:

=20

1.	Is this a possible setup using Linux and iptables?
2.	If the answer to 1 is yes then can someone point me in the right
direction in terms of what I need to do?

=20

If anymore information is required then please let me know.  Any help is
greatly appreciated.

=20

Regards,

=20

Russell Seymour

Boots Support Team

=20

Melbourne Street

Leeds, LS2 7PS

=20

Tel - 0113 234 5100 (switchboard)

Mob - 07800 022218

=20


------_=_NextPart_002_01C21D05.7305418C
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Afternoon to everyone,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I am trying to work out how to use iptables to =
create
a firewall/gateway on Red Hat Linux and I having problems trying to =
isolate how
to do what I need to do (hope that makes sense).</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I have a DSL router that goes into one =
interface on
the Linux box (external), the other interface on this box is connected =
to the internal
LAN.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I (think) have worked out how to use iptables =
to
setup a simple NAT relationship from the IP address on the external card =
to the
internal so that I can use the internet on the LAN.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>However I have an SMTP server in the internal =
LAN and
I have an mx record for it on the internet.&nbsp; What I want to do is =
put
another IP address on the external interface (virtual IP??) and have =
that NAT&#8217;ed
through to the internal IP address for the mail server on ports 25, 110, =
389, 3389.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Also all traffic is allowed outbound, but only
selected services are allowed inbound for the primary external IP =
address.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Here are the questions:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<ol start=3D1 type=3D1>
 <li class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
     10.0pt;font-family:Arial'>Is this a possible setup using Linux and =
iptables?</span></font></li>
 <li class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
     10.0pt;font-family:Arial'>If the answer to 1 is yes then can =
someone point
     me in the right direction in terms of what I need to =
do?</span></font></li>
</ol>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>If anymore information is required then please =
let me
know.&nbsp; Any help is greatly appreciated.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Regards,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Russell =
Seymour</span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Boots Support =
Team</span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3D"Times New =
Roman"><span
lang=3DEN-GB style=3D'font-size:12.0pt;color:navy'><img width=3D150 =
height=3D40
src=3D"cid:image001.gif@01C21D0D.D3E97CF0" alt=3D"Energis Squared" =
border=3D0></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
  style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Melbourne =
Street</span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
  =
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Leeds</span></fo=
nt><font
 size=3D2 color=3Dnavy face=3DTahoma><span lang=3DEN-GB =
style=3D'font-size:10.0pt;
 font-family:Tahoma;color:navy'>, </span></font><font size=3D2 =
color=3Dnavy
  face=3DTahoma><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Tahoma;
  color:navy'>LS2 7PS</span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>&nbsp;</span></f=
ont></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Tel - 0113 234 =
5100
(switchboard)</span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DTahoma><span =
lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Tahoma;color:navy'>Mob - 07800 =
022218</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-GB
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------_=_NextPart_002_01C21D05.7305418C--

------_=_NextPart_001_01C21D05.7305418C
Content-Type: image/gif;
	name="image001.gif"
Content-Transfer-Encoding: base64
Content-ID: <image001.gif@01C21D0D.D3E97CF0>
Content-Description: image001.gif
Content-Location: image001.gif

R0lGODlhlgAoAMQAAADGjgLLlhLOnhHQnyjQnRnRoyDPoSbTqDXWrDvYsVDbt27du2Hgv1/ewGLf
wGnhw3jkyIffvo/o0Krr2Ljx4sbt3Mvv4cn06dX169z48eX27uj69f///wAAAAAAAAAAACH+HFVs
ZWFkIEdJRiBTbWFydFNhdmVyIFZlciAyLjAALAAAAACWACgAAAX/ICeOZGmeaKqubOu+6TZNUj1Z
G6zvfO//JgzkEAgcEEiEQoIBOp/Q6AqjCCgmmI1Wg6FJKjmpeEx+VRYSDWpTmYXL8HhZy7JMKvJ8
fpLRc9gVTX6DUVUFgnkYgTxvhI4bRQASfooWLxMPCglICg8TjoSGiHJdeCwSBwoQFBetFBAKB5Og
enx+MlgrFwgJFCkUm6O0MBkXjcMkFQoRaikTBbMyCrEHBQkSORIFviMbFBRvFxLTDkwqGePUBUvH
3uAjFBITxxMKBUfVD9xBrCfimareqdDQpgaEBQghSFiggMACLMdEUAjwiQMqWRcwYKBQ5cAnCQEQ
QQggiQOVIigD/xSoaAKCAAQSMl6oZ2SfRQAAIJhEgFLBiAyG5pl8UGSJhG99OBwAECCpiA1VHMwg
akTY03pEAgi4h6RayiIGlEBAtEHWn6gnQAaYhGoE1VUqjdpDaZNDBp46WxbZNzIAhA0FCqTMgWHp
oRJ9UzL4IzhkN542KQjwa0JDhKJfMGjIsaELQnleYsFsNu3P0gUpqgS4wEGVCKpEHpTAkKDIARKF
KaMgUiBpXwUwLRYpIILn2hNZDzhQwBpwEUQLcpoA6XN2FQXCOtPIpaJwDgUADkQcodbnBfEcqAaQ
HaTxPiIIVLwVkTgvh3hN1N5Oa5uEc8emlWRCJyZIg0AEM3gBmv9VJzwg2wRFzIKCasS1Ngls47UW
oQhqSXhCbQHEx0FfBYynWnUmXIASWY0JomIACZxAh4xdJDiDZi8cwJpxq3zjIwUTQABiEazVk15R
KaglW1kR/uhjkMapRB+SJ6jGngkZZLXPf4Jk0NgDGZIBjF0pHWDmmWYGdiYCTRR2pG78WXEfSveg
eaaaZlbXl30lWImCl3t10+IIqqlkTh6wzBnAAOBo4eijj46AQAZ7JomkWgUYA+mmM1baYBEx+oOS
U1z+lNVwCtQ1BoGY7tCLp3H6pJ8OsJYwkUrjqSXiU4N2ox5KCLBWhmsQqsSgCq8WwWcJ5QknJQy1
9rlhCf+xxNj/cylC0BhdZTzQgKIBqLpCAhdES0KzxQYQ5gnmmhpoN6otW6qMEkRZIhnj/IHSsits
gMAG7XKI5IvHvRCwCEAp+w0qRnjIK7YqJOYwFFnmACJ6LlAQ33woNMuBcaG6cDChKnGizxq9TiCs
XnKSsQQH6fKbAgSycRyrwEVYu8LItBXMwrzWrDEZimLUK8KQOlMLplKs2TwdlRxse6wIF7B3MAWC
JR3DoC86VUJscHjEwQWT5YzCebLl+6bMOKN4a00oPDNLwBmgdJSTrFjl3GEvTkzmanA8k8PbVth0
wXUmZfqaspa2jHMRD6w8dhVXBozBV5gHhsBfgkIs2AFei8CA83RxDEH1kLYhIJgAsxxgH1VXPu24
RFGqZOZwHo4EQOwlPIP57wcIMu8Ekx3AjTdV+L3qvxwWattYdilxrplaS2TmxBtIgHqIEoTOUaoq
QLjONA9IAIEDte8Ky9IiYFBvAbwgoJzkcjywEgmtGDPCBAfwDsUG+VvXCqiToYS9SxcUmFoc+HeN
doxDbMhQwS7WwwLjKC+CadlEAlShCSVcEIOJM0ILOgTCF2QgHjYIXQlLALsREmmFMJTCiVrgABjF
8IZPKJYA6GeCiRwGh0D0gWp0ZKlJBfGIPVDPKjCQgQx0QVtmQaIUdyAO4wQGfgk4GRJDAAA7

------_=_NextPart_001_01C21D05.7305418C--


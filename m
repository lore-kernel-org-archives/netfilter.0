From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Help with iptables
Date: Wed, 4 Jun 2003 14:32:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306041835.h54IZTwG004407@discmail.com>
References: <sedc84e5.061@smtp.nu.ac.za>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0089_01C32AA6.2D3399C0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <sedc84e5.061@smtp.nu.ac.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Tahmid Quazi' <quazit@nu.ac.za>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0089_01C32AA6.2D3399C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sounds like the iptables command is not in the path - I think it needs to be
in /sbin

 

iptables: No such file or directory

 

if there was an issue with non-loaded modules, you would probably see a
symbol reference error.

 

 

 

  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Tahmid Quazi
Sent: Tuesday, June 03, 2003 5:22 AM
To: netfilter@lists.samba.org

 

Hi

 

I am trying to use the iptables command on an iPaq running Familiar. The
kernel version is 2.4.18-rmk3-hh6. 

The kernel does not have netfilter configured so for any functionality I
need, I have to install a module.

 

I have installed the following modules:

iptable_filter

ip_tables

 

successfully. ( i can see them when i type /proc/modules)

 

But when i try a simple iptables command (i got this from the "howto"
document)

/ # iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP

 

I get the following output:


iptables: No such file or directory

 

Please could someone tell me what i am doing wrong or missing.

 

Many thanks in advance for your help!

 

-- tahmid


------=_NextPart_000_0089_01C32AA6.2D3399C0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#AA00AA;
	text-decoration:underline;}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

<style>
p.MsoNormal
	{margin-left:1.5pt;}
</style>
</head>

<body lang=3DEN-US link=3Dblue vlink=3D"#AA00AA" =
style=3D'margin-left:1.5pt;margin-top:
1.5pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Sounds like the iptables command is =
not in
the path &#8211; I think it needs to be in /sbin</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>iptables: No such file or =
directory</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>if there was an issue with non-loaded modules, you =
would
probably see a symbol reference error&#8230;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<div>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabindex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org]
<b><span style=3D'font-weight:bold'>On Behalf Of </span></b>Tahmid =
Quazi<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Tuesday, June 03, =
2003 5:22 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.samba.org</span></font></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Hi</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>I am trying to use the iptables command on an iPaq =
running
Familiar. The kernel version is 2.4.18-rmk3-hh6. </span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>The kernel does not have netfilter configured so for =
any
functionality I need,&nbsp;I have to install a module.</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>I have installed the following =
modules:</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>iptable_filter</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>ip_tables</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>successfully. ( i can see them when i type =
/proc/modules)</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>But when i try a simple iptables command (i got this =
from
the &quot;howto&quot; document)</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>/ # iptables -A INPUT -s 127.0.0.1 -p icmp -j =
DROP</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>I get the following output:</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'><br>
iptables: No such file or directory</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Please could someone tell me what i am doing wrong =
or
missing.</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Many thanks in advance for your =
help!</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D1 face=3DTahoma><span =
style=3D'font-size:8.0pt;
font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>-- tahmid</span></font></p>

</div>

</div>

</body>

</html>

------=_NextPart_000_0089_01C32AA6.2D3399C0--



From: "Edmund Turner" <eturner@monash.edu.my>
Subject: RE: Trouble with PPTP
Date: Thu, 23 Oct 2003 10:22:26 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005901c3990c$81d60510$de0018ac@admin.monash.edu.my>
References: <6.0.0.22.0.20031022183505.01b4f688@pop3.uol.com.br>
Reply-To: <eturner@monash.edu.my>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005A_01C3994F.8FF94510"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20031022183505.01b4f688@pop3.uol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Fernando Barrocal' <fbarrocal@uol.com.br>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_005A_01C3994F.8FF94510
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear Fernando, I would really appreciate if you could send me the
"how-to" for that installation. I have been planning to implement it on
my network.

Thanks in advance!

Regards

edmund

 

-----Original Message-----regards


From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Fernando
Barrocal
Sent: Thursday, October 23, 2003 4:36 AM
To: Regalado, Ron; Andrzej Kozak; kernel@linuxace.com
Cc: netfilter@lists.netfilter.org
Subject: RE: Trouble with PPTP

 


I used the RPMs, if you need I can send you the How-to I did

At 17:06 22/10/2003, Regalado, Ron wrote:



 
Should I use the rpm package from Redhat or compile the package from
netfilter.org?

 

  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Fernando
Barrocal
Sent: Wednesday, October 22, 2003 12:23 PM
To: Andrzej Kozak; kernel@linuxace.com
Cc: netfilter@lists.netfilter.org
Subject: Re: Trouble with PPTP


You will need to compile iptables after the kernel then reboot

--
F.Barrocal

At 14:38 22/10/2003, Andrzej Kozak wrote:



Thanks Phil,
Is better but not excellent.
After when I :
Patched kernel (pptp-conntrack-nat from p-o-m)
Recompiled iptables v 1.2.8
Recompiled kernel
i get the same message: iptables: Invalid argument
but only if firewall script is automated executing from
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is
booting or rebooting.
If I log into system and executing this script manually is everything OK
!
What is wrong ? 
 
best regards
Andrew Kozak
 
 
> Rebuild iptables userspace using the patched kernel for the headers.
>
> Phil Oester
>
> On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:
> > Hello!
> > When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT and
-SNAT
is broken if I use iptables with -t nat
> > I get message: iptables: Invalid argument
> > Iptables v. 1.2.8
> > I need establish connect from my security network to outside VPN
server.
> >
> > best regards
> >
> > Andrew Kozak



------=_NextPart_000_005A_01C3994F.8FF94510
Content-Type: text/html;
	charset="us-ascii"
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
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;}
p
	{margin-right:0in;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle17
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Dear Fernando, I would really =
appreciate
if you could send me the &#8220;how-to&#8221; for that installation. I =
have
been planning to implement it on my network.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks in =
advance!</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Regards</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>edmund</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----regards</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>From:</span></b>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Fernando Barrocal<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> </span></font><font =
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Thursday,
 October 23, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma'> </span></font><font size=3D2 =
face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>4:36 =
AM</span></font><font size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> Regalado, Ron; =
Andrzej Kozak;
kernel@linuxace.com<br>
<b><span style=3D'font-weight:bold'>Cc:</span></b> </span></font><font =
size=3D2
 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>netfilter@lists.netfilter.o=
rg</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: Trouble with =
PPTP</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'><br>
I used the RPMs, if you need I can send you the How-to I did<br>
<br>
At </span></font>17:06 22/10/2003, Regalado, Ron wrote:<br>
<br>
</p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;<br>
</span></font><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial;color:blue'>Should I use the rpm package from Redhat =
or
compile the package from netfilter.org?<br>
</span></font><br>
&nbsp;</p>

<div class=3DMsoNormal align=3Dcenter =
style=3D'margin-left:.5in;text-align:center'><font
size=3D3 face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter>

</span></font></div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><b><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma;font-weight:bold'>From:</spa=
n></font></b><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org [<a
href=3D"mailto:netfilter-admin@lists.netfilter.org" =
eudora=3Dautourl>mailto:netfilter-admin@lists.netfilter.org</a>]
<b><span style=3D'font-weight:bold'>On Behalf Of </span></b>Fernando =
Barrocal<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> </span></font><font =
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Wednesday,
 October 22, 2003</span></font><font size=3D2 face=3DTahoma><span =
style=3D'font-size:
10.0pt;font-family:Tahoma'> </span></font><font size=3D2 =
face=3DTahoma><span
 style=3D'font-size:10.0pt;font-family:Tahoma'>12:23 =
PM</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> Andrzej Kozak;
kernel@linuxace.com<br>
<b><span style=3D'font-weight:bold'>Cc:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: Trouble with =
PPTP<br>
</span></font><br>
<br>
You will need to compile iptables after the kernel then reboot<br>
<br>
--<br>
F.Barrocal<br>
<br>
At 14:38 22/10/2003, Andrzej Kozak wrote:<br>
<br>
</p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3D"Times New Roman"><span
style=3D'font-size:10.0pt'>Thanks Phil,<br>
Is better but not excellent.<br>
After when I :<br>
Patched kernel (pptp-conntrack-nat from p-o-m)<br>
Recompiled iptables v 1.2.8<br>
Recompiled kernel<br>
i get the same message: iptables: Invalid argument<br>
but only if firewall script is automated executing from
/etc/rc.boot/firewallscript (DEBIAN 3.0 distribution) when linux is =
booting or
rebooting.<br>
If I log into system and executing this script manually is everything OK =
!<br>
What is wrong ?</span></font> <br>
&nbsp;<br>
<font size=3D2><span style=3D'font-size:10.0pt'>best regards<br>
Andrew Kozak<br>
</span></font>&nbsp;<br>
&nbsp;<br>
&gt; Rebuild iptables userspace using the patched kernel for the =
headers.<br>
&gt;<br>
&gt; Phil Oester<br>
&gt;<br>
&gt; On Wed, Oct 15, 2003 at 03:46:49PM +0200, Andrzej Kozak wrote:<br>
&gt; &gt; Hello!<br>
&gt; &gt; When I patched my 2.4.22 kernel with pptp-conntrack-nat -DNAT =
and
-SNAT<br>
is broken if I use iptables with -t nat<br>
&gt; &gt; I get message: iptables: Invalid argument<br>
&gt; &gt; Iptables v. 1.2.8<br>
&gt; &gt; I need establish connect from my security network to outside =
VPN
server.<br>
&gt; &gt;<br>
&gt; &gt; best regards<br>
&gt; &gt;<br>
&gt; &gt; Andrew Kozak</p>

</div>

</body>

<br>
</html>

------=_NextPart_000_005A_01C3994F.8FF94510--



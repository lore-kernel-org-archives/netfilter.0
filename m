From: "Chris Miller" <cmiller@compuville.net>
Subject: RE: PPTP reviisted
Date: Mon, 29 Sep 2003 15:26:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1A43gZ-0007lH-Mn@bear.dns-nac-zone.com>
References: <3F768D64.3080703@smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C3869E.22350280"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F768D64.3080703@smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Daniel Chemko' <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0006_01C3869E.22350280
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now I've got another problem. Here are the steps and what I did:

 

1)       I got kernel 2.4.22

2)       Didn't need this

3)       Done.

4)       Done.

5)       Did almost all of them. Didn't do the ones like ipv6 stuff.
Everything went fine. Done.

6)       Done.

7)       Booted new kernel. Everything seems fine. SSH in so I can apply a
rule that for some reason didn't get applied at boot. Here's what happenend:

 

# iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE

iptables: Invalid argument

#

 

So, you can see my problem. I've tried -j MASQ and iptables tells me it
can't find that target. I've got ipt_MASQUERADE loaded, and a mod-info shows
it's the right one for my kernel. I've also tried it with -o eth1. eth1 is
inside, eth2 is outside (eth0 is nothing as of now). Outside is DHCP or I'd
use SNAT. However, I replaced MASQUERADE with SNAT and got the same error.

 

What gives? I'm getting closer at least.

 

 

Thanks,

 

Chris Miller

Compuville Computers

www.compuville.net

 

  _____  

From: Daniel Chemko [mailto:dchemko@smgtec.com] 
Sent: Sunday, September 28, 2003 3:28 AM
To: Chris Miller
Cc: netfilter@lists.netfilter.org
Subject: Re: PPTP reviisted

 

If you want to enable conntrack for Linux you will need:

1. A Recent Kernel, I know anything later than 2.4.20 can work fine.
2. Kernel patches from pptpclient.sourceforge.net if you want the firewall
itself setting up the pptp tunnel, if not, ignore this step
3. CVS download the netfilter code from netfilter.org
4. Apply the patch-o-matic directory to your kernel sources directory like
so:
# KERNEL_DIR=/usr/src/<kerneldir> ./runme extra
5. Apply all patches that you really care for, but I would recommend
anything that doesn't fail out on your configuration.Make sure to include
the connectrack patch
6. Build the kernel with the new netfilter options turned on as modules
7. Install Kernel
8. Execute the following every time you want pptp (once per boot):
# modprobe ip_conntrack_proto_gre
# modprobe ip_nat_proto_gre
# modprobe ip_conntrack_pptp
# modprobe ip_nat_pptp

Chris Miller wrote:



I've seen a few things in the netfilter archive about PPTP, but no one has
ever really said anything about getting it to work.

 

Here's the deal: I've got a Windows box (192.168.1.10) sitting behind my
Linux firewall. On the firewall runs Debian Woody with iptables 1.2.6a. The
Linux box acts as a NAT to all the hosts behind it. Currently I forward TCP
port 1723 to 192.168.1.10, but clients cannot connect. I know it's got
something to do with GRE?

 

I saw something on Google about an ip_conntrac_pptp module, or something to
that nature, but I've not been able to find it anywhere. I'd love to compile
it and give it a try if it's made to fix this issue.

 

So could someone fill me in with what my options are as far as getting my
VPN working through my NAT? What exactly is going on?

 

 

Thanks,

 

Chris Miller

Compuville Computers

www.compuville.net

423.276.6692

 


------=_NextPart_000_0006_01C3869E.22350280
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><o:SmartTagType
 namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags" =
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
	{color:purple;
	text-decoration:underline;}
p.MsoAutoSig, li.MsoAutoSig, div.MsoAutoSig
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:Arial;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:1490247548;
	mso-list-type:hybrid;
	mso-list-template-ids:-1154734726 67698705 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Now I&#8217;ve got another problem. =
Here
are the steps and what I did:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>1)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>I got kernel 2.4.22<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>2)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Didn&#8217;t need this<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>3)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Done.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>4)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Done.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>5)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Did almost all of them. Didn&#8217;t do the ones like ipv6 =
stuff.
Everything went fine. Done.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>6)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Done.<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'margin-left:.5in;text-indent:-.25in;mso-list:l0 level1 =
lfo1'><![if !supportLists]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><span style=3D'mso-list:Ignore'>7)<font size=3D1 =
face=3D"Times New Roman"><span
style=3D'font:7.0pt "Times New =
Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></font></span></span></font><![endif]><font
size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Booted new kernel. Everything seems fine. SSH in so I can =
apply a
rule that for some reason didn&#8217;t get applied at boot. Here&#8217;s =
what
happenend:<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p>=
</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'># iptables -t =
nat -A POSTROUTING
-s 192.168.1.0/24 &#8211;j MASQUERADE<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>iptables: =
Invalid
argument<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>#<o:p></o:p></spa=
n></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p>=
</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>So, you can see my problem. =
I&#8217;ve
tried &#8211;j MASQ and iptables tells me it can&#8217;t find that =
target. I&#8217;ve
got ipt_MASQUERADE loaded, and a mod-info shows it&#8217;s the right one =
for my
kernel. I&#8217;ve also tried it with &#8211;o eth1. eth1 is inside, =
eth2 is
outside (eth0 is nothing as of now). Outside is DHCP or I&#8217;d use =
SNAT.
However, I replaced MASQUERADE with SNAT and got the same =
error.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>What gives? I&#8217;m getting =
closer at
least&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Thanks,<o:p></o:p></span></font></p>=


<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Chris =
Miller<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Compuville =
Computers<o:p></o:p></span></font></p>

<p class=3DMsoAutoSig><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>www.compuville.net<o:p></o:p></span>=
</font></p>

</div>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

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
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'> =
Daniel Chemko
[mailto:dchemko@smgtec.com] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Sunday, September =
28, 2003
3:28 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Chris Miller<br>
<b><span style=3D'font-weight:bold'>Cc:</span></b> <st1:PersonName =
w:st=3D"on">netfilter@lists.netfilter.org</st1:PersonName><br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Re: PPTP =
reviisted</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>If you want to enable conntrack for Linux you will need:<br>
<br>
1. A Recent Kernel, I know anything later than 2.4.20 can work fine.<br>
2. Kernel patches from pptpclient.sourceforge.net if you want the =
firewall
itself setting up the pptp tunnel, if not, ignore this step<br>
3. CVS download the netfilter code from netfilter.org<br>
4. Apply the patch-o-matic directory to your kernel sources directory =
like so:<br>
# KERNEL_DIR=3D/usr/src/&lt;kerneldir&gt; ./runme extra<br>
5. Apply all patches that you really care for, but I would recommend =
anything
that doesn't fail out on your configuration.Make sure to include the
connectrack patch<br>
6. Build the kernel with the new netfilter options turned on as =
modules<br>
7. Install Kernel<br>
8. Execute the following every time you want pptp (once per boot):<br>
# modprobe ip_conntrack_proto_gre<br>
# modprobe ip_nat_proto_gre<br>
# modprobe ip_conntrack_pptp<br>
# modprobe ip_nat_pptp<br>
<br>
Chris Miller wrote:<br>
<br>
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;ve seen a few things in the netfilter archive =
about PPTP,
but no one has ever really said anything about getting it to =
work.<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Here&#8217;s the deal: I&#8217;ve got a Windows box
(192.168.1.10) sitting behind my Linux firewall. On the firewall runs =
Debian
Woody with iptables 1.2.6a. The Linux box acts as a NAT to all the hosts =
behind
it. Currently I forward TCP port 1723 to 192.168.1.10, but clients =
cannot
connect. I know it&#8217;s got something to do with =
GRE?<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I saw something on Google about an ip_conntrac_pptp =
module,
or something to that nature, but I&#8217;ve not been able to find it =
anywhere.
I&#8217;d love to compile it and give it a try if it&#8217;s made to fix =
this
issue.<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>So could someone fill me in with what my options are =
as far
as getting my VPN working through my NAT? What exactly is going =
on?<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Chris =
Miller<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Compuville =
Computers<u1:p></u1:p></span></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><a =
href=3D"http://www.compuville.net">www.compuville.net</a><u1:p></u1:p></s=
pan></font><o:p></o:p></p>

<p class=3DMsoAutoSig><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>423.276.6692<u1:p></u1:p></span></font><o:p></o:p></p>=


<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0006_01C3869E.22350280--



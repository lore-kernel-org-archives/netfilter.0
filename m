From: "Derek Storvik" <dstorvik@consultech.net>
Subject: RE: NAT and VPN
Date: Thu, 3 Jun 2004 15:58:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CBBC84AC3E18304C98492272A68D61117C5942@thor.envisagenow.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C449AD.77DD6E3C"
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

------_=_NextPart_001_01C449AD.77DD6E3C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20

=20

________________________________

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Derek Storvik
Sent: Thursday, June 03, 2004 11:53 AM
To: netfilter@lists.netfilter.org
Subject: NAT and VPN

=20

I'm having trouble with NAT and VPN  =20

=20

I have a linux server running Fedora core 1   that is a
NAT/FIREWALL/VLAN/DHCP server for a large client network.

=20

Internet

  |

  |

Linux

  |

  |

Large network with many vlans and 1000 nodes or so.

=20

=20

 The internal network is natted to the 10.0.0.0 network and my clients
can not VPN out to the internet.   Specifically they get back an error
619

What has to be done to allow VPN to traverse through the firewall and
NAT?   at the moment the firewall rules are wide open to make sure that
isn't my issue.=20

=20

=20

=20

=20

=20

What VPN?  Cisco IPSec client?  other IPSec clients?  PoPToP?.....

=20

yes it matters

=20

<snip>

=20

=20

It is PPTP.  A windows client to a VPN server on a university campus.

=20

Derek

=20

________________________________

From: Aldo Lagana [mailto:ALagana@p21.com]=20
Sent: Thursday, June 03, 2004 2:43 PM
To: Derek Storvik
Subject: RE: NAT and VPN

=20

then all you need to do is to either:

=20

# modprobe ip_nat_pptp

=20

OR

=20

include NAT PPTP in your kernel configuration and recompile the kernel

=20

works great for me!

=20

=20

Ok here is the stupid question. I do that and I get the following.  What
all do I need to do? Path things? Recompile?

=20

[root@Furies root]# modprobe ip_nat_pptp

modprobe: Can't locate module ip_nat_pptp

=20

Thanks for the help

   Derek

=20

=20


------_=_NextPart_001_01C449AD.77DD6E3C
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
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
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
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
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:
Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

</div>

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
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Derek Storvik<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thursday, June 03, =
2004
11:53 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> NAT and =
VPN</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m having trouble with NAT and VPN&nbsp;&nbsp; =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have a linux server running Fedora core =
1&nbsp;&nbsp; that
is a NAT/FIREWALL/VLAN/DHCP server for a large client =
network.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Internet<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Linux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>&nbsp; |<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Large network with many vlans and 1000 nodes or =
so.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;The
internal network is natted to the 10.0.0.0 network and my clients can =
not VPN
out to the internet.&nbsp;&nbsp; Specifically they get back an error =
619<o:p></o:p></span></font></p>

<p><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>What
has to be done to allow VPN to traverse through the firewall and
NAT?&nbsp;&nbsp; at the moment the firewall rules are wide open to make =
sure
that isn&#8217;t my issue. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 color=3Dnavy face=3D"Times New =
Roman"><span
style=3D'font-size:12.0pt;color:navy'><o:p>&nbsp;</o:p></span></font></p>=


<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>What VPN?&nbsp; Cisco IPSec =
client?&nbsp;
other IPSec clients?&nbsp; PoPToP?.....</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>yes it =
matters</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>&lt;snip&gt;</span></font><font =
size=3D2
color=3Dnavy face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>It is PPTP.&nbsp; A windows client =
to a
VPN server on a university campus.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Derek<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div class=3DMsoNormal align=3Dcenter style=3D'text-align:center'><font =
size=3D3
face=3D"Times New Roman"><span style=3D'font-size:12.0pt'>

<hr size=3D2 width=3D"100%" align=3Dcenter tabIndex=3D-1>

</span></font></div>

<p class=3DMsoNormal><b><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma;font-weight:bold'>From:</span></font></b><font =
size=3D2
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'> Aldo =
Lagana
[mailto:ALagana@p21.com] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thursday, June 03, =
2004 2:43
PM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> Derek Storvik<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> RE: NAT and =
VPN</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>then all you need to do is to =
either:</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'># modprobe =
ip_nat_pptp</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>OR</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>include NAT PPTP in your kernel
configuration and recompile the kernel</span></font><o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dblue face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:blue'>works great for =
me!</span></font><o:p></o:p></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p>=
</span></font></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p>=
</span></font></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Ok here
is the stupid question. I do that and I get the following.&nbsp; What =
all do I
need to do? Path things? Recompile?<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D3 =
color=3Dnavy
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt;color:navy'><o:p>&nbsp;</o:p></span></font></p>=


<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0in;margin-right:1.0in;margin-bottom:
12.0pt;margin-left:.5in'><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>[root@Furies =
root]#
modprobe ip_nat_pptp<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0in;margin-right:1.0in;margin-bottom:
12.0pt;margin-left:.5in'><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>modprobe: Can't =
locate
module ip_nat_pptp<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0in;margin-right:1.0in;margin-bottom:
12.0pt;margin-left:.5in'><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p>=
</span></font></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0in;margin-right:1.0in;margin-bottom:
12.0pt;margin-left:0in'><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>Thanks for the =
help<o:p></o:p></span></font></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:0in;margin-right:1.0in;margin-bottom:
12.0pt;margin-left:0in'><font size=3D2 color=3Dnavy face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial;color:navy'>&nbsp;&nbsp; =
Derek<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C449AD.77DD6E3C--


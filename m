From: "Steve Jones" <sjones@ftdata.com>
Subject: RE: iptables bridge filter question
Date: Thu, 18 Mar 2004 10:02:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <79C037414A4B604CA73F5222570C6DFC800F@e2k3.ftdata.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C40CFA.12CC48E1"
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
To: Gerry Weaver <gerryw@objectivedomain.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C40CFA.12CC48E1
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't think I'm entirely clear about what you are trying to block, but
I *THINK* I just went through the learning curve to do a similar thing
myself, and was successful.  Check out ebtables.sourceforge.net.  My
requirement was to put a transparent bridge between a router and a
switch, to block or allow CERTAIN traffic based on source and/or
destination IP addresses.  My particular scenario would have been more
appropriately handled by standard iptables, except for that I don't
control the network configuration, so I couldn't change any IP
addresses.
=20
Basically, I downloaded the latest ebtables user space utilities, and
the kernel source for 2.6.4, compiled it on my fresh RH9 box, then
compiled the ebtables tools.  Ebtables then gave me the ability to
filter packets at layer two, while bridging.

I'm not at the site today where the firewall is, but I'm going to be
VPNing in later to get the small scripts I used.  Let me know if you
want me to send them as an example.
=20
-Steve
=20
________________________________

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Gerry Weaver
Sent: Thursday, March 18, 2004 3:28 AM
To: netfilter@lists.netfilter.org
Subject: iptables bridge filter question
=20
Hello All,
=20
I have setup a bridging firewall. I want to drop packets on the external
interface, which have source addresses on my internal network. However,
the firewall/bridge sits between my T1 router and the rest of my LAN. Is
there a way to drop the packets mentioned previously, but allow the
router? I guess a rule could be created that uses the routers mac
address as a match. I've been playing around with this, but I'm not
getting the result I want. I could sure use some advice on this.
=20
[ LAN xx.xx.xx.0/24 ]<=3D=3D>[ bridge/firewall ]<=3D=3D>[ router =
xx.xx.xx.254/24
]
=20
=20
Thanks in advance,
Gerry

------_=_NextPart_001_01C40CFA.12CC48E1
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 11">
<meta name=3DOriginator content=3D"Microsoft Word 11">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C40CD0.2954F120">
<link rel=3DEdit-Time-Data href=3D"cid:editdata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState=3D"false" LatentStyleCount=3D"156">
 </w:LatentStyles>
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
	mso-font-signature:1627421319 -2147483648 8 0 66047 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
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
	{color:purple;
	text-decoration:underline;
	text-underline:single;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
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
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>I don&#8217;t think I&#8217;m =
entirely
clear about what you are trying to block, but I *<b><span =
style=3D'font-weight:
bold'>THINK</span></b>* I just went through the learning curve to do a =
similar
thing myself, and was successful.<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>Check
out ebtables.sourceforge.net.<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>My
requirement was to put a transparent bridge between a router and a =
switch, to
block or allow CERTAIN traffic based on source and/or destination IP =
addresses.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>My particular scenario would =
have been more
appropriately handled by standard iptables, except for that I =
don&#8217;t
control the network configuration, so I couldn&#8217;t change any IP =
addresses.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Basically, I downloaded the latest
ebtables user space utilities, and the kernel source for 2.6.4, compiled =
it on
my fresh RH9 box, <span class=3DGramE>then</span> compiled the ebtables
tools.<span style=3D'mso-spacerun:yes'>&nbsp; </span>Ebtables then gave =
me the ability
to filter packets at layer two, while =
bridging.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><br>
I&#8217;m not at the site today where the firewall is, but I&#8217;m =
going to
be VPNing in later to get the small scripts I used.<span
style=3D'mso-spacerun:yes'>&nbsp; </span>Let me know if you want me to =
send them as an
example.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>-Steve<o:p></o:p></span></font></p>

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
face=3DTahoma><span style=3D'font-size:10.0pt;font-family:Tahoma'>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>On
Behalf Of </span></b>Gerry Weaver<br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thursday, March 18, =
2004
3:28 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> iptables bridge =
filter
question</span></font><o:p></o:p></p>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello All,</span></font><o:p></o:p></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have setup a bridging firewall. I want to drop =
packets on
the external interface, which have source addresses on my internal =
network.
However, the firewall/bridge sits between my T1 router and the rest of =
my LAN.
Is there a way to drop the packets mentioned previously, but allow the =
router?
I guess a rule could be created that uses the routers mac address as a =
match.
I've been playing around with this, but I'm not getting the result I =
want. I
could sure use some advice on this.</span></font><o:p></o:p></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>[ LAN xx.xx.xx.0/24 ]&lt;=3D=3D&gt;[ bridge/firewall
]&lt;=3D=3D&gt;[ router xx.xx.xx.254/24 ]</span></font><o:p></o:p></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;<o:p></o:p></span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks in advance,</span></font><o:p></o:p></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Gerry</span></font><o:p></o:p></p>

</div>

</div>

</body>

</html>

------_=_NextPart_001_01C40CFA.12CC48E1--


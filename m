From: "Mark Feijo" <cheesie@accglobal.net>
Subject: can't access FTPs
Date: Mon, 20 May 2002 16:31:00 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000001c2003d$41588300$0a00a8c0@feijo.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C2001B.BA46E300"
Return-path: <netfilter-admin@lists.samba.org>
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

------=_NextPart_000_0001_01C2001B.BA46E300
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,
=20
I=92m having trouble allowing internal computers to access remote FTP
sites on the net.   The new version of CUTE FTP can seem to connect ok.
But Internet Explorer gives an error =93Invalid PORT command=94.  And =
Bullet
Proof FTP says it can=92t open the socket.
=20
=20
Also, one other question.  Below is a section from my script.  I wrote
most of my script from scratch but added this from another one that I
found.  I notice that it slows down my internet a little.  Any ideas
why?
=20
# ICMP Control and Status Messages
=20
# Log and drop initial ICMP fragments
iptables -A INPUT --fragment -p icmp -j LOG \
         --log-prefix "Fragmented incoming ICMP: "
iptables -A INPUT --fragment -p icmp -j DROP
=20
iptables -A OUTPUT --fragment -p icmp -j LOG \
         --log-prefix "Fragmented outgoing ICMP: "
iptables -A OUTPUT --fragment -p icmp -j DROP
=20
iptables -A FORWARD --fragment -p icmp -j LOG \
         --log-prefix "Fragmented forwarded ICMP: "
iptables -A FORWARD --fragment -p icmp -j DROP
=20
iptables -A INPUT -p icmp \
         --icmp-type source-quench -d $NETIP -j ACCEPT
=20
iptables -A OUTPUT -p icmp \
         --icmp-type source-quench -j ACCEPT
=20
iptables -A FORWARD -p icmp \
         --icmp-type source-quench -j ACCEPT
=20
iptables -A INPUT -p icmp \
         --icmp-type parameter-problem -j ACCEPT
=20
iptables -A OUTPUT -p icmp \
         --icmp-type parameter-problem -j ACCEPT
=20
iptables -A FORWARD -p icmp \
         --icmp-type parameter-problem -j ACCEPT
=20
iptables -A INPUT -p icmp \
         --icmp-type destination-unreachable -j ACCEPT
=20
iptables -A OUTPUT -p icmp \
         --icmp-type fragmentation-needed -j ACCEPT
=20
iptables -A FORWARD -p icmp \
         --icmp-type fragmentation-needed -j ACCEPT
=20
# Don=B9t log dropped outgoing ICMP error messages
iptables -A OUTPUT  -p icmp \
         --icmp-type destination-unreachable -j DROP
=20
iptables -A FORWARD -o $NETFACE -p icmp \
         --icmp-type destination-unreachable -j DROP
=20
=20
thanks for any help.
=20
=20
Mark.

------=_NextPart_000_0001_01C2001B.BA46E300
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C2001B.A8C6C0F0">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceType"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"PlaceName"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
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
	{mso-style-type:personal-compose;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:windowtext;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
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
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:.5in'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hello all,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m having trouble allowing internal computers =
to
access remote FTP sites on the net.<span =
style=3D'mso-spacerun:yes'>=A0=A0 </span>The
new version of CUTE FTP can seem to connect ok.<span =
style=3D'mso-spacerun:yes'>=A0
</span>But Internet Explorer gives an error =
&#8220;</span></font><st1:place><st1:PlaceName><font
  size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>Invalid</span></font></st1:P=
laceName><font
 size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> =
</span></font><st1:PlaceType><font
  size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>PORT</span></font></st1:Plac=
eType></st1:place><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> command&#8221;.<span
style=3D'mso-spacerun:yes'>=A0 </span>And Bullet Proof FTP says it =
can&#8217;t open
the socket.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>Also, one other =
question.</span></font></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><span
style=3D'mso-spacerun:yes'>=A0 </span>Below is a section from my script. =
<span
style=3D'mso-spacerun:yes'>=A0</span>I wrote most of my script from =
scratch but
added this from another one that I found.<span =
style=3D'mso-spacerun:yes'>=A0
</span>I notice that it slows down my internet a little.<span
style=3D'mso-spacerun:yes'>=A0 </span>Any ideas =
why?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># ICMP Control and Status =
Messages<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># Log and drop initial ICMP =
fragments<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A INPUT
--fragment -p <span class=3DSpellE>icmp</span> -j LOG =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--log-prefix
&quot;Fragmented incoming ICMP<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A INPUT
--fragment -p <span class=3DSpellE>icmp</span> -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A OUTPUT
--fragment -p <span class=3DSpellE>icmp</span> -j LOG =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--log-prefix
&quot;Fragmented outgoing ICMP<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A OUTPUT
--fragment -p <span class=3DSpellE>icmp</span> -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
--fragment -p <span class=3DSpellE>icmp</span> -j LOG =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--log-prefix
&quot;Fragmented forwarded ICMP<span class=3DGramE>: =
&quot;</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
--fragment -p <span class=3DSpellE>icmp</span> -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A INPUT -p
<span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type source-quench -d $NETIP -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A OUTPUT
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type source-quench -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type source-quench -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A INPUT -p
<span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type parameter-problem -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A OUTPUT
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type parameter-problem -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type parameter-problem -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A INPUT -p
<span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type destination-unreachable -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A OUTPUT
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type fragmentation-needed -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>icmp</span> \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type fragmentation-needed -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'># Don=B9t log dropped outgoing ICMP error =
messages<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A
OUTPUT<span style=3D'mso-spacerun:yes'>=A0 </span>-p <span =
class=3DSpellE>icmp</span>
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type destination-unreachable -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></span=
></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-o $NETFACE -p <span class=3DSpellE>icmp</span> =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span =
style=3D'mso-spacerun:yes'>=A0=A0=A0=A0=A0=A0=A0=A0 </span>--<span
class=3DSpellE>icmp</span>-type destination-unreachable -j =
DROP<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>thanks</span></font></span><=
font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> for any
help.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Mark.<o:p></o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C2001B.BA46E300--



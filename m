From: "ENGEL Gerald" <aon.912164494.engel@aon.at>
Subject: IPTABLES & POLICYS
Date: Sun, 8 Jun 2003 15:34:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c32dc2$ac746380$8c00000a@snorre>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0008_01C32DD3.6FFD3380"
Return-path: <netfilter-admin@lists.netfilter.org>
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

------=_NextPart_000_0008_01C32DD3.6FFD3380
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
hope my English is ok, i have some questions;
 
Starting situation: I use red hat 9 Linux as a gateway firewall to route
my private LAN via ADSL to the internet;
Gateway has 2 network interfaces, one for internal, and one for the
connection to the alcatel modem;
 
I built up my firewall very similar to the firewall in Robert Zieglers
book "Linux Firewalls 2 nd edition" 
All policies for the 3 tables are set to DROP, I allow only special
protocols and services;
I don't use a rule for the mangle table and just one rule for the Nat
table > masquerade rule for snat;
 
When I start my firewall script I even can not ping the lo interface but
actually I have the rules in the filter table to allow a ping to 
this interface (this rules stand bevor the policy rules in the my
firewallscript) ;
When I set only the policies of the Nat and mangle table to ACCEPT and
let the filter table policies on DROP, then the firewall works very
well(I have internet connection from al pc of the private LAN and I can
ping everything) ;
 
How comes?
What has the Mangle and Nat table to do with pinging the local host, I
thought the advantage of iptables is the fact, that every packet passes
just one
chain and only local host packets need to go via 2 chains;
 
And that is the point, when I put the policies of Nat chains and Mangle
chains to DROP nothing is allowed any more > it seems that I lost rules
in this chain, but why does packets go to the chains of Mangle and
Nat(exception is the postrouting chain of Nat, were masquerade take
place)
 
If anyone knows were the problem is, please let me know.
 
Thank you
 
Gerald
 

------=_NextPart_000_0008_01C32DD3.6FFD3380
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DProgId content=3DWord.Document>
<meta name=3DGenerator content=3D"Microsoft Word 10">
<meta name=3DOriginator content=3D"Microsoft Word 10">
<link rel=3DFile-List href=3D"cid:filelist.xml@01C32DD3.6FC1B120">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:EnvelopeVis/>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
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
span.EmailFormatvorlage17
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
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;
	mso-header-margin:35.4pt;
	mso-footer-margin:35.4pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Normale Tabelle";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->
</head>

<body lang=3DDE link=3Dblue vlink=3Dpurple =
style=3D'tab-interval:35.4pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Hi,<o:p></o:p></span></=
font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>hope=
</span></font></span><font
size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
mso-ansi-language:EN-GB'> my English is ok, <span =
class=3DSpellE>i</span> have
some questions;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Starting situation: I =
use red
hat 9 Linux as a gateway firewall to route my private LAN via ADSL to =
the internet;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Gateway has 2 network
interfaces, one for internal, and one for the connection to the <span
class=3DSpellE>alcatel</span> modem;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I built up my firewall =
very
similar to the firewall in Robert <span class=3DSpellE><span =
class=3DGramE>Zieglers</span></span>
book &#8220;Linux Firewalls 2 <span class=3DSpellE>nd</span> =
edition&#8221; <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>All policies for the 3 =
tables
are set to <span class=3DGramE>DROP,</span> I allow only special =
protocols and
services;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>I don&#8217;t use a =
rule for
the mangle table and just one rule for the Nat table &gt; masquerade =
rule for <span
class=3DSpellE>snat</span>;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>When I start my =
firewall
script I even can not ping the lo interface but actually I have the =
rules in
the filter table to allow a ping to <o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>this=
</span></font></span><font
size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
mso-ansi-language:EN-GB'> interface (this rules stand <span =
class=3DSpellE>bevor</span>
the policy rules in the my <span class=3DSpellE>firewallscript</span>) =
;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>When I set only the =
policies
of the Nat and mangle table to ACCEPT and let the filter table policies =
on
DROP, then the firewall works very well(I have internet connection from =
al pc
of the private LAN and I can ping everything) =
;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>How =
comes?<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>What has the Mangle =
and Nat
table to do with <span class=3DGramE>pinging</span> the local host, I =
thought the
advantage of <span class=3DSpellE>iptables</span> is the fact, that =
every packet
passes just one<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>chai=
n</span></font></span><font
size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
mso-ansi-language:EN-GB'> and only local host packets need to go via 2 =
chains;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>And that is the point, =
when I
put the policies of Nat chains and Mangle chains to DROP nothing is =
allowed any
more &gt; it seems that I lost rules in this chain, but why does packets =
go to
the chains of Mangle and Nat(exception is the <span =
class=3DSpellE>postrouting</span>
chain of Nat, were masquerade take place)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>If anyone knows were =
the
problem is, please let me know.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Thank =
you<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'><o:p>&nbsp;</o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial;mso-ansi-language:EN-GB'>Gerald<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0008_01C32DD3.6FFD3380--



From: guilez <e.tolentino@comcast.net>
Subject: Problems Natting PPTP with iptables
Date: Sat, 8 Nov 2003 13:12:55 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2F5DA3A79AA0CD4B8FB8E721EBE702300102CD@guinevere.ELITES-REALM.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3A62C.50B1FE80"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C3A62C.50B1FE80
Content-Type: text/plain

Hi,
 
      I'm having problems trying to Nat PPTP using iptables. I've been
researching/testing this for a week already and still cannot get this thing
to work. I've tried patching my 2.4.20-20.7 kernel using pptp nat patch and
it wouldn't load the nat module and it displays "parameter not valid" for
REROUTING. Also a PPTP client sometimes connects to a PPTP server out on the
Internet from the Internal network.  I'm using Redhat 7.1 with
iptables-1.2.8-8.72.3. Is there a distru or RPM that has this already
enabled and working. Been reading forums where people are having the same
problem.
 
 
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
 
iptables -t nat -A PREROUTING -p tcp -d <WAN ip address> --dport 1723  \
         -j DNAT --to <internal ip address>
iptables -t nat -A PREROUTING -p tcp -s <WAN ip address> --sport 1723 \
         -j DNAT --to <internal ip address>
iptables -t nat -A PREROUTING -p udp -d <WAN ip address> --dport 500  \
         -j DNAT --to <internal ip address>
iptables -t nat -A PREROUTING -p 47 -d <WAN ip address> \
         -j DNAT --to <internal ip address>
iptables -t nat -A PREROUTING -p 47 -d <WAN ip address>  \
         -j DNAT --to <internal ip address>
 
iptables -A FORWARD -p tcp -s 0/0 --dport 1723  -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 --sport 1723  -j ACCEPT
iptables -A FORWARD -p 47 -s 0/0 -d 0/0  -j ACCEPT
iptables -A FORWARD -p 50 -s 0/0 -j ACCEPT
iptables -A FORWARD -p udp --sport 500 --dport 500 -j ACCEPT
 
 
Thanks,
 
E.T.

------_=_NextPart_001_01C3A62C.50B1FE80
Content-Type: text/html
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C3A5FA.06027FE0">
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
</xml><![endif]-->
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
	color:windowtext;
	font-weight:normal;
	font-style:normal;
	text-decoration:none;
	text-underline:none;
	text-decoration:none;
	text-line-through:none;}
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
font-family:Arial'>Hi,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>I'm =
having
problems trying to Nat PPTP using <span class=3DSpellE>iptables</span>. =
I've
been researching/testing this for a week already and still cannot get =
this
thing to work. I've tried patching my 2.4.20-20.7 kernel using <span
class=3DSpellE>pptp</span> <span class=3DSpellE>nat</span> patch and it =
wouldn't
load the <span class=3DSpellE>nat</span> module and it displays =
"parameter
not valid" for REROUTING. Also a PPTP client sometimes connects to a =
PPTP
server out on the Internet from the <span class=3DGramE>Internal</span> =
network. <span
style=3D'mso-spacerun:yes'>&nbsp;</span>I'm using <span =
class=3DSpellE>Redhat</span>
7.1 with iptables-1.2.8-8.72.3. Is there a <span =
class=3DSpellE>distru</span> or
RPM that has this already enabled and <span =
class=3DGramE>working.</span> Been
reading forums where people are having the same =
problem.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A POSTROUTING -o eth1 -j =
MASQUERADE<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-<span class=3DSpellE>i</span> eth0 -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-m state --state RELATED,ESTABLISHED -j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A PREROUTING -p <span =
class=3DSpellE>tcp</span> -d &lt;WAN
<span class=3DSpellE>ip</span> address&gt; --<span =
class=3DSpellE>dport</span>
1723<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span>-<span class=3DGramE>j</span> DNAT --to &lt;internal <span =
class=3DSpellE>ip</span>
address&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A PREROUTING -p <span =
class=3DSpellE>tcp</span> -s &lt;WAN
<span class=3DSpellE>ip</span> address&gt; --sport 1723 =
\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span>-<span class=3DGramE>j</span> DNAT --to &lt;internal <span =
class=3DSpellE>ip</span>
address&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A PREROUTING -p <span =
class=3DSpellE>udp</span> -d &lt;WAN
<span class=3DSpellE>ip</span> address&gt; --<span =
class=3DSpellE>dport</span>
500<span style=3D'mso-spacerun:yes'>&nbsp; =
</span>\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span>-<span class=3DGramE>j</span> DNAT --to &lt;internal <span =
class=3DSpellE>ip</span>
address&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span style=3D'font-size:10.0pt;font-family:Arial'>iptables=
</span></font></span></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A PREROUTING -p 47 -d &lt;WAN <span =
class=3DSpellE>ip</span>
address&gt; \<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span>-<span class=3DGramE>j</span> DNAT --to &lt;internal <span =
class=3DSpellE>ip</span>
address&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -t <span
class=3DSpellE>nat</span> -A PREROUTING -p 47 -d &lt;WAN <span =
class=3DSpellE>ip</span>
address&gt; <span =
style=3D'mso-spacerun:yes'>&nbsp;</span>\<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><span
style=3D'mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
</span>-<span class=3DGramE>j</span> DNAT --to &lt;internal <span =
class=3DSpellE>ip</span>
address&gt;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>tcp</span> -s 0/0 --<span =
class=3DSpellE>dport</span>
1723<span style=3D'mso-spacerun:yes'>&nbsp; </span>-j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>tcp</span> -s 0/0 --sport 1723<span
style=3D'mso-spacerun:yes'>&nbsp; </span>-j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p 47 -s 0/0 -d 0/0<span style=3D'mso-spacerun:yes'>&nbsp; </span>-j =
ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p 50 -s 0/0 -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><span class=3DGramE><font =
size=3D2
face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>iptables</span></font></spa=
n></span><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'> -A FORWARD
-p <span class=3DSpellE>udp</span> --sport 500 --<span =
class=3DSpellE>dport</span>
500 -j ACCEPT<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Thanks,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'>E.T.</span></font></span><f=
ont
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></=
p>

</div>

</body>

</html>

------_=_NextPart_001_01C3A62C.50B1FE80--


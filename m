From: "John Fergusson" <john@fcol.com>
Subject: unable to compile kernel
Date: Mon, 9 Sep 2002 17:00:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c25844$00586a50$3600a8c0@fcol.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C25822.794850F0"
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

------=_NextPart_000_0001_01C25822.794850F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using 2.4.19on rh 7.3 
 
I have applied patch-o-matic  20020908   using -batch userspace
 
When doing a make modules I get the following error.
 
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104:
`ip_ct_gre_lock' undeclared (first use in this function)
ip_conntrack_proto_gre.c: At top level:
ip_conntrack_proto_gre.c:70: `ip_ct_gre_lock' used prior to declaration
make[2]: *** [ip_conntrack_proto_gre.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.19/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.19/net'
make: *** [_mod_net] Error 2
[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: (Each
undeclared identifier is reported only once
bash: syntax error near unexpected token `(Each'
[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: for
each function it appears in.)
bash: syntax error near unexpected token `in.)'
[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_append':
> /usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:70:
`ip_ct_gre_lock' undeclared (first use in this function)
> /usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_prepend':
bash: command substitution: line 1: unexpected EOF while looking for
matching `''
bash: command substitution: line 3: syntax error: unexpected end of file
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:78:
`ip_ct_gre_lock' undeclared (first use in this function)
bash: /usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:: No
such file or directory
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_named_insert':
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104:
`ip_ct_gre_lock' undeclared (first use in this function)
ip_conntrack_proto_gre.c: At top level:
ip_conntrack_proto_gre.c:70: `ip_ct_gre_lock' used prior to declaration
make[2]: *** [ip_conntrack_proto_gre.o] Error 1
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: (Each
undeclared identifier is reported only once
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: for
each function it appears in.)
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_append':
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:70:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_prepend':
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:78:
`ip_ct_gre_lock' undeclared (first use in this function)
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `list_named_insert':
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104:
`ip_ct_gre_lock' undeclared (first use in this function)
ip_conntrack_proto_gre.c: At top level:
ip_conntrack_proto_gre.c:70: `ip_ct_gre_lock' used prior to declaration
make[2]: *** [ip_conntrack_proto_gre.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.19/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.19/net'
make: *** [_mod_net] Error 2
[root@gateway1 linux-2.4.19]#
 
 

------=_NextPart_000_0001_01C25822.794850F0
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
<link rel=3DFile-List href=3D"cid:filelist.xml@01C25822.75DE4AF0">
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
font-family:Arial'>Using 2.4.19on <span class=3DSpellE>rh</span> 7.3 =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I have applied patch-o-<span class=3DSpellE><span =
class=3DGramE>matic</span></span><span
class=3DGramE><span style=3D'mso-spacerun:yes'>&nbsp; =
</span>20020908</span><span
style=3D'mso-spacerun:yes'>&nbsp; </span><span
style=3D'mso-spacerun:yes'>&nbsp;</span>using &#8211;batch <span =
class=3DSpellE>userspace</span><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>When doing <span class=3DGramE>a make modules</span> =
I get the
following error.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104=
: `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>ip_conntrack_proto_gre.c</span></font></span>:=
 At top
level:<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>ip_conntrack_proto_gre.c:70: `<span =
class=3DSpellE>ip_ct_gre_lock</span>'
used prior to declaration<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>2]: *** [<span =
class=3DSpellE>ip_conntrack_proto_gre.o</span>]
Error 1<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>2]: Leaving =
directory
`/usr/src/linux-2.4.19/net/ipv4/netfilter'<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>1]: ***
[_modsubdir_ipv4/netfilter] Error 2<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>1]: Leaving =
directory
`/usr/src/linux-2.4.19/net'<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make</span></font></span>: *** [_<span =
class=3DSpellE>mod_net</span>]
Error 2<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: (Each
undeclared identifier is reported only once<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>bash</span></font></span>: syntax error near
unexpected token `(Each'<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49: for =
each
function it appears in.)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>bash</span></font></span>: syntax error near
unexpected token `in.)'<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>[root@gateway1 linux-2.4.19]#
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In =
function `<span
class=3DSpellE>list_append</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&gt; =
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:70:
`<span class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in =
this
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&gt; =
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: In
function `<span =
class=3DSpellE>list_prepend</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>bash</span></font></span>: command =
substitution: line
1: unexpected EOF while looking for matching `''<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>bash</span></font></span>: command =
substitution: line
3: syntax error: unexpected end of file<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:78:=
 `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>bash</span></font></span>:
/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:: No such =
file or
directory<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: =
In
function `<span =
class=3DSpellE>list_named_insert</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104=
: `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>ip_conntrack_proto_gre.c</span></font></span>:=
 At top
level:<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>ip_conntrack_proto_gre.c:70: `<span =
class=3DSpellE>ip_ct_gre_lock</span>'
used prior to declaration<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>2]: *** [<span =
class=3DSpellE>ip_conntrack_proto_gre.o</span>]
Error 1<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49:=
 (Each
undeclared identifier is reported only once<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:49:=
 for
each function it appears in.)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: =
In
function `<span =
class=3DSpellE>list_append</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:70:=
 `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: =
In
function `<span =
class=3DSpellE>list_prepend</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:78:=
 `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h: =
In
function `<span =
class=3DSpellE>list_named_insert</span>':<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>/usr/src/linux-2.4.19/include/linux/netfilter_ipv4/listhelp.h:104=
: `<span
class=3DSpellE>ip_ct_gre_lock</span>' undeclared (first use in this =
function)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DSpellE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>ip_conntrack_proto_gre.c</span></font></span>:=
 At top
level:<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>ip_conntrack_proto_gre.c:70: `<span =
class=3DSpellE>ip_ct_gre_lock</span>'
used prior to declaration<o:p></o:p></span></font></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>2]: *** [<span =
class=3DSpellE>ip_conntrack_proto_gre.o</span>]
Error 1<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>2]: Leaving =
directory
`/usr/src/linux-2.4.19/net/ipv4/netfilter'<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>1]: ***
[_modsubdir_ipv4/netfilter] Error 2<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make[</span></font></span>1]: Leaving =
directory
`/usr/src/linux-2.4.19/net'<o:p></o:p></p>

<p class=3DMsoNormal><span class=3DGramE><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>make</span></font></span>: *** [_<span =
class=3DSpellE>mod_net</span>]
Error 2<o:p></o:p></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>[root@gateway1 linux-2.4.19]#<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0001_01C25822.794850F0--



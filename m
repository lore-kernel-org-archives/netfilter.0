From: "Kim Leandersson" <kim.leandersson@chs.chalmers.se>
Subject: RE: DNAT Help
Date: Mon, 21 Oct 2002 08:34:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A3F91@olga.chs.chalmers.se>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C278CB.E2389004"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Morgan <morgan@ravensoft.nu>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C278CB.E2389004
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does 1.2.3.5 accept the connections? Have you enabled forwarding? Both
in iptables and in /proc/sys/net/ipv4/ip_forward?
=20
Try to add some log-rules in your PREROUTING chain
=20
//kim
	-----Original Message-----
	From: Morgan [mailto:morgan@ravensoft.nu]=20
	Sent: Monday, October 21, 2002 1:29 AM
	To: netfilter@lists.netfilter.org
	Subject: DNAT Help
=09
=09
	Hi
	=20
	Can anyone help me with this?
	=20
	I'm trying to telnet to 1.2.3.4 port 25
	=20
	Where I'm DNATing 1.2.3.4 to 1.2.3.5
	=20
	telnet is still trying to connect to 1.2.3.4 but it never get
any connections.
	=20
	Here is my nat table.
	=20
	=20
	mailserv:/etc# /sbin/iptables -L -t nat
	Chain PREROUTING (policy ACCEPT)
	target     prot opt source               destination
	DNAT       all  --  anywhere             1.2.3.4    to:1.2.3.5
	=20
	Chain POSTROUTING (policy ACCEPT)
	target     prot opt source               destination
	=20
	Chain OUTPUT (policy ACCEPT)
	target     prot opt source               destination
	DNAT       all  --  anywhere            1.2.3.4     to:1.2.3.5
	=20
	=20
	Thanks
	Morgan=20

------_=_NextPart_001_01C278CB.E2389004
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" xmlns:o =3D=20
"urn:schemas-microsoft-com:office:office" xmlns:w =3D=20
"urn:schemas-microsoft-com:office:word"><HEAD><TITLE>Meddelande</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3DWord.Document name=3DProgId>
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<META content=3D"Microsoft Word 10" name=3DOriginator><LINK=20
href=3D"cid:filelist.xml@01C278A1.2A058DB0" rel=3DFile-List><!--[if gte =
mso 9]><xml>
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
<STYLE>@page Section1 {size: 595.3pt 841.9pt; margin: 70.85pt 70.85pt =
70.85pt 70.85pt; mso-header-margin: 35.4pt; mso-footer-margin: 35.4pt; =
mso-paper-source: 0; }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"; =
mso-style-parent: ""; mso-pagination: widow-orphan; =
mso-fareast-font-family: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline; text-underline: single
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline; text-underline: single
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline; text-underline: single
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline; text-underline: single
}
SPAN.E-postmall17 {
	COLOR: windowtext; FONT-FAMILY: Arial; mso-style-type: =
personal-compose; mso-style-noshow: yes; mso-ansi-font-size: 10.0pt; =
mso-bidi-font-size: 10.0pt; mso-ascii-font-family: Arial; =
mso-hansi-font-family: Arial; mso-bidi-font-family: Arial
}
SPAN.SpellE {
	mso-style-name: ""; mso-spl-e: yes
}
SPAN.GramE {
	mso-style-name: ""; mso-gram-e: yes
}
DIV.Section1 {
	page: Section1
}
</STYLE>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */=20
 table.MsoNormalTable
	{mso-style-name:"Normal tabell";
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
<![endif]--></HEAD>
<BODY lang=3DSV style=3D"tab-interval: 65.2pt" vLink=3Dpurple =
link=3Dblue>
<DIV><SPAN class=3D586453206-21102002><FONT face=3DArial color=3D#0000ff =
size=3D2>Does=20
1.2.3.5 accept the connections? Have you enabled forwarding? Both in =
iptables=20
and in /proc/sys/net/ipv4/ip_forward?</FONT></SPAN></DIV>
<DIV><SPAN class=3D586453206-21102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586453206-21102002><FONT face=3DArial color=3D#0000ff =
size=3D2>Try to=20
add some log-rules in your PREROUTING chain</FONT></SPAN></DIV>
<DIV><SPAN class=3D586453206-21102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D586453206-21102002><FONT face=3DArial color=3D#0000ff =

size=3D2>//kim</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Dsv dir=3Dltr =
align=3Dleft><FONT face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Morgan=20
  [mailto:morgan@ravensoft.nu] <BR><B>Sent:</B> Monday, October 21, 2002 =
1:29=20
  AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> DNAT =

  Help<BR><BR></FONT></DIV>
  <DIV class=3DSection1>
  <P class=3DMsoNormal><SPAN class=3DSpellE><FONT face=3DArial =
size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial">Hi</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: =
Arial"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Can=20
  anyone help me with this?<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">I&#8217;m=20
  trying to telnet to 1.2.3.4 port 25<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Where=20
  I&#8217;m <SPAN class=3DSpellE>DNATing</SPAN> 1.2.3.4 to=20
  1.2.3.5<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DGramE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">telnet</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"> is=20
  still trying to connect to 1.2.3.4 but it never get any=20
  connections.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Here is=20
  my <SPAN class=3DSpellE>nat</SPAN> table.<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DSpellE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">mailserv</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">:/etc#=20
  /<SPAN class=3DSpellE>sbin/iptables</SPAN> -L -t <SPAN=20
  class=3DSpellE>nat</SPAN><o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Chain=20
  <SPAN class=3DSpellE>PREROUTING</SPAN> (policy=20
  ACCEPT)<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DGramE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">target</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN><SPAN=20
  class=3DSpellE>prot</SPAN> opt source<SPAN=20
  style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
  </SPAN>destination<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DSpellE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">DNAT</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</SPAN><SPAN=20
  class=3DGramE>all<SPAN style=3D"mso-spacerun: yes">&nbsp; =
</SPAN>--</SPAN><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp; </SPAN>anywhere<SPAN=20
  style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
  </SPAN>1.2.3.4<SPAN style=3D"mso-tab-count: 1">&nbsp;&nbsp;&nbsp;=20
  </SPAN>to:1.2.3.5<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Chain=20
  <SPAN class=3DSpellE>POSTROUTING</SPAN> (policy=20
  ACCEPT)<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DGramE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">target</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN><SPAN=20
  class=3DSpellE>prot</SPAN> opt source<SPAN=20
  style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
  </SPAN>destination<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Chain=20
  OUTPUT (policy ACCEPT)<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DGramE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">target</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN><SPAN=20
  class=3DSpellE>prot</SPAN> opt source<SPAN=20
  style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
  </SPAN>destination<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><SPAN class=3DSpellE><FONT face=3DArial =
size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">DNAT</SPAN></FONT></SPAN><FONT=20
  face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</SPAN><SPAN=20
  class=3DGramE>all<SPAN style=3D"mso-spacerun: yes">&nbsp; =
</SPAN>--</SPAN><SPAN=20
  style=3D"mso-spacerun: yes">&nbsp; </SPAN>anywhere<SPAN=20
  style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  </SPAN>1.2.3.4<SPAN style=3D"mso-tab-count: =
1">&nbsp;&nbsp;&nbsp;&nbsp;=20
  </SPAN>to:1.2.3.5<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><o:p>&nbsp;</o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Thanks<o:p></o:p></SPAN></FONT></P>
  <P class=3DMsoNormal><FONT face=3DArial size=3D2><SPAN lang=3DEN-GB=20
  style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB">Morgan=20
  <o:p></o:p></SPAN></FONT></P></DIV></BLOCKQUOTE></BODY></HTML>
=00
------_=_NextPart_001_01C278CB.E2389004--


From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: Netfilter and Poptop ( and stuff ... )
Date: Mon, 10 Oct 2005 08:28:37 +0200
Message-ID: <E1EOr9T-0001D1-Ma@mail.sourceforge.net>
Reply-To: <edvin.seferovic@kolp.at>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C5CD74.9E7056F0"
Return-path: <poptop-server-admin@lists.sourceforge.net>
Sender: poptop-server-admin@lists.sourceforge.net
Errors-To: poptop-server-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/poptop-server>,
	<mailto:poptop-server-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:poptop-server@lists.sourceforge.net>
List-Help: <mailto:poptop-server-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/poptop-server>,
	<mailto:poptop-server-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=poptop-server>
To: netfilter@lists.netfilter.org, poptop-server@lists.sourceforge.net

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C5CD74.9E7056F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

first of all - excuse me for mailing this to two mailing lists at once, but
I am hoping to get more answers from your experience with poptop and
netfilter. 

 

Here is my situation - I've configured a gateway with poptop ( which uses
RADIUS for auth/acct - which again uses LDAP as auth-backend and mySQL for
accounting ). This gateway has 2 internal and one external interface ( with
public routeable IP address ). One internal interface is used to build a
restricted network for unknown machines, and the second one is used as a
gateway for the known machines. Now - I would like allow my VPN users
internet access, but not to all machines on the internal network. So I have
to use NAT on the tunnel endpoints ( ppp+ interfaces ), right? 

 

I wanted to make this easy as possible, but as always - I took the wrong
turn... probably by choosing Firewall Builder to help me get my firewall set
up. I achived everything, but I cannot configure ppp+ interfaces in
FW-Builder? Does anyone has a hint for me? Is this possible anyway ( please
don't tell me I have to configure 150 ppp interfaces in FW-Builder ) ??? 

 

I suppose it would be more secure to enter a firewall rule every time a ppp
interface comes up ( by using scripts like ip-up from pppd )? Do I have to
enter a NAT rule for each interface then? Any performance thought when
having 150+ interfaces at the same time? 

 

Nevertheless I would also like to redirect http traffic going from a NATed
ppp+ interface to my squid process - how does this combined rule looks like?


 

Sorry for this huge eMail, and amateur questions.. I hope at least a few of
the gurus out there will be able and willing to help me out...

 

Thank You in advance !

 

Regards,

 

Edvin Seferovic

 

 

 


------=_NextPart_000_0000_01C5CD74.9E7056F0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DDE link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Hi,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>first of all &#8211; excuse me for mailing =
this to
two mailing lists at once, but I am hoping to get more answers from your
experience with poptop and netfilter. <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Here is my situation &#8211; I&#8217;ve =
configured a
gateway with poptop ( which uses RADIUS for auth/acct &#8211; which =
again uses
LDAP as auth-backend and mySQL for accounting ). This gateway has 2 =
internal
and one external interface ( with public routeable IP address ). One =
internal interface
is used to build a restricted network for unknown machines, and the =
second one
is used as a gateway for the known machines. Now &#8211; I would like =
allow my
VPN users internet access, but not to all machines on the internal =
network. So
I have to use NAT on the tunnel endpoints ( ppp+ interfaces ), right? =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I wanted to make this easy as possible, but as =
always
&#8211; I took the wrong turn... probably by choosing Firewall Builder =
to help
me get my firewall set up. I achived everything, but I cannot configure =
ppp+
interfaces in FW-Builder? Does anyone has a hint for me? Is this =
possible
anyway ( please don&#8217;t tell me I have to configure 150 ppp =
interfaces in
FW-Builder ) ??? <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>I suppose it would be more secure to enter a =
firewall
rule every time a ppp interface comes up ( by using scripts like ip-up =
from
pppd )? Do I have to enter a NAT rule for each interface then? Any =
performance
thought when having 150+ interfaces at the same time? =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Nevertheless I would also like to redirect =
http
traffic going from a NATed ppp+ interface to my squid process &#8211; =
how does
this combined rule looks like? <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Sorry for this huge eMail, and amateur =
questions.. I
hope at least a few of the gurus out there will be able and willing to =
help me
out...<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Thank You in advance =
!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Regards,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Edvin Seferovic<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-GB
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
lang=3DEN-GB
style=3D'font-size:12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0000_01C5CD74.9E7056F0--



-------------------------------------------------------
This SF.Net email is sponsored by:
Power Architecture Resource Center: Free content, downloads, discussions,
and more. http://solutions.newsforge.com/ibmarch.tmpl

From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Clients joining a host on a private LAN behind a NAT
Date: Fri, 26 Sep 2003 09:25:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E36EA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3844A.CB4FE54E"
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
To: Thomas Stian Bergheim <bjartebe@eunet.no>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3844A.CB4FE54E
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

What you're internal LAN guys are trying to do is connect to the =
Internet game over the internet, so it is going through the firewall, =
then trying to get into the firewall back the way it came. If War 3 has =
a direct connect to server ip feature, try that. I forget the sane way =
to perform what I call a 'gateway loopback' on NATed firewalls.

=20

-----Original Message-----
From: Thomas Stian Bergheim [mailto:bjartebe@eunet.no]=20
Sent: Friday, September 26, 2003 7:44 AM
To: Daniel Chemko
Subject: SV: Clients joining a host on a private LAN behind a NAT

=20

I'll try to explain better.

It's not really only related to war3 as far as I know, but it's the only =
game we have more than 1 cdkey so we can try.

=20

You log on to battle.net, host a game, and then other players join your =
game. People from the internet can join, people from the lan cannot.

=20

Here's the rule I use:

iptables -A PREROUTING -t nat -p tcp --dport 5000 -j DNAT --to =
192.168.0.2:5000

iptables -A PREROUTING -t nat -p udp --dport 5000 -j DNAT --to =
192.168.0.2:5000

=20

... for making other people on the internet join games I host.

=20

When someone on my LAN tries to join my game, this is what happens:

192.168.0.3 is on battle.net, sees the game that 192.168.0.2 hosted, =
tries to join, iptables sees that 3 is trying to join ext.ip, and =
rewrites the rule. Computer 3 sends a request to computer2, computer3 =
sends a reply to computer2, but computer2 never sendt a request to =
computer3, but the external ip, so the packet is dropped.

=20

Atleast this is what I think is going on, I haven't been able to fix it =
though :/

=20

=20

 - Thomas=20

=20

-----Opprinnelig melding-----
Fra: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] P=E5 vegne av Daniel Chemko
Sendt: 26. september 2003 05:27
Til: Thomas Stian Bergheim
Kopi: netfilter@lists.netfilter.org
Emne: Re: Clients joining a host on a private LAN behind a NAT

=20

Not sure about WarIII, but some games need online auth before they can =
connect to the game. Is the game started in Internet or LAN mode?

When you say you can host the game, does that mean people from the =
internet can join, or does it mean that you can start the server =
program?

Thomas Stian Bergheim wrote:



Hi,

=20

I've asked this question before and got a few replies, nothing that made =
it work, though.

=20

I am behind a nat-firewall, and I want to be able to host a warcraft3 =
game (this works), and have other clients on my internal network join my =
game. Right now they will see the game, but can't join it (which is =
understandable).

=20

I've tried a few starcraft-scripts, without much luck..

=20

I'm using iptables. Any ideas?

=20

Thanks,

=20

 - Thomas

=20


------_=_NextPart_001_01C3844A.CB4FE54E
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
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
span.EmailStyle17
	{font-family:Arial;
	color:windowtext;}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
span.EmailStyle20
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>What you&#8217;re internal LAN guys =
are
trying to do is connect to the Internet game over the internet, so it is =
going
through the firewall, then trying to get into the firewall back the way =
it
came. If War 3 has a direct connect to server ip feature, try that. I =
forget
the sane way to perform what I call a &#8216;gateway loopback&#8217; on =
NATed
firewalls.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Thomas Stian =
Bergheim
[mailto:bjartebe@eunet.no] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> </span></font><font =
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>Friday,
 September 26, 2003</span></font><font size=3D2 face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'> </span></font><font
 size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'>7:44 AM</span></font><font
size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;font-family:Tahoma'><br>
<b><span style=3D'font-weight:bold'>To:</span></b> Daniel Chemko<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> SV: Clients =
joining a
host on a private LAN behind a NAT</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D3
face=3D"Times New Roman"><span =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>I&#8217;ll try to explain better.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>It&#8217;s not really only related to war3 as far as I know, =
but
it&#8217;s the only game we have more than 1 cdkey so we can =
try.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>You log on to battle.net, host a game, and then other =
players join
your game. People from the internet can join, people from the lan =
cannot.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Here&#8217;s the rule I use:</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>iptables -A PREROUTING -t nat -p tcp --dport 5000 -j DNAT =
--to
192.168.0.2:5000</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>iptables -A PREROUTING -t nat -p udp --dport 5000 -j DNAT =
--to
192.168.0.2:5000</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&#8230; for making other people on the internet join games I =
host.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>When someone on my LAN tries to join my game, this is what =
happens:</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>192.168.0.3 is on battle.net, sees the game that 192.168.0.2
hosted, tries to join, iptables sees that 3 is trying to join ext.ip, =
and
rewrites the rule. Computer 3 sends a request to computer2, computer3 =
sends a
reply to computer2, but computer2 never sendt a request to computer3, =
but the
external ip, so the packet is dropped.</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>Atleast this is what I think is going on, I haven&#8217;t =
been able
to fix it though :/</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>=A0- Thomas </span></font></p>

</div>

<p class=3DMsoNormal style=3D'margin-left:35.4pt'><font size=3D2 =
color=3Dnavy
face=3DArial><span lang=3DNO-BOK =
style=3D'font-size:10.0pt;font-family:Arial;
color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DTahoma><span
lang=3DNO-BOK =
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Opprinnelig
melding-----<br>
<b><span style=3D'font-weight:bold'>Fra:</span></b>
netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] <b><span =
style=3D'font-weight:bold'>P=E5
vegne av</span></b> Daniel Chemko<br>
<b><span style=3D'font-weight:bold'>Sendt:</span></b> 26. september 2003 =
05:27<br>
<b><span style=3D'font-weight:bold'>Til:</span></b> Thomas Stian =
Bergheim<br>
<b><span style=3D'font-weight:bold'>Kopi:</span></b>
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Emne:</span></b> Re: Clients joining =
a host
on a private LAN behind a NAT</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D3
face=3D"Times New Roman"><span lang=3DNO-BOK =
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D3
face=3D"Times New Roman"><span lang=3DNO-BOK =
style=3D'font-size:12.0pt'>Not sure
about WarIII, but some games need online auth before they can connect to =
the
game. Is the game started in Internet or LAN mode?<br>
<br>
When you say you can host the game, does that mean people from the =
internet can
join, or does it mean that you can start the server program?<br>
<br>
Thomas Stian Bergheim wrote:<br>
<br>
</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DNO-BOK =
style=3D'font-size:10.0pt;font-family:Arial'>Hi,<u3:p></u3:p></span></fon=
t></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DNO-BOK =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I&#8217;ve =
asked this
question before and got a few replies, nothing that made it work, =
though.<u3:p></u3:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I am behind a
nat-firewall, and I want to be able to host a warcraft3 game (this =
works), and
have other clients on my internal network join my game. Right now they =
will see
the game, but can&#8217;t join it (which is =
understandable).<u3:p></u3:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I&#8217;ve =
tried a few
starcraft-scripts, without much luck..<u3:p></u3:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>I&#8217;m =
using iptables.
Any ideas?<u3:p></u3:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'>Thanks,<u3:p></u3:p></span><=
/font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB =
style=3D'font-size:10.0pt;font-family:Arial'><u3:p>&nbsp;</u3:p></span></=
font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D2 =
face=3DArial><span
lang=3DEN-GB style=3D'font-size:10.0pt;font-family:Arial'>&nbsp;- =
Thomas<u3:p></u3:p></span></font></p>

<p class=3DMsoNormal style=3D'margin-left:70.8pt'><font size=3D3
face=3D"Times New Roman"><span lang=3DEN-GB =
style=3D'font-size:12.0pt'><u3:p>&nbsp;</u3:p></span></font></p>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C3844A.CB4FE54E--


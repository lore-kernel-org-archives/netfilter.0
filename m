From: "Tiziano Arbizzani" <tiziano@digibyte.it>
Subject: Some strange connection timeout
Date: Mon, 7 Apr 2003 14:48:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <525F9FE5E1B9A94FB35994B770FF43D821683B@powerthree.digibyte.it>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2FD03.F4845958"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2FD03.F4845958
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all, I am a rather newbie in firewall issues.
=20
I have noticed this little problem: I am installing a network with some
linux-boxes-router for a little sized firm in my hometown.
=20
These boxes have a ADSL router connected to an ethernet card and an ISDN
internal modem for backup purpose.=20
Every remote office have one of this boxes to connect its LAN to the
central headquarters LAN via a VPN tunnel.
=20
Every box at startup tries if the ADSL is up pinging a sure Ip server,
and if it's so it tries to establish a VPN connection to headquarters.
After this it tries to ping a server in the HQ lan, and nothing happens
since the HQ server continues responding to pings (like an heartbeat).
=20
If the HQ server stops responding to pings it tries to ping a sure
server on the internet and if there's no response it realizes adsl is
down, dials the ISDN provider and  try to connect via VPN to the HQ.
=20
Let's come to the problem : after the ADSL is fallen, ISDN is set up and
the VPN is established, for a couple of minutes the server in the HQ lan
is not 'ping'able.=20
=20
Routing is OK, (I must changes routing tables after the interface swap),
firewall rules are (IMHO) ok, but server starts responding only after
some time.
=20
There 's some kind of timeout, perhaps a cached value that must become
stale, but I can't realize if the problem comes from the DNS or ARP
cache or the ip_conntrack table.=20
=20
I tried to clear both caches, using ip_dynaddr, using SNAT or
MASQUERADING, lowering the timeouts values in
proc/sys/net/ipv4/route/gc* files, but I can't work around the problem.
=20
Thanks a lot and every help is truly appreciated.
=20
Hi all
=20
------------------------------------------------------------
 Tiziano Arbizzani - Area Tecnica / Sviluppo SW
DIGIBYTE SERVIZI E SISTEMI INFORMATICI
------------------------------------------------------------
  Assistenza - Vendita - Consulenza - Formazione
 Networking - Internetworking - Internet Provider
------------------------------------------------------------
  via Marziale, 9 - 40128 - Bologna (Italia)
 Tel. +39 051 6388614 Fax +39 051 323735
  www.powerstation.it - digibyte@powerstation.it
Appliance Server CubeLibre       www.cubelibre.it
<http://www.cubelibre.it/>=20



------_=_NextPart_001_01C2FD03.F4845958
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Messaggio</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>Hi =
all, I am a=20
rather newbie in firewall issues.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>I have =
noticed this=20
little problem: I am installing a network&nbsp;with =
some&nbsp;linux-boxes-router=20
for a little sized firm in my hometown.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D298452612-07042003></SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN =
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>These =
boxes have a=20
ADSL router connected to an ethernet card and an ISDN internal modem for =
backup=20
purpose. </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D298452612-07042003>Every&nbsp;remote=20
office have one of this boxes to connect&nbsp;its&nbsp;LAN to the =
central=20
headquarters LAN&nbsp;via a VPN tunnel.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>Every =
box at startup=20
tries if the ADSL is up pinging a sure Ip server, and if it's so&nbsp;it =
tries=20
to&nbsp;establish&nbsp;a VPN connection&nbsp;to headquarters.&nbsp; =
After=20
this&nbsp;it tries to ping a server in the HQ lan, and nothing happens =
since the=20
HQ server continues responding to pings (like an =
heartbeat).</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>If =
the&nbsp;HQ=20
server stops responding to pings&nbsp;it tries to ping a sure server on =
the=20
internet and if there's no response&nbsp;it realizes adsl is =
down,&nbsp;dials=20
the ISDN provider and&nbsp; try to connect via VPN to the=20
HQ.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>Let's =
come to the=20
problem : after the ADSL is fallen,&nbsp;ISDN is set up and the VPN is=20
established, for a couple of minutes the server in the HQ lan is not =
'ping'able.=20
</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D298452612-07042003>Routing is OK, (I=20
must changes routing tables after the interface swap),&nbsp; firewall =
rules are=20
(IMHO) ok, but&nbsp;server starts responding only after some=20
time.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>There =
's some kind=20
of timeout, perhaps a cached value that must become stale,&nbsp;but I =
can't=20
realize if the problem comes from the DNS or ARP cache or the =
ip_conntrack=20
table. </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>I =
tried to clear=20
both caches, using ip_dynaddr, using SNAT or MASQUERADING, lowering the =
timeouts=20
values in proc/sys/net/ipv4/route/gc* files, but I can't work around the =

problem.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>Thanks =
a lot and=20
every help is truly appreciated.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D298452612-07042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D298452612-07042003>Hi=20
all</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV><FONT color=3D#0000ff><FONT face=3D"Comic Sans MS" =
size=3D2>
<P align=3Dleft><FONT face=3D"Comic Sans MS" color=3D#0000ff=20
size=3D2>------------------------------------------------------------</FO=
NT><BR><FONT=20
face=3D"Comic Sans MS" size=3D2>&nbsp;Tiziano Arbizzani -&nbsp;Area =
Tecnica /=20
Sviluppo SW<BR><B><FONT color=3D#ff0000><FONT face=3D"Comic Sans MS" =
size=3D2>DIGIBYTE=20
SERVIZI E SISTEMI INFORMATICI<BR></FONT></B></FONT></FONT><FONT=20
face=3D"Comic Sans MS" color=3D#0000ff=20
size=3D2>------------------------------------------------------------<BR>=
&nbsp;</FONT>=20
<FONT face=3D"Comic Sans MS" color=3D#008080 size=3D2>Assistenza - =
Vendita -=20
Consulenza - Formazione<BR>&nbsp;Networking - Internetworking - Internet =

Provider<BR></FONT><FONT face=3D"Comic Sans MS" color=3D#0000ff=20
size=3D2>------------------------------------------------------------<BR>=
&nbsp;</FONT>=20
<FONT face=3D"Comic Sans MS" size=3D2>via Marziale, 9 - 40128 - Bologna=20
(Italia)<BR>&nbsp;Tel. +39 051 6388614 Fax +39 051 323735<BR>&nbsp;<U>=20
</U></FONT><U><FONT face=3D"Comic Sans MS" color=3D#0000ff=20
size=3D2>www.powerstation.it</FONT></U><FONT face=3D"Comic Sans MS" =
size=3D2>=20
-</FONT><U> <FONT face=3D"Comic Sans MS" color=3D#0000ff=20
size=3D2>digibyte@powerstation.it</FONT></U><BR></FONT><FONT =
face=3D"Comic Sans MS"=20
size=3D2>Appliance Server CubeLibre&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <A=20
href=3D"http://www.cubelibre.it/">www.cubelibre.it</A><BR></FONT></P></FO=
NT></FONT><FONT=20
color=3D#0000ff>
<P align=3Dleft><FONT face=3D"Comic Sans MS" =
size=3D2></P></FONT></FONT><FONT=20
color=3D#0000ff></FONT></DIV></BODY></HTML>
=00
------_=_NextPart_001_01C2FD03.F4845958--


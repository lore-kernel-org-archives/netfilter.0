From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: Netfilter NAT & Quake
Date: Thu, 17 Oct 2002 02:13:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F99@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C27572.110B3968"
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
To: Michel Briand <michelbriand@free.fr>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C27572.110B3968
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Michel Briand [mailto:michelbriand@free.fr] wrote:
>
>I have Linux for many years and, since 10 month I play Quake III on=20
>Internet with my little linux box ;-)
>
...
>
>I have the following problem :
>
>-- when we are 2 playing all run fine but when we are 3 the kernel =
spend=20
>more time in kernel space to deliver packets and Quake lags. A kernel=20

Wow, that strikes me as fairly odd/weird behaviour. Do you have numbers
that show this rise in kernel time when the third client enters the
scenario, like at least a "vmstat 1" output ? What hardware are you=20
running the NAT box on ?

IIRC, one thing that happens with Quake III traffic is, the client =
connects
from a fixed source UDP port. If you're masquerading this traffic, =
there's
no problem for one client behind the firewall. If a second client =
connects
to the same gameserver, the masquerading gateway will have to change
the source UDP port of this new traffic flow in order not to confuse
the Quake III server. A third client will also need a udp source port=20
change, etc. The nat box needs to keep track of this.

I don't know what the overhead of this operation is - I'm tempted to
think it should be rather unnoticable. Still, it's a theory :-)

>hacker (a friend of mine) tell me that the kernel have to work a lot=20
>with all theses packets that Quake sends&receives .... and it would be =
a=20
>race problem in the NAT & filtering code.

One other theory is that all three of you are connected to the same
Quake III server on the internet blasting away at each other, and
that there is some congestion somewhere upstream since, to the rest
of the Internet, all the Quake III traffic seems to be coming from one
IP address. Quake III =3D udp, so there's a fairly big chance of udp
traffic getting dropped by routers when there are network bursts.

What happens when all three of you are playing behind the nat box, but=20
connected to different Quake III servers ? Does the firewall choke
on that too ?

The following test would be interesting: can you put all three clients
behind your nat box and have them connect to a Quake III server on=20
a 100Mbps server ? There should be no congestion, lag or packet loss
on 100Mbps, and no problem for the server with just three clients, so=20
if you're getting lag in that setup, there is probably something wrong
with the masquerading box and you may be on to something.

>When there is only 2 connections to Quake servers actives all run fine=20
>=3D=3D the lag is not  perceptible ...

ok.

>-- when a box of my LAN connects, my host (the router) could not =
connect=20
>to Quake III server anymore ... When the connection is in the inverse=20
>order (my host =3D route, another box of my LAN) all connect fine.

Yep, this is possible in this scenario (remember the "same source udp
port" thing from above):

- you masquerade udp traffic coming from your LAN
- you don't masquerade traffic coming from the local box

The masquerading/nat code has checks for source ports that are in use
and adjusts those on the fly, but your locally generated traffic
doesn't go through the masquerade code.

This problem should disappear if you also masquerade traffic from
the local machine on your Internet interface.

>-- when I decide to run eDonkey from my M$ box, it complains about the=20
>port 4662 that I've specified in firewall to be open .... and it's not =
????
>

Sorry, can't help you with that one without more help...

Regards,
Filip






------_=_NextPart_001_01C27572.110B3968
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: Netfilter NAT &amp; Quake</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
Michel Briand [<A =
HREF=3D"mailto:michelbriand@free.fr">mailto:michelbriand@free.fr</A>] =
wrote:<BR>
&gt;<BR>
&gt;I have Linux for many years and, since 10 month I play Quake III =
on<BR>
&gt;Internet with my little linux box ;-)<BR>
&gt;<BR>
...<BR>
&gt;<BR>
&gt;I have the following problem :<BR>
&gt;<BR>
&gt;-- when we are 2 playing all run fine but when we are 3 the kernel =
spend<BR>
&gt;more time in kernel space to deliver packets and Quake lags. A =
kernel<BR>
<BR>
Wow, that strikes me as fairly odd/weird behaviour. Do you have =
numbers<BR>
that show this rise in kernel time when the third client enters the<BR>
scenario, like at least a &quot;vmstat 1&quot; output ? What hardware =
are you<BR>
running the NAT box on ?<BR>
<BR>
IIRC, one thing that happens with Quake III traffic is, the client =
connects<BR>
from a fixed source UDP port. If you're masquerading this traffic, =
there's<BR>
no problem for one client behind the firewall. If a second client =
connects<BR>
to the same gameserver, the masquerading gateway will have to change<BR>
the source UDP port of this new traffic flow in order not to confuse<BR>
the Quake III server. A third client will also need a udp source =
port<BR>
change, etc. The nat box needs to keep track of this.<BR>
<BR>
I don't know what the overhead of this operation is - I'm tempted to<BR>
think it should be rather unnoticable. Still, it's a theory :-)<BR>
<BR>
&gt;hacker (a friend of mine) tell me that the kernel have to work a =
lot<BR>
&gt;with all theses packets that Quake sends&amp;receives .... and it =
would be a<BR>
&gt;race problem in the NAT &amp; filtering code.<BR>
<BR>
One other theory is that all three of you are connected to the same<BR>
Quake III server on the internet blasting away at each other, and<BR>
that there is some congestion somewhere upstream since, to the rest<BR>
of the Internet, all the Quake III traffic seems to be coming from =
one<BR>
IP address. Quake III =3D udp, so there's a fairly big chance of udp<BR>
traffic getting dropped by routers when there are network bursts.<BR>
<BR>
What happens when all three of you are playing behind the nat box, =
but<BR>
connected to different Quake III servers ? Does the firewall choke<BR>
on that too ?<BR>
<BR>
The following test would be interesting: can you put all three =
clients<BR>
behind your nat box and have them connect to a Quake III server on<BR>
a 100Mbps server ? There should be no congestion, lag or packet loss<BR>
on 100Mbps, and no problem for the server with just three clients, =
so<BR>
if you're getting lag in that setup, there is probably something =
wrong<BR>
with the masquerading box and you may be on to something.<BR>
<BR>
&gt;When there is only 2 connections to Quake servers actives all run =
fine<BR>
&gt;=3D=3D the lag is not&nbsp; perceptible ...<BR>
<BR>
ok.<BR>
<BR>
&gt;-- when a box of my LAN connects, my host (the router) could not =
connect<BR>
&gt;to Quake III server anymore ... When the connection is in the =
inverse<BR>
&gt;order (my host =3D route, another box of my LAN) all connect =
fine.<BR>
<BR>
Yep, this is possible in this scenario (remember the &quot;same source =
udp<BR>
port&quot; thing from above):<BR>
<BR>
- you masquerade udp traffic coming from your LAN<BR>
- you don't masquerade traffic coming from the local box<BR>
<BR>
The masquerading/nat code has checks for source ports that are in =
use<BR>
and adjusts those on the fly, but your locally generated traffic<BR>
doesn't go through the masquerade code.<BR>
<BR>
This problem should disappear if you also masquerade traffic from<BR>
the local machine on your Internet interface.<BR>
<BR>
&gt;-- when I decide to run eDonkey from my M$ box, it complains about =
the<BR>
&gt;port 4662 that I've specified in firewall to be open .... and it's =
not ????<BR>
&gt;<BR>
<BR>
Sorry, can't help you with that one without more help...<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C27572.110B3968--


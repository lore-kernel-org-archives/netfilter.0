From: Josh Nerius <jnerius@gmail.com>
Subject: Re: iptables dnat, ebtables, mark
Date: Wed, 10 Nov 2004 10:22:18 -0600
Message-ID: <4f3930a704111008222e7650cd@mail.gmail.com>
References: <419236F6.4060306@uplink-verein.ch>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419236F6.4060306@uplink-verein.ch>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter@lists.netfilter.org

I have been experimenting with a very similar setup and have found
that in order to DNAT traffic transparently coming through the bridge,
it was necessary to set an ip address on the virtual bridge interface
and appropriate routes.

I haven't needed to use ebtables up to this point...Here is a rule
that I've used that I've had some luck with.

iptables -t nat -I PREROUTING -m physdev --physdev-in $IN_INT -m mac
--mac-source $MAC -j DNAT --to $WEBSERVER

Make sure to properly set the physdev interface. Though this isn't
entirely necessary, I've seen weird things happen without it.

It is important that the site you're DNATing to doesn't require host
headers as this has seemingly caused issues.

Another approach I'm experimenting with is DNATing dns requests
instead to a server set for the purpose of resolving everything to a
particular ip and then dropping all other traffic from that customer
that's not either destined for the dns server or the web server that
you're directing them to.

Let me know if this helps.

Josh Nerius

On Wed, 10 Nov 2004 16:42:46 +0100, Moritz Gartenmeister
<moritz@uplink-verein.ch> wrote:
> hi
>=20
> my idea:
> i know the mac-adress from a compromised computer in my lan. i want to re=
direct all the traffic from
> this computer to a webserver (to show up a page with e.g. "bad guy! you g=
ot a virus").
>=20
> my system:
> debian testing 2.6.7
> iptables
> ebtables
> bridge-code
>=20
> my solution so far:
> ebtables -t nat -A PREROUTING -s $MAC -j mark --set-mark 8 --mark-target =
CONTINUE
> there are no other rules in this chain.
> some more rules in -A FORWARD all with -s macadress, but not the one abov=
e.
>=20
> is the only rule in prerouting nat.
> iptables -t nat -A PREROUTING -m mark --mark 0x8 -j DNAT --to-destination=
 $IP-WWW
>=20
> is the first role in the mangle chain.
> iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT
>=20
> one check rule in mangl POSTROUTING
> iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-prefix=
 IPT_MARK
>=20
> my problem:
> the user can access the webserver and only this server, but the user is n=
ot redirected to the
> web-server, if he tries to access e.g. www.google.com. he only get an err=
or-message.
>=20
> my observation:
> number of packets differ...
> ebtables 213 packets
> prerouting mangle 200 packets
> prerouting nat 118 packets
> postrouting mangle 93 packets
>=20
> any explanations? the number should be at least the same. i don't underst=
and this. the filter-rules
> seem to work properly...
>=20
> cheers
> moritz
>=20
> --
> Uplink student association
> Moritz Gartenmeister
> B=FClachstrasse 1 F
> 8057 Z=FCrich
> Switzerland
>=20
>=20


--=20
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]


From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: Re: iptables dnat, ebtables, mark
Date: Mon, 15 Nov 2004 15:36:22 +0100
Message-ID: <4198BEE6.9080406@uplink-verein.ch>
References: <419236F6.4060306@uplink-verein.ch>
	<4f3930a704111008222e7650cd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4f3930a704111008222e7650cd@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Josh Nerius <jnerius@gmail.com>
Cc: netfilter@lists.netfilter.org

hi josh and list

i'm now a little bit confused...

> iptables -t nat -I PREROUTING -m physdev --physdev-in $IN_INT -m mac
> --mac-source $MAC -j DNAT --to $WEBSERVER

this was working perfectly, as soon as i added route add -net 172.17.0.0 =
netmask 255.255.0.0 dev br0
and also the default gw to br0.

but now i changed a little bit my setup.

LAN --> Firewall --> gateway

the web-server is between the lan and the firewall.

before it was: lan --> firewall --> www --> gw

my rule is:
iptables -t nat -A PREROUTING -p -tcp --dport 80 -m physdev --physdev-in =
eth2 -mac --mac-source $MAC
-j DNAT --to-destination $WEBSERVER:8080

the user cannot access any websites, besides the intranet, but he is not =
redirected to the web-server.
IMHO it should work: www.google.com -> $WEBSERVER:8080

the web-server is on the same device (eth2).

any ideas?
ok. i also added -p tcp and --dport 80 and 8080, but removing this does n=
ot help.

regards
moritz

Josh Nerius wrote:
> I have been experimenting with a very similar setup and have found
> that in order to DNAT traffic transparently coming through the bridge,
> it was necessary to set an ip address on the virtual bridge interface
> and appropriate routes.
>=20
> I haven't needed to use ebtables up to this point...Here is a rule
> that I've used that I've had some luck with.
>=20
> iptables -t nat -I PREROUTING -m physdev --physdev-in $IN_INT -m mac
> --mac-source $MAC -j DNAT --to $WEBSERVER
>=20
> Make sure to properly set the physdev interface. Though this isn't
> entirely necessary, I've seen weird things happen without it.
>=20
> It is important that the site you're DNATing to doesn't require host
> headers as this has seemingly caused issues.
>=20
> Another approach I'm experimenting with is DNATing dns requests
> instead to a server set for the purpose of resolving everything to a
> particular ip and then dropping all other traffic from that customer
> that's not either destined for the dns server or the web server that
> you're directing them to.
>=20
> Let me know if this helps.
>=20
> Josh Nerius
>=20
> On Wed, 10 Nov 2004 16:42:46 +0100, Moritz Gartenmeister
> <moritz@uplink-verein.ch> wrote:
>=20
>>hi
>>
>>my idea:
>>i know the mac-adress from a compromised computer in my lan. i want to =
redirect all the traffic from
>>this computer to a webserver (to show up a page with e.g. "bad guy! you=
 got a virus").
>>
>>my system:
>>debian testing 2.6.7
>>iptables
>>ebtables
>>bridge-code
>>
>>my solution so far:
>>ebtables -t nat -A PREROUTING -s $MAC -j mark --set-mark 8 --mark-targe=
t CONTINUE
>>there are no other rules in this chain.
>>some more rules in -A FORWARD all with -s macadress, but not the one ab=
ove.
>>
>>is the only rule in prerouting nat.
>>iptables -t nat -A PREROUTING -m mark --mark 0x8 -j DNAT --to-destinati=
on $IP-WWW
>>
>>is the first role in the mangle chain.
>>iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT
>>
>>one check rule in mangl POSTROUTING
>>iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-pref=
ix IPT_MARK
>>
>>my problem:
>>the user can access the webserver and only this server, but the user is=
 not redirected to the
>>web-server, if he tries to access e.g. www.google.com. he only get an e=
rror-message.
>>
>>my observation:
>>number of packets differ...
>>ebtables 213 packets
>>prerouting mangle 200 packets
>>prerouting nat 118 packets
>>postrouting mangle 93 packets
>>
>>any explanations? the number should be at least the same. i don't under=
stand this. the filter-rules
>>seem to work properly...
>>
>>cheers
>>moritz
>>
>>--
>>Uplink student association
>>Moritz Gartenmeister
>>B=FClachstrasse 1 F
>>8057 Z=FCrich
>>Switzerland
>>
>>
>=20
>=20
>=20


--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland


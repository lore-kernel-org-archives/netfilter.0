From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: Re: iptables dnat, ebtables, mark
Date: Wed, 10 Nov 2004 17:16:10 +0100
Message-ID: <41923ECA.9030005@uplink-verein.ch>
References: <419236F6.4060306@uplink-verein.ch>
	<20041110155643.GA19707@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041110155643.GA19707@bender.817west.com>
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
To: netfilter@lists.netfilter.org



Jason Opperisano wrote:
> On Wed, Nov 10, 2004 at 04:42:46PM +0100, Moritz Gartenmeister wrote:
>=20

>>is the first role in the mangle chain.
>>iptables -t mangle -A PREROUTING -m mark --mark 0x8 -j ACCEPT
>=20
>=20
> are you filtering packets in MANGLE?

yes i do, but i don't drop packets, except malformed packets (like: if th=
e packet is coming from=20
inside, then it must have an ip from the private net 172.17.0.0/16, else =
drop).

and i use mark to classify packets:
mark 2 for all p2p-packets
mark 3 for all http-packets
and so on... (none with 8)

this marks are used later for tc.

>=20
>>one check rule in mangl POSTROUTING
>>iptables -t mangle -A POSTROUTING -m -mark --makr 0x8 -j LOG --log-pref=
ix=20
>>IPT_MARK
>=20
>=20
> are you getting logs out of this rule?  if so--do the src/dst IP's look
> like they should?

yes they do. but i think, that not all packets are dnatted, although they=
 are correctly marked.

>>my observation:
>>number of packets differ...
>>ebtables 213 packets
>>prerouting mangle 200 packets

this numbers should be the same, because there is no rule between.

>>prerouting nat 118 packets
>>postrouting mangle 93 packets
>>
>>any explanations? the number should be at least the same. i don't=20
>>understand this. the filter-rules
>>seem to work properly...
>=20
>=20
> i think you need to describe the relative locations of the client,
> bridge, and web server.

users -- filter-server -- switch -- gw
                              |
                              |
                          webserver



> it sounds like it could be a routing problem.

hm... this is the only connection, which is routed. the rest of the traff=
ic is just marked and=20
shaped with tc.

moritz
--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland


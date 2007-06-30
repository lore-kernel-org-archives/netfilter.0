From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: Re[2]: howto make SNAT preserve translation ip for
	allconnectionsfromthe same internal ip
Date: Sat, 30 Jun 2007 14:28:42 -0600
Message-ID: <BBDDF0B7CFFFCE4FB5110F0A37CE6003E757@q.leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: =?koi8-r?B?8M/Qz9cg6cfP0tgg7snLz8zBxdfJ3iA=?= <igorpopov@newmail.ru>, davila@nicaraguaopensource.com, netfilter@lists.netfilter.org

You need to use the SAME target instead of SNAT and also specify the =
--nodst option. I just ran into this problem yesterday and that was the =
fix.

iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SAME --nodst --to =
194.236.50.1-194.236.50.7

That should get it doing what you want.

Robert

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of ????? ????? ??????????
> Sent: Saturday, June 30, 2007 1:38 PM
> To: davila@nicaraguaopensource.com; netfilter@lists.netfilter.org
> Subject: Re[2]: howto make SNAT preserve translation ip for
> allconnectionsfromthe same internal ip
>=20
> Hello, Jorge Davila
> =F3=C2, 30.06.2007 16:21:27 you wrote:
>=20
> JD> Well, is not enough add
> JD> -s 192.168.0.0/24
> JD> to the rule?
> JD> Jorge D=E7=A1vila.
>=20
> No, I want that any connection (different streams) from particular ip =
of
> internal network always nated to the same external ip.
> Is it by default?
>=20
> JD> >    Hi, all.
> JD> >Say, I use iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT =
--
> to-source
> JD> >194.236.50.1-194.236.50.7 for NAT. Accordingly to man:
> JD> >The source IP for each stream that we open would then be =
allocated
> randomly
> JD> >from these (194.236.50.1-194.236.50.7), and a single stream would
> always use
> JD> >the same IP address for all packets within that stream.
> JD> >
> JD> >What if I want that internal ip from block 192.168.0.0/24 is =
always
> translated
> JD> >into the same external ip?
> JD> >PF from OpenBSD does it:
> JD> >
> JD> >     For nat and rdr rules, (as well as for the route-to, =
reply-to
> and dup-to
> JD> >     rule options) for which there is a single redirection =
address
> which has
> JD> >a
> JD> >     subnet mask smaller than 32 for IPv4 or 128 for IPv6 (more =
than
> one IP
> JD> >     address), a variety of different methods for assigning this
> address can
> JD> >     be used:
> JD> >
> JD> >     bitmask
> JD> >           The bitmask option applies the network portion of the
> redirection
> JD> >           address to the address to be modified (source with =
nat,
> JD> >destination
> JD> >           with rdr).
> JD> >
> JD> >     random
> JD> >           The random option selects an address at random within =
the
> defined
> JD> >           block of addresses.
> JD> >
> JD> >     source-hash
> JD> >           The source-hash option uses a hash of the source =
address
> to deter-
> JD> >           mine the redirection address, ensuring that the
> redirection
> JD> >address
> JD> >           is always the same for a given source.  An optional =
key
> can be
> JD> >           specified after this keyword either in hex or as a =
string;
> by de-
> JD> >           fault pfctl(8) randomly generates a key for =
source-hash
> every time
> JD> >           the ruleset is reloaded.
> JD> >
> JD> >     round-robin
> JD> >           The round-robin option loops through the redirection
> address(es).
> JD> >
> JD> >           When more than one redirection address is specified,
> round-robin
> JD> >is
> JD> >           the only permitted pool type.
> JD> >
> JD> >     static-port
> JD> >           With nat rules, the static-port option prevents pf(4) =
from
> modify-
> JD> >           ing the source port on TCP and UDP packets.
> JD> >
> JD> >     Additionally, the sticky-address option can be specified to =
help
> ensure
> JD> >     that multiple connections from the same source are mapped to =
the
> same
> JD> >     redirection address.  This option can be used with the =
random
> and round-
> JD> >     robin pool options.  Note that by default these associations =
are
> de-
> JD> >     stroyed as soon as there are no longer states which refer to
> them; in
> JD> >or-
> JD> >     der to make the mappings last beyond the lifetime of the =
states,
> JD> >increase
> JD> >     the global options with set timeout src.track.  See STATEFUL
> TRACKING
> JD> >     OPTIONS for more ways to control the source tracking.
> JD> >
> JD> >
> JD> --
> JD> Jorge Isaac Davila Lopez
> JD> Nicaragua Open Source
> JD> +505 430 5462
> JD> davila@nicaraguaopensource.com
>=20
>=20
> Igor Popov <igorpopov@newmail.ru>
> icq 241601876
> jid ipopovi@gmail.com
>=20
> __________
> www.newmail.ru -- =D7=D3=C5=C7=C4=C1 =DE=D4=CF-=D4=CF =CE=CF=D7=CF=C5.
>=20




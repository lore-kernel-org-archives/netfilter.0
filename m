From: Michael Gale <mgale@utilitran.com>
Subject: Re: Protecting against DoS
Date: Tue, 9 Dec 2003 09:02:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209090221.413b7286.mgale@utilitran.com>
References: <20031209154333.GB17221@edu.joroinen.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209154333.GB17221@edu.joroinen.fi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello,

	First make sure you are using tcpsyn_cookies:

echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compiled it i=
nto the kernel. This will help prevent DOS by assigning each incoming syn p=
acket a cookie instead of a actually connection state. A connection state w=
ill be created once the three way hand shake is completed.

Second -- you should be dropping all packets on all interfaces and then onl=
y allow connections you have to pass.

Michael.


On Tue, 9 Dec 2003 17:43:34 +0200
Pasi K=E4rkk=E4inen <pasik@iki.fi> wrote:

> Hello!
>=20
> I was thinking about the correct or best way to protect my Linux/netfilte=
r=20
> box againts DoS-attacks.=20
>=20
> Some time ago one of the windows users in my LAN managed to get nimda (or
> some other) worm to his computer. The worm started scanning the internet
> for other vulnerable boxes, opening big amount of tcp-connections all the
> time without closing them.=20
>=20
> So after a while I hit the limit of max. open connections
> (/proc/sys/net/ipv4/ip_conntrack_max), and the firewall-box is basicly
> DoS:ed. With the default settings, open tcp-connections stay in the state
> table for 5 days, so it takes a looong time to get things running again if
> you don't reload the modules or reboot the box..
>=20
> Now I have a couple of questions to be sure about the facts while setting=
=20
> up the correct limits to prevent this kind of DoS-attacks..
>=20
>=20
> 1) Is the correct formula to calculate the maximum number of connections
> (for /proc/sys/net/ipv4/ip_conntrack_max) free_memory_in_bytes / 350 ? Th=
is
> is what I got from the Netfilter FAQ: "You can easily increase the number=
 of
> maximal tracked connections, but be aware that each tracked connection ea=
ts
> about 350 bytes of non-swappable kernel memory!"
>=20
> 2) Netfilter FAQ: "To optimize performance, please also raise the number =
of
> hash buckets by using the hashsize module loadtime parameter of the
> ip_conntrack.o module." What's the correct formula to calculate good value
> for hashsize?
>=20
> 3) Is there some problem other than the idle tcp-connections dying sooner=
 if I
> lower the the value of TCP_CONNTRACK_ESTABLISHED in
> /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c from 5 days to=
 1
> day or even less (to get the possible non-closed tcp-connections out from=
 the state
> table sooner) ?
>=20
> 4) What's the correct place to set up limits for new connections (to prev=
ent
> the state table being filled up in DoS) ? Is it better to do in the=20
> mangle-table/PREROUTING-chain something like "-m state --state NEW -m lim=
it=20
> --limit 5/sec -j RETURN && -j DROP" than later in the filter-table/FORWAR=
D-chain?
> I'm thinking about performance here..
>=20
> 5) I'm thinking about measuring average "new connections per second"-rate
> and setting up limits to obey that.. is this good way?
>=20
> 6) Do you have some other tips? What are the biggest problems in addition=
 to
> getting the state table filled up..
>=20
>=20
> Thanks for your replies!
>=20
> -- Pasi K=E4rkk=E4inen
>       =20
>                                    ^
>                                 .     .
>                                  Linux
>                               /    -    \
>                              Choice.of.the
>                            .Next.Generation.
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation


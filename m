From: Horacio =?iso-8859-1?Q?J=2E_Pe=F1a?= <horape@tinuviel.compendium.com.ar>
Subject: Re: what is blocking packets before netfilter?
Date: Sun, 6 Mar 2005 01:13:29 -0300
Message-ID: <20050306041328.GA20320@tinuviel.compendium.com.ar>
References: <20050306031742.GB952@tinuviel.compendium.com.ar>
	<Pine.LNX.4.60.0503052252340.16418@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0503052252340.16418@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

> Is tcpd enabled, does your system have a /etc/hosts.deny file, or  a=20
> hosts.allow that is populated?

No, and afaiu, they shouldn't matter at netfilter level.

> Is there a DSL router, or other=20
> router/intelligent hub with an integrated firewall in it infront of or=20
> behind the iptables firewall?  Could your ISP be blocking ICMP traffic?

The packets are getting to the box. tcpdump sees them, iptables don't.

Thanks,
HoraPe


> Ron DuFresne
>=20
> On Sun, 6 Mar 2005, Horacio [iso-8859-1] J. Pe=F1a wrote:
>=20
> >I have:
> >
> ># iptables -L -n -t mangle -v
> >Chain INPUT (policy ACCEPT 19862 packets, 1603K bytes)
> >pkts bytes target     prot opt in     out     source              =20
> >destination
> >   0     0 LOG        all  --  eth0   *       192.168.2.0/24      =20
> >   0.0.0.0/0           LOG flags 0 level 4
> >
> ># iptables -L -n -t filter -v
> >Chain INPUT (policy ACCEPT 17061 packets, 1410K bytes)
> >pkts bytes target     prot opt in     out     source              =20
> >destination
> >   0     0 LOG        all  --  eth0   *       192.168.2.0/24      =20
> >   0.0.0.0/0           LOG flags 0 level 4
> >
> ># tcpdump -nvvvpe icmp
> >tcpdump: listening on eth0, link-type EN10MB (Ethernet), capture size 96=
=20
> >bytes
> >15:44:34.189337 00:08:a1:6c:39:00 > 00:0a:e6:2d:90:77, ethertype IPv4=20
> >(0x0800), length 98: IP (tos 0x0, ttl64, id 1016, offset 0, flags [DF],=
=20
> >length: 84) 192.168.2.1 > 10.5.0.1: icmp 64: echo request seq 63491
> >
> >00:0a:e6:2d:90:77 is my MAC.
> >
> >/proc/sys/net/ipv4/conf/*/rp_filter are 0.
> >/proc/sys/net/ipv4/conf/*/forwarding are 1.
> >
> >What could be eating the packets? Shouldn't iptables see anything that=
=20
> >comes to the interface?
> >
> >Thanks,
> >					HoraPe
> >---
> >Horacio J. Pe=F1a
> >horape@compendium.com.ar
> >horape@uninet.edu
> >
> >
>=20
> - --=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>=20
> ...Love is the ultimate outlaw.  It just won't adhere to rules.
> The most any of us can do is sign on as it's accomplice.  Instead
> of vowing to honor and obey, maybe we should swear to aid and abet.
> That would mean that security is out of the question.  The words
> "make" and "stay" become inappropriate.  My love for you has no
> strings attached.  I love you for free...
>                         -Tom Robins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFCKn99st+vzJSwZikRAohTAKC1rYIlSjBXqJwywaJIovA/+ahYpACfYtlv
> JA1L3qlbYZ6WmmEMwFIAxYw=3D
> =3DPK99
> -----END PGP SIGNATURE-----


--=20
					HoraPe
---
Horacio J. Pe=F1a
horape@compendium.com.ar
horape@uninet.edu


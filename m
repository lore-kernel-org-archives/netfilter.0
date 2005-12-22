From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: Re: ICMP types to allow
Date: Thu, 22 Dec 2005 12:03:18 +0100
Message-ID: <20051222110318.GM6958@nephtys.luchs.at>
References: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
	<20051222002905.GI25728@nightfall.luchs.at>
	<1135217304.30754.69.camel@siren.chrisbrenton.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1135217304.30754.69.camel@siren.chrisbrenton.org>
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
To: netfilter@lists.netfilter.org


--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 21, 2005 at 2108 -0500, Chris Brenton appeared and said:
> On Thu, 2005-12-22 at 01:29 +0100, Ren=C3=A9 Pfeiffer wrote:
> >
> > This is true. However you need some inbound ICMP in order to support
> > things like Path MTU discovery.
>=20
> As mentioned, the only modern OS I'm aware of that uses straight ICMP
> for MTU path is 3-4 year old AIX boxes. The sane way to do this is to
> set Don't Fragment (DF) in the IP header and watch for returning type 3
> code 4's.

Yes, you are right. We have some of these old AIX boxes that do exactly
this kind of ICMP behaviour and some of our servers have to talk to them.
That's why I used the conservative approach and allowing more ICMP
message types.

> I've run the following rules for about four years now on numerous
> firewalls I maintain:
> iptables -A FORWARD -p icmp -f -j LOG --log-prefix " ICMPFRAG "
> iptables -A FORWARD -p icmp -f -j REJECT --reject-with
> icmp-host-unreachable
>=20
> In short, the rules look for fragmented ICMP datagrams. I've seen
> exactly zero legitimate packets get picked up by this rule. Every time
> its triggered its been because of an attack.

That's a good idea. You can also use the packet counters to see if you
have rules that are used and if certain packets appear at your
perimeter.

Best,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqof2eMu5lRpXJ7kRAnBXAJwJDCAcuL5juVRjWOL0/AnDzLx2PgCcCB7J
zunlzRKkAdNaSpGALHvqq/0=
=NDoC
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--


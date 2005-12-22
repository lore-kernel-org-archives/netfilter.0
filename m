From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: Re: ICMP types to allow
Date: Thu, 22 Dec 2005 01:29:05 +0100
Message-ID: <20051222002905.GI25728@nightfall.luchs.at>
References: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B722@mailbox.vikus.com>
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


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 21, 2005 at 1336 -0500, Derick Anderson appeared and said:
>=20
> After reading the ICMP state machine section of the Netfilter tutorial
> [http://iptables-tutorial.frozentux.net/iptables-tutorial.html#ICMPCONNE
> CTIONS] it appears that ICMP traffic related to existing TCP and UDP
> connections falls under the RELATED,ESTABLISHED rules.

This is true. However you need some inbound ICMP in order to support
things like Path MTU discovery. I often allow the inbound ICMP message types
time-exceeded, destination-unreachable and parameter-problem. This
covers messages that deal with packet fragmentation. You might want to
disallow some of the destination-unreachable messages.

Best,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqfNReMu5lRpXJ7kRApkwAKC7+22HmjOZhelHqGjHQbjOETARuQCgvOIr
JmV/gNCrMTk2cNIRxXJgRKw=
=p081
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--


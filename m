From: =?utf-8?B?UmVuw6k=?= Pfeiffer <lynx@luchs.at>
Subject: Re: ipt_IPV4OPTSSTRIP & Linux 2.6.14.4
Date: Sat, 24 Dec 2005 19:07:26 +0100
Message-ID: <20051224180725.GD7971@nightfall.luchs.at>
References: <20051223174303.GB31822@nightfall.luchs.at>
	<20051223192140.GE31628@legolas.on.net.mk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051223192140.GE31628@legolas.on.net.mk>
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


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 23, 2005 at 2021 +0100, Damjan appeared and said:
> > [...]
> > A short "grep skb_ip_make_writable net/ipv4/netfilter/*.c" shows that
> > skb_ip_make_writable() is only used in the IPV4OPTSSTRIP extension. Has
> > anyone else seen this error?
>=20
> skb_ip_make_writable is renamed to skb_make_writable, but that's a
> "warning", it's not what causes the compile error(*).=20
>=20
> The compile error is because of this line :
> 	skb->nfcache |=3D NFC_ALTERED;
>=20
> which I removed, not knowing what it does, and then ipt_IPV4OPTSSTRIP=20
> compiles... but I don't know if it works :)

Hm, then let's find out. ;) I thought it must be something like this,
but I asked because I am not that familiar withe the code of the
Netfilter extensions. I'll let you know what my firewall system said. It
has problem with the Ralink wireless driver as well, so there will be a
lot of compiling anyway.

Thanks,
Ren=C3=A9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -


--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDrY5deMu5lRpXJ7kRAhGyAJ4/WERoCbS7mSjg6eD+OsaDdo1YlQCgvtTT
HeRucDJBjcgylZmXG3aY5Ng=
=TNIn
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--


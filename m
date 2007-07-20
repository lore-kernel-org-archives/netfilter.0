From: Thomas Jacob <jacob@internet24.de>
Subject: Re: need advice for high traffic network
Date: Sat, 21 Jul 2007 01:14:50 +0200
Message-ID: <20070720231450.GA20743@internet24.de>
References: <Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com>
	<20070719234458.GA17253@internet24.de>
	<469FFF4B.5030704@relevad.com>
	<20070720074854.GC17809@internet24.de>
	<Pine.LNX.4.63.0707201044550.24729@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0707201044550.24729@qynat.qvtvafvgr.pbz>
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


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> you should run the tests. doing a hash across too many buckets ends up=20
> costing performance as well.

Yes, I should :=3D)

> you want the list per bucket to not be too long, but you also don't want =
to=20
> spend more effort and ram on empty buckets.

What's the extra effort when you have the ram to spare? A worst
you might slightly reduce the cache hit rate.

> setting conntrack_max equal to the number of buckets doesn't mean that yo=
u=20
> will have one entry in each bucket, it means that you will have a lot of=
=20
> empty buckets and other buckets with several items in them.

Right, but it's more likely to have short bucket lists if you have
more hash buckets, given the same number of connections, isn't it?

> >The FAQ says though, that one should use odd hash bucket counts, so you
> >might want to decrease that by one.
>=20
> it's not unusual for simple (i.e. cheap to use) has algorithims to have=
=20
> pathalogical results for specific sizes. ideally you want the bucket coun=
t=20
> to be a prime number, if it's not (for example a even power of 2) you can=
=20
> get situations where it only puts things in a very small number of bucket=
s.

As far as I understand is, the Jenkins Hash used internally in netfilter
and other parts of the Linux kernel, isn't just your average
text book hash, but something with quite a lot of thought and analysis
behind it:

=3D> http://www.burtleburtle.net/bob/hash/doobs.html


--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGoUHqgF9cFv867HwRAt00AJ9KpBs2UuibYkw2v6HvvIZTXXcxPgCgzQ+g
Kqrx7oXb7Ve7ntQXgTD4PaU=
=Oyb/
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--


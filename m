From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ipt_recent 0.3.0 --rttl still doesn't work (I made a patch instead, can't wait)
Date: Mon, 3 Mar 2003 19:49:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030304004945.GQ2721@ns.snowman.net>
References: <F1167IjdMZNs8cqeI3F0000bd9c@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3mUD2hqWbnBptYHy"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F1167IjdMZNs8cqeI3F0000bd9c@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: per j <perj8@hotmail.com>
Cc: netfilter@lists.netfilter.org, ipt_recent@snowman.net


--3mUD2hqWbnBptYHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* per j (perj8@hotmail.com) wrote:
> >apparently.  I believe that *should* read:
> >while(hash_table[hash_result] !=3D -1 &&=20
> >!(r_list[hash_table[hash_result]].addr =3D=3D addr &&
> >	(!r_list[hash_table[hash_result]].ttl ||=20
> >r_list[hash_table[hash_result]].ttl !=3D ttl))) {
> >
> >Instead.  Note that I also had to invert the ttl check, it should be
> >considered a collision when the ttl doesn't match and matching ttl has
> >been requested.
> >
>=20
> It's already inverted at '-1 && !(...)', so I'm using the original ttl=20
> check.

Oh, right, good point, thanks.

	Stephen

--3mUD2hqWbnBptYHy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Y/gprzgMPqB3kigRAna8AKCEN4thPHMsbDdKHdbgRRBtJRNmBQCbBEYZ
WNbwPMMn++DgNOfGf1gVdWY=
=sVBk
-----END PGP SIGNATURE-----

--3mUD2hqWbnBptYHy--


From: Alpt <alpt@freaknet.org>
Subject: Ipv6 array ORDER
Date: Mon, 19 Jul 2004 16:28:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040719142833.GA26461@darkalpt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi there,
What's the ipv6 array ORDER in the in6_addr struct?
In other words what's the word order of  "__u32           u6_addr32[4];" ?
Is it "most significant word first" or "least significant first"?

And each word is in network byte order right?

Thanks ;)
--=20
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint =3D 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA+9qRv/gDfkQc8O4RArkQAJ92AcLGknMtKdfnBzNVBc6gw63v6ACeNL2n
VXd4t3Jqi80Ud2aS4lDOuvU=
=ro1u
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--


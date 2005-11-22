From: Bart Trojanowski <bart@jukie.net>
Subject: creating SYN bursts
Date: Mon, 21 Nov 2005 21:54:00 -0500
Message-ID: <20051122025400.GD29926@jukie.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am doing some syn-flood testing.  I would like to create bursts of
real connections by using 'wget &' from a loop in user space, and have
the connections "queued up".  When everything is ready, I would like to
have all the SYNs sent out at (almost) the same time.

Is it possible to do something like this?  Can I use existing iptables
plugins?  If not, what NF primitives should I employ?

-Bart

--=20
				WebSig: http://www.jukie.net/~bart/sig/

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDgohI/zRZ1SKJaI8RApFKAJ9snT4YhZxy+jxwVfOl6TVA8/jfIACg9K9S
WU0UPzHfjrVuCRNnXDvx0aY=
=OLf6
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--


From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Preventing port scanning
Date: Wed, 7 Apr 2004 15:28:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040407192803.GE7060@ns.snowman.net>
References: <000001c41ccc$1eae1dd0$0464a8c0@stu> <200404071957.15692.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9K7v3Z8Qj/cfwSaN"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404071957.15692.Antony@Soft-Solutions.co.uk>
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


--9K7v3Z8Qj/cfwSaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Antony Stone (Antony@Soft-Solutions.co.uk) wrote:
> On Wednesday 07 April 2004 7:14 pm, Stuart Lamble wrote:
> (If, for some reason, you need to have some ports open for external acces=
s to=20
> your network, then no, you cannot prevent people from discovering this.)
>=20
> You might try using some sort of tarpit rules to bog down a naive port sc=
anner=20
> which scans multiple ports in a short period of time, however these will =
have=20
> no effect on scanners which are only looking for a small number of ports=
=20
> (such as 21,22,23,25,53,80,110,119,143 for example).

It depends on what ports need to be open and what ports are being
scanned.  Using your example above and ipt_recent, if you don't have
port 21 open and the scan starts with that then you can drop the rest of
the attempted connections.  Of course, if the scanner is doing this
across a couple of hours or from many different IP addresses it gets
more difficult.

	Stephen

--9K7v3Z8Qj/cfwSaN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAdFZDrzgMPqB3kigRAmDzAKCAsBbvwkYU6w+ObiWZ+8xbroDCcACcDQ+5
d2kT44UXmQ09CCvE+YmKgWI=
=pm+h
-----END PGP SIGNATURE-----

--9K7v3Z8Qj/cfwSaN--


From: Axel Thimm <Axel.Thimm@physik.fu-berlin.de>
Subject: Gigabit filtering
Date: Wed, 5 Mar 2003 15:08:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305140854.GG3252@puariko.nirvana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <200303051819.h25IJXTf005898@puariko.nirvana>
Content-Disposition: inline
Resent-To: netfilter@lists.netfilter.org
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


--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We would like to setup a netfilter based firewall in front of a Gigabit
connection to the main campus backbone. Would someone on this list want to
share his experience?

A duplex Gigabit NIC has nominally a throughput of 250MB/sec. Doing this for
both directions (intern <-> extern) doubles the internal traffic bandwidth =
to
500MB/sec. Even PCI64/66MHz has a nominal max. throughput of 528 MB/sec, so
this is scratching the limit.

What are the solutions?
o Dual-port NICs with zerocopy for avoiding PCI traffic (I have seen some
  expensive ones from Intel). Can those dual-port NICs zerocopy from one po=
rt
  to the other? Is that supported from linux/netfilter?
o Multiple PCI-busses with one NIC per bus?

Any hardware recommendations? :)

Thanks!
--=20
Axel.Thimm@physik.fu-berlin.de

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ZgT2QBVS1GOamfERArZMAJ9e6Ews6PnBUgZKSrZdZKC1EpJchQCfa9qY
GCj260iPS3sSjfTrsYMUyJo=
=YiYD
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--


From: Clemens <clemens.schaefer@gmx.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 11:36:20 +0200
Message-ID: <451B9794.9090209@gmx.de>
References: <451B0E63.3010806@gmx.de>
	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig89467FFBC2A77BE69E7EF3C9"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig89467FFBC2A77BE69E7EF3C9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


>=20
> What marks, per-packet marks or per-connection marks?
>=20
I am not sure, how to distinguish, I just mark all pakets that pass
through a certain user defined chain. I guess this is a mark per packet.
The particular chain lookes like this:


Chain FWD_WWW-101 (2 references)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
100000000 bytes
MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
set 0x65
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
1000000 bytes
MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
set 0x1


The goal is to provide full network speed for all NATed computers
for a certain amount of bytes (first quota match), then mark their
packets individually (each computer has its own mangle chain
(FWD_WWW-$computernumber)) with its computernumber in hex, so tc can
slow down their connection to 56k and after the "slow quota" is used
up, the users packets get a different mark  (mark 1) and get a DNAT
to an Over Quota webpage, when the user tries to access an outside
webpage, other connectionattempts get droped.


The problem is now, that pakets get marked with the mark 0x1, but in
PREROUTING nat table, this mark never appears.

Thanks, Clemens


--------------enig89467FFBC2A77BE69E7EF3C9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFG5eXnDei4azjmoERAuQJAJ94RO5j29ucPEJ53+XLDfuUSKFhxACffHlD
93ulampfkMWmNdNSD+dLXsE=
=S5hn
-----END PGP SIGNATURE-----

--------------enig89467FFBC2A77BE69E7EF3C9--


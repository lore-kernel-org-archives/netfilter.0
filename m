From: Nuno Miguel Pais Fernandes <npf@eurotux.com>
Subject: Re: radius
Date: 18 Jun 2003 10:00:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055926820.28930.9.camel@xeon.office.eurotux.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122DD5@alderaan.smgtec.com>
	 <20030617185021.0bfdfa24.esteban@alstec.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5EpwIJjgrzRO+TNPG00C"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030617185021.0bfdfa24.esteban@alstec.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Esteban <esteban@alstec.fr>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org


--=-5EpwIJjgrzRO+TNPG00C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello...

Pix also does that type of authentication, but only for http and ftp
protocols. They implement it using kind a transparent proxy with
authentication.
If you want the same authentication use
iptables to redirect all http to squid (configured to act transparently)
squid with radius support to use auth.

Note that i've never tried this.

Nuno Fernandes


On Tue, 2003-06-17 at 17:50, Esteban wrote:
> On my LAN, I use an active switch which ask a login and password to the
> user and authenticate this user on a radius server in order to let him
> go througt the switch.
>=20
> I was wondering if it was possible to tell netfilter to authentificate
> user on a radius server before to accept the packets from this user.
>=20
> If I am not wrong, I think some firewalls like Netscreen or Checkpoint
> do such authentication
>=20
> Is that more explicit ?
>=20
> thank you very much.
--=20
Nuno Miguel Pais Fernandes <npf@eurotux.com>

--=-5EpwIJjgrzRO+TNPG00C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+8CokbJtoPy2XRQkRAhuTAJ9K/gqIfHE1+RDog4Kq3HiEjsSM6wCeP7lC
9+pq2K07TkAlrx3aZgHdZ7U=
=i60K
-----END PGP SIGNATURE-----

--=-5EpwIJjgrzRO+TNPG00C--



From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: accept local processes ...
Date: 27 May 2003 17:32:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054049523.13296.93.camel@raylinux.internal>
References: <FKEKLDLBAFLHIMEKAJJAIECJCAAA.jherschel@quarry.com>
	 <000501c32455$2eb79870$1405a8c0@ew2>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TrCWZNtZ1CZ9rMGRCFS6"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c32455$2eb79870$1405a8c0@ew2>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-TrCWZNtZ1CZ9rMGRCFS6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-26 at 23:33, Volker Augustin wrote:
> hello everybody, one question, why does
> a rule like:
>     iptables -A INPUT -s 127.0.0.1 -j ACCEPT
> give this result?
>     ACCEPT     all  --  anywhere             anywhere
>=20
What did you type to get this result?
iptables -nL INPUT

> im very confused....i want all local proccesses to have access to all
> services, this is ok i think and needed for database access to localhost =
etc
> and to all virtual network devices...(i think so)
> can anybody explain me this behaviour? i read a lot about iptables, try
> around for weeks, everything was fine but this.
>=20
> thanks in advance
> volker
>=20
>=20
>=20
>=20
>=20

--=-TrCWZNtZ1CZ9rMGRCFS6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+04Tzh1fuR/Bv+ygRAvekAJ48UgMIFVkN3m5UYaLzEmWRJ5dGJQCfcbm9
xtEOXj/ZGV88kn4EqzmFfrw=
=yxSJ
-----END PGP SIGNATURE-----

--=-TrCWZNtZ1CZ9rMGRCFS6--



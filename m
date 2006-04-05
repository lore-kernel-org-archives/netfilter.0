From: Eric Leblond <eric@inl.fr>
Subject: Re: [libnetfilter_queue]
Date: Wed, 05 Apr 2006 16:44:01 +0200
Message-ID: <1144248241.4406.11.camel@localhost.localdomain>
References: <859616420604050556t39a5e7eeled57a3e25ed5d10a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-qyZHKaBGqUQVDn9EgX3Q"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420604050556t39a5e7eeled57a3e25ed5d10a@mail.gmail.com>
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
To: David Vogt <beunlovable@gmail.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


--=-qyZHKaBGqUQVDn9EgX3Q
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le mercredi 05 avril 2006 =E0 14:56 +0200, David Vogt a =E9crit :
> Dear all,
>=20
> I would like to send different packets to different userland
> applications using libnetfilter_queue. As far as I understand,
> different queues can be distingusihed using some kind of queue number.
> How does the appropriate iptables command look like that sends packets
> to a specific queue?

This is :

iptables -A .... -j NFQUEUE --queue-num $ID

BR,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 39, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-qyZHKaBGqUQVDn9EgX3Q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBEM9ewnxA7CdMWjzIRAj4NAJ9HYlMMSzcGQL8x7GFyVi661HA28ACdGb2N
PKtpuvFNZcOJ0ks1RgXkN7U=
=NdLo
-----END PGP SIGNATURE-----

--=-qyZHKaBGqUQVDn9EgX3Q--



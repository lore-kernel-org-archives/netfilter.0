From: Eric Leblond <eric@inl.fr>
Subject: Re: [libnetfilter_queue] Load Balancing using multiple queues
Date: Fri, 6 Jun 2008 16:24:17 +0200
Message-ID: <20080606142417.GB14841@bayen.regit.org>
References: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <363599.48150.qm@web58313.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Vincent Arniego <vincent_arniego@yahoo.com>
Cc: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Friday, 2008 June  6 at  4:08:45 -0700, Vincent Arniego wrote:
> Hi Thomas,
>=20
> That's actually a good suggestion, Unfortunately we can't force teach our=
 subscribers to use a proxy in their setup. They use a certain equipment th=
at uses 3G and configuring it would be like rocket science to them.
>=20

Hmmm, most proxy can be configured to be used transparently.

> 11K packets per second, its ingress. We are  looking at around 114 Mbps t=
otal traffic at the worst case scenario. And yep, its doesn't look like muc=
h... yet.
>=20
> The application's made already, and it looks at patterns in the payload t=
o determine whether its a GET or http Response. Its working, but we would l=
ike to know if there's a way to spread the traffic out among multiple queue=
s automatically.
>=20
> I was thinking of something like
>=20
> iptables -A FORWARD -p tcp --dport 80 -j NFQUEUE --queue-num 0:5
>=20
> something like that. This doesn't work btw.

You can use statistic module to do so by using something like:
iptables -A FORWARD -p tcp --dport 80 -m statistic \
	--mode nth --every 6 --packet 0 -j NFQUEUE --queue-num 0
iptables -A FORWARD -p tcp --dport 80 -m statistic \
	--mode nth --every 6 --packet 1 -j NFQUEUE --queue-num 1
  ....
iptables -A FORWARD -p tcp --dport 80 -m statistic \
	--mode nth --every 6 --packet 5 -j NFQUEUE --queue-num 5

But, I don't think you will get much performance improvement by doing that.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFISUiRnxA7CdMWjzIRAjwdAJ0YUtuzqjwBBQB8T5Ej439gwJixtQCfYOIC
zLtOouWyyoONn16llYQZXbc=
=6gk/
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

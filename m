From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Time based rules ...
Date: 13 Nov 2002 19:53:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037209996.4557.41.camel@rayw.knowledgefactory.co.za>
References: <FD8F124A387AD6119F7900A0D218B321019992@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hoo7I8US0nply21isvrS"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019992@hslex01.hsl-brabantzuid.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>


--=-hoo7I8US0nply21isvrS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-13 at 17:50, Rob Sterenborg wrote:
> > Is there a way to put time restrictions on rules?
> > For eaxmple, something like:
> >
> > iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> > 0700:1700 -j DROP
>=20
> There is a time patch in pom (base).
>=20
OK. Thanks I'll check it out.

> >From the website :
> This option adds CONFIG_IP_NF_MATCH_TIME, which supplies a time match
> module.
> This match allows you to filter based on the packet arrival time
> (arrival time at the machine which the netfilter is running on) or
> departure time (for locally generated packets).
>=20
>=20
> Rob
--=20

--=-hoo7I8US0nply21isvrS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA90pGLh1fuR/Bv+ygRAj6YAJ9KLunUYY8U53d+c13i80FLbM8jAACghnLu
ReAi2Ax7vCgFNYxxeZQXaFY=
=LdF7
-----END PGP SIGNATURE-----

--=-hoo7I8US0nply21isvrS--



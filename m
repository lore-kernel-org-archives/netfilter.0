From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Time based rules ...
Date: 13 Nov 2002 18:00:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037203246.4557.39.camel@rayw.knowledgefactory.co.za>
References: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za>
	 <3DD27725.7030006@mcgill.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HCUrDpqjoceGUm/hOsj8"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DD27725.7030006@mcgill.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Poupart <chris.poupart@mcgill.ca>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-HCUrDpqjoceGUm/hOsj8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-13 at 18:00, Chris Poupart wrote:
> Couldn't you just use a CRON job to add and remove that rule at the=20
> required times?
>=20
Well that's what I'm doing, but it gets cumbersome when you have
multiple timeslots for different days, e.g. Weekends.

> -- Chris
>=20
> Raymond Leach wrote:
> > Hi
> >=20
> > Is there a way to put time restrictions on rules?
> > For eaxmple, something like:
> >=20
> > iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> > 0700:1700 -j DROP
> >=20
> > It would be nice ...
> >=20
> > Ray
> > --=20
--=20

--=-HCUrDpqjoceGUm/hOsj8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA90ncuh1fuR/Bv+ygRAmU8AJ4rUn2YS0yqrUaS8DxnjNDFE5rRMACfSe6Z
0kS5UAAiPcGjMbgdq3w/cp0=
=By6m
-----END PGP SIGNATURE-----

--=-HCUrDpqjoceGUm/hOsj8--



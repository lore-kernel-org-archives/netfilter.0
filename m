From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: (no subject)
Date: Tue, 29 Jun 2004 16:37:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040629143727.GA7330@zion.homelinux.com>
References: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net> <200406291508.45532.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406291508.45532.Antony@Soft-Solutions.co.uk>
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


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Antony, hi Richard,

On Tue, Jun 29, 2004 at 03:08:45PM +0100, Antony Stone told us:
> On Tuesday 29 June 2004 2:49 pm, Richard Gutery wrote:
>=20
> > Stop macro:
> > $IPT -N LD
> > $IPT -A LD -j LOG
> > $IPT -A LD -j DROP
>=20
> That has me really confused.   I was expecting you to say that $STOP expa=
nded=20
> to the word DROP, or some other valid target for the -j option on the=20
> netfilter command line.

I think you got a little bit confused by this, just like me. I think
the creation and filling of the custom chain is done at first and then
STOP is given the value LD so that in the later rules it expands to=20

iptables ..... -j LD


> Well, it certainly won't BLOCK (using your definition above) - it will ra=
te=20
> limit - which means that some packets will still come through.
>=20
> I suggest the following:
>=20
> iptables -I INPUT -s 64.246.26.185 -j DROP
> iptables -I OUTPUT -d 64.246.26.185 -j DROP
> iptables -I FORWARD -s 64.246.26.185 -j DROP
> iptables -I FORWARD -d 64.246.26.185 -j DROP

Yep, this would do a better job...

BTW, and, sorry, a little OT, but is there an award for the best
email sigs?? If there is, I think Antony would have good chances
to win it :-))


Sven

--=20
Linux zion 2.6.7 #1 Thu Jun 17 10:44:26 CEST 2004 i686 athlon i386 GNU/Linux
 16:29:04  up 3 days, 21:19,  4 users,  load average: 1.00, 1.00, 1.00

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA4X6no4FAdB2PneQRAknZAJ4o7GD/HRXWf6/CMxJvCObhmVedwQCfQKyZ
eHCBfQ4cd0QWmQfKf1dHQmA=
=MYDw
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--


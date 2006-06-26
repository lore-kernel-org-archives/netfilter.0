From: Nicolas Mailhot <nicolas.mailhot@laposte.net>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 22:12:46 +0200
Message-ID: <1151352766.2957.26.camel@rousalka.dyndns.org>
References: <200606260702.57739.tyche@ica.net>
	<56122.193.173.147.3.1151323907.squirrel@webmail.sterenborg.info>
	<200606261544.09465.tyche@ica.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-9exzzbs/TvRsq4b8t17g"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606261544.09465.tyche@ica.net>
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
To: tyche <tyche@ica.net>
Cc: netfilter@lists.netfilter.org


--=-9exzzbs/TvRsq4b8t17g
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le lundi 26 juin 2006 =C3=A0 15:44 -0400, tyche a =C3=A9crit :
> On Monday 26 June 2006 08:11, Rob Sterenborg wrote:
> > On Mon, June 26, 2006 13:02, tyche wrote:
> > > over the last few days, my server has been attacked. i
> > > would like to limit remote logon attempts by address so
> > > that if someone tries to logon from an ip address and
> > > fails 3 times, my computer will ignore repeated attempts
> > > from that ip address. any idea how to make a rule for
> > > this?
> >
> > What type of logon? SSH, telnet, ...?
>=20
> sorry, what comes from typing email when your still asleep.=20
> most seem to be hitting my sshd, tho the username/password=20
> combo leads me to believe that the person is using a database=20
> to try to overload the server.
>=20
> killed some pids that where owned by sshd and they kept=20
> cropping up faster than i could kill them.

Installing pam_abl can be an eye-opener

/usr/sbin/pam_abl
Failed users:
...
    aaliyah (1)
        Not blocking
    aaron (9)
        Not blocking
    aarti (1)
        Not blocking
    ab (1)
        Not blocking
    aba (1)
        Not blocking
    abarisic (2)
        Not blocking
    abarros (1)
        Not blocking
    abb (1)
        Not blocking
    abbey (1)
        Not blocking
    abbey1 (1)
        Not blocking
    abbey123 (1)
        Not blocking
...  =20
    rooot (1)
        Not blocking
    root (367)
        Blocking users [!root]
    root-admin (5)
        Not blocking
    root-oliver (3)
        Not blocking
    root1 (1)
        Not blocking
...
Failed hosts:
...
    wpc0963.amenworld.com (3379)
        Not blocking
    yer91-3-82-245-132-80.fbx.proxad.net (168)
        Blocking users [*]

Meaning sometimes in the last two month wpc0963.amenworld.com tried to
do a brute-force attack with 3379 loggons - but it's old so the host is
allowed to try again, while yer91-3-82-245-132-80.fbx.proxad.net has
already passed the threshold and this is recent, so it's still blocked

This also shows few accounts except root are hammered, most malware just
try every account they can think of once, so non-trivial passwords help
a lot more than unusual account names

Regards,

--=20
Nicolas Mailhot

--=-9exzzbs/TvRsq4b8t17g
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iEYEABECAAYFAkSgP74ACgkQI2bVKDsp8g2oOwCgljieoar+H/wGl5Z/oefIuC1b
/XgAoJ945IY9K7rDB7KU0OIW7SGfmu76
=t4UP
-----END PGP SIGNATURE-----

--=-9exzzbs/TvRsq4b8t17g--



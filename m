From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Allow only SMTP 'callback'
Date: Mon, 10 Jan 2005 12:18:44 +0100
Message-ID: <20050110111844.GA14390@zion.homelinux.com>
References: <200501101030.59086.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200501101030.59086.gdh@acentral.co.uk>
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
To: Gavin Hamill <gdh@acentral.co.uk>
Cc: netfilter@lists.netfilter.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Gavin,

On Mon, Jan 10, 2005 at 10:30:59AM +0000, Gavin Hamill told us:
> Hello :)
>=20
> Normally I permit only port 80 incoming to our webservers, but since each=
=20
> webserver also sends out booking-complete confirmation emails, I would li=
ke=20
> to also enable incoming port 25 for those remote mail servers who 'call b=
ack'=20
> to check that the envelope sender  / HELO address is truly a reachable ma=
il=20
> server.
>=20
> I don't particularly want to leave port 25 simply open, but only for thos=
e=20
> hosts with whom an outgoing port 25 connection is already established wit=
h.
>=20
> Is this possible?

Yes, should be doable by using the "recent" extension with something
like this:

iptables -I OUTPUT -p tcp --dport 25 -m recent --set --rdest -j ACCEPT
iptables -I INPUT  -p tcp --dport 25 -m recent --update --seconds 60 -j ACC=
EPT

The first rule will add the destination ip address of the outgoing SMTP
session to the recent list. The second rule will match (and allow)
incoming SMTP sessions from ips which are on the recent list and not
older than 60 seconds (and update the recent list with the source ip,
therefore extending the time frame for this ip for another 60 seconds).
(I must admit that I haven't made heavy use of the recent match myself,
so these two rules might not be 100% correct. Look at it as a starting
point :-) here is the ipt_recent documentation:
http://snowman.net/projects/ipt_recent/ )
I'm assuming a default policy of drop here, otherwise you might need an
explicit DROP rule for packets not matched by the ACCEPT rule.


HTH

Sven

>=20
> Cheers,
> Gavin.

--=20
Linux zion 2.6.10-bk7 #0 Fri Jan 7 19:08:39 CET 2005 i686 athlon i386 GNU/L=
inux
 12:08:18 up 2 days, 16:45,  1 user,  load average: 0.00, 0.04, 0.05

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFB4mSUo4FAdB2PneQRAqIZAJ91BLjkI11Kb4lQpK2PMc4Y5X7ntACfd6E8
kx+7go1wuC1LHCxJfdszuNw=
=51n8
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--


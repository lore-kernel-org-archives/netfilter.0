From: Alexander Samad <alex@samad.com.au>
Subject: Re: IPSec - IPTables issues
Date: Wed, 5 May 2004 20:48:26 +1000
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20040505104826.GQ13626@samad.com.au>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="magLDk5D4XGaUXcd"
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040504211557.GA236@schottelius.org>
List-Id: <netfilter.vger.kernel.org>
To: netfilter@lists.netfilter.org
Cc: Nico Schottelius <nico-linux-net@schottelius.org>, Pablo Neira <pablo@eurodev.net>, gregor-net@paasch.name, linux-net@vger.kernel.org


--magLDk5D4XGaUXcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2004 at 11:15:58PM +0200, Nico Schottelius wrote:
> Hello Pablo,
> (netfilter guys, please read=20
> http://www.uwsg.iu.edu/hypermail/linux/net/0405.0/0002.html before)
>=20
> Pablo Neira [Mon, May 03, 2004 at 01:48:15PM +0200]:
> > Hi Nico,
> >=20
> > since this stuff is netfilter-related and netfilter/iptables geeks are=
=20
> > mostly in netfilter's maillist, I think you could redirect this request=
=20
> > there, someone could help you out.
>=20
> Thank you for the hint. I first thought this is a netfilter problem, but
> currently I don't think so.
>=20
> The problem is IMHO the design of the Linux IPSec implementation.
>=20
> I'll compare what freeswan did with what Linux 2.6 does now:
>=20
> Freeswan has virtual devices (ipsec*), through which the unencrypted
> packets come into the system. So you can add these firewall lines:
>=20
> - allow AH, ESP, UDP/500, deny rest on eth0
> - allow IPs/networks, etc. on ipsec0
>=20
> With Linux 2.6 I don't have virtual devices. This means that my IPSec
> packets enter the physical device twice:
>=20
> 1. esp encrypted packet enters
> 2. Linux decrypts it
> 3. Linux sends the unencrypted packets through the same device again
>=20
> The problem with that is, that
>=20
> - allow AH, ESP, UDP/500, deny rest on eth0
>=20
> will deny the _content_ of my encrypted packages (step three is broken).
>=20
> Wouldn't this work fine, if we have the virtual device like freeswan had
> or is netfilter broken with this?
>=20
> I mean I cannot practicly setup an IPSec only access point with the curre=
nt
> netfilter and ipsec in Linux 2.6, or am I deadly wrong?

right and wrong, trying to do it the old say doesn't work, simple
solution, tack on your own updown script which updates iptables.

there are some other new patches for netfilter that lets you match
packets to policy's which means you would not need to do the above, but
I haven't looked at this so can't comment


>=20
> Greetings,
>=20
> Nico
>=20
>=20
> --=20
> Keep it simple & stupid, use what's available.
> pgp: 8D0E E27A          | Nico Schottelius
> http://nerd-hosting.net | http://linux.schottelius.org



--magLDk5D4XGaUXcd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAmMZ6kZz88chpJ2MRAkDPAJ0ZG5t0h+NyvgEF8DopIzmtceDr7wCdHrp7
4ZoHaZcOtrp6wYT4QRGdIiY=
=6NHc
-----END PGP SIGNATURE-----

--magLDk5D4XGaUXcd--

From: Nico Schottelius <nico-linux-net@schottelius.org>
Subject: Re: IPSec - IPTables issues
Date: Tue, 4 May 2004 23:15:58 +0200
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20040504211557.GA236@schottelius.org>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4096317F.8020609@eurodev.net>
List-Id: <netfilter.vger.kernel.org>
To: Pablo Neira <pablo@eurodev.net>, netfilter@lists.netfilter.org
Cc: gregor-net@paasch.name, linux-net@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Pablo,
(netfilter guys, please read=20
http://www.uwsg.iu.edu/hypermail/linux/net/0405.0/0002.html before)

Pablo Neira [Mon, May 03, 2004 at 01:48:15PM +0200]:
> Hi Nico,
>=20
> since this stuff is netfilter-related and netfilter/iptables geeks are=20
> mostly in netfilter's maillist, I think you could redirect this request=
=20
> there, someone could help you out.

Thank you for the hint. I first thought this is a netfilter problem, but
currently I don't think so.

The problem is IMHO the design of the Linux IPSec implementation.

I'll compare what freeswan did with what Linux 2.6 does now:

Freeswan has virtual devices (ipsec*), through which the unencrypted
packets come into the system. So you can add these firewall lines:

- allow AH, ESP, UDP/500, deny rest on eth0
- allow IPs/networks, etc. on ipsec0

With Linux 2.6 I don't have virtual devices. This means that my IPSec
packets enter the physical device twice:

1. esp encrypted packet enters
2. Linux decrypts it
3. Linux sends the unencrypted packets through the same device again

The problem with that is, that

- allow AH, ESP, UDP/500, deny rest on eth0

will deny the _content_ of my encrypted packages (step three is broken).

Wouldn't this work fine, if we have the virtual device like freeswan had
or is netfilter broken with this?

I mean I cannot practicly setup an IPSec only access point with the current
netfilter and ipsec in Linux 2.6, or am I deadly wrong?

Greetings,

Nico


--=20
Keep it simple & stupid, use what's available.
pgp: 8D0E E27A          | Nico Schottelius
http://nerd-hosting.net | http://linux.schottelius.org

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAmAgNzGnTqo0OJ6QRAv6bAJkBf41CF+BzyyMrrgjUgxXvziOMsACfZUJY
GUlb/eMwcYgxahI+Y8iAbu8=
=UE3t
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--

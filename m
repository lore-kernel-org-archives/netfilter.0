From: Stephen Frost <sfrost@snowman.net>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Mon, 27 Jun 2005 12:09:12 -0400
Message-ID: <20050627160909.GA24207@ns.snowman.net>
References: <5d2f379105062511588033857@mail.gmail.com>
	<002e01c579e1$4d326d00$4206a8c0@loki>
	<Pine.LNX.4.61.0506262243380.15156@yvahk01.tjqt.qr>
	<000c01c57af0$c58cb5c0$4206a8c0@loki>
	<5d2f379105062708534de71258@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zAZKrYjO7GRpkTOs"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5d2f379105062708534de71258@mail.gmail.com>
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
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org


--zAZKrYjO7GRpkTOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* curby . (curby.public@gmail.com) wrote:
> On 6/27/05, Marius Mertens <marius.mertens@gmx.de> wrote:
> > If you are afraid of somebody trying to DOS you, the recent match with =
the
> > added TTL check might be an even better choice.
>=20
> I've been wondering about recent's TTL check and its ability to
> prevent or even reduce DOSing.

recent's not going to prevent a DOS.  It tries to avoid becoming the
cause of a DOS but there's only so much it can do.

> To test if the TTL option is used, the attacker can send regular
> (nonspoofed) ssh requests until they start becoming unresponsive (call
> this number n), then try sending another request with a different TTL.
>  If that request returns, TTL match is being used so simply send n-1
> requests with different TTLs and the spoofed address.  Unless the
> route from the attacker to the sshd is longer than the route from the
> spoofed client IP to the sshd and the client uses a TTL of 255 (or
> something similarly high), the legitimate client will still be DOSed.=20

Sure, but at least it's a little harder than just having to know the
other client's IP address, that's kind of the point.  There's also an
opportunity here for someone to notice what's happening and take action
about it.  Alternatively, there could be additional checks to try and
thwart this (such as checking for multiple packets with different TTLs
=66rom the same source IP and raising a big stink about it, or flipping
the check around to require a specific TTL for a given IP, etc).

> Knowledge of the client system's OS or TCP stack is also reasonably
> easy to acquire, and can help narrow down the TTLs that need to be
> sent.  Or the attacker can be lazy and send 250 or so SYN packets with
> different TTLs and the spoofed IP.
>=20
> In short, if an attacker know's you're using recent to track ssh
> requests, and is not so clueless that he doesn't know about the TTL
> option to recent, you're dead whether or not you use the TTL option.

ipt_recent is far from fool-proof and you're describing a known
limitation of it, not anything new.  The TTL option is just there to
make it more difficult, it's by no means a solution to the potential
problem.  Generally I'd think finding the client IP is expected to be=20
somewhat difficult by itself.  There's also escape-routes to some
extent, you can have a special rule which watches for packets matching
something and removes blocks on that source address, perhaps
indefinitely or for some specified time, or only when matching the same
TTL as the key packet, etc.

> On a related note, I really hope ISPs are doing some egress filtering
> to prevent these packets with source IPs not on the expected subnet
> from getting out.  I wonder how many do...

Not nearly enough, unfortunately.

	Stephen

--zAZKrYjO7GRpkTOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCwCSlrzgMPqB3kigRAv2WAJ0SszGT+KwFUaYhhlaD9N9Cf2NKtQCghQos
/bnMZXT0ZXkifhEdFn1jie0=
=Uh2t
-----END PGP SIGNATURE-----

--zAZKrYjO7GRpkTOs--


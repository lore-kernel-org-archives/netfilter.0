From: Paul Miller <iptabler@voltar-confed.org>
Subject: eth0, ppp0 & ppp1
Date: Fri, 6 Jun 2003 10:12:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030606141249.GA4652@corky.voltar-confed.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry this is so long, I wanna be specific.

I've got a routing issue that I think should be really easy
to solve.  It's baffled me for over 4 hours now, so I'm
going to ask.

eth0 - my cable internet 24.247.240.235
ppp0 - 208.31.142.43
ppp1 - 208.31.142.23

My employer makes money for having my modems connected.
That's a long story, and hard to explain.  Anyway, ppp0 and
ppp1 are just sitting there doing nothing.

The other day my cable went out, and with it, my default
route.  I tried to telnet into my ppp devices, but they
didn't work because the return path was trying to go through
the cable.

Even when the cable is working, I can't telnet into the ppp
devs unless I make a specific route. =20

route add 208.31.142.2 gw 208.31.142.43 dev ppp0

That may look odd, trust me, my ip is my gateway.  Anyhoo,
after that it works great.  That's less than desireable
though -- then all traffic to my webserver goes through
ppp0.  What I really want, is any traffic that SYNs to
208.31.142.43 from the outside, should automagically route
back out that device.  I hope that made sense.

So, I tried to mark the packets with 0x04 then route them
based on that...

iptables -t mangle -A PREROUTING -p tcp -d 208.31.142.43 -j TOS --set-tos 0=
x04
ip route add default via 208.31.142.43 dev ppp0 tos 0x04

I've had success routing on those tos values before.  But
this solution didn't work for obvious reasons.  I need to
mark the whole session, not just packets that are destined
to 208.31.142.43.

Questions:

Is there a way to mark the entire session in such a way that
I can do sorta this type of routing?

Is there a cleaner way to make sure that:

a) my default route for anything starting from my box goes
    out the cable modem...

b) any traffic initiated to one of the ppp devs
    automagically routes back out the same ppp dev?


--=20
If riding in an airplane is flying, then riding in a boat
is swimming.  33 jumps, 6.7 minutes of freefall, 14.4 ff vertical miles.
Key fingerprint =3D CEAC EBBE C541 B1E0 3174  81E0 E4E5 4D11 9A0C DA99

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+4KFh5OVNEZoM2pkRAqsJAJ94A79WQ7ZifkEyGaUVY6PRtdbR3gCbBwX1
xgJnoHf+jUX8uqS/wriQJls=
=EiA4
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--


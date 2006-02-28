From: Alpt <alpt-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Subject: Multiple inet gw and multipath
Date: Tue, 28 Feb 2006 22:44:37 +0100
Message-ID: <20060228214437.GA5695@nihil>
Reply-To: netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <netsukuku-return-479-gnpn-netsukuku=m.gmane.org-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Post: <mailto:netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:netsukuku-help-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <mailto:netsukuku-unsubscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
List-Subscribe: <mailto:netsukuku-subscribe-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Cc: netsukuku-6BmP915+9Ldg9hUCZPvPmw@public.gmane.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi there,
this is the situation:

We have a multipath default route. Each nexthop is an ipip tunnel to differ=
ent
inet gateways.

	default equalize=20
        	nexthop via 10.10.1.1  dev tunl0 weight 1
	        nexthop via 10.10.1.2  dev tunl1 weight 1
	        nexthop via 10.10.1.3  dev tunl2 weight 1

Each inet gw has a different IP on the Internet, therefore the tcp connecti=
on
breaks if the packets go first from one gw and then after another one.
What we need is to use the same gw for all the packets of a connection.

We can use "-o, --out-interface [!] name" to mark the outgoing packets,
especially the packets which initialize a new connection, and associate each
tunX interface to a routing rule.

What's your advises?

You can understand better the the whole situation here:                    =
                                                   =20
http://archives.free.net.ph/message/20060207.030317.37885ea1.en.html
http://marc.theaimsgroup.com/?l=3Dlinux-net&m=3D113550638110682&w=3D2      =
                                                         =20
and here:                                                                  =
                                                   =20
http://marc.theaimsgroup.com/?l=3Dlinux-net&m=3D113636640615375&w=3D2    =
=20

If we can resolve this problem, then it we'll be possible to use at the same
time multiple inet gw in Netsukuku:

http://lab.dyne.org/Ntk_IGS

Thanks ^_^
--=20
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint =3D 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFEBMRFv/gDfkQc8O4RAkxWAJsEJR5w08+DO5DwGdgG/QvVuUES6gCgs7Ac
rRBP82akBlY3rfqYSG14XVE=
=mSWC
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--

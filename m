From: Alpt <alpt@freaknet.org>
Subject: Different routes for different src addresses
Date: Wed, 7 Jul 2004 14:05:02 +0200
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20040707120502.GA23120@nihil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
To: netfilter@lists.netfilter.org
Cc: linux-net@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,
is it possible to create a route for a single src address?
For example these are some routes I'd like to use:=20

1) "All the pkts coming from hostA with dst=3DhostX are routed to eth1".
2) "All the pkts coming from hostB with dst=3DhostT are routed to eth0"
/*Normal routes start here*/
3) "All the pkts (that are not pkts of type 1) and 2)) with dst=3DhostX
are routed to eth3"
4) "All the pkts (that are not pkts of type 1) and 2)) with dst=3DhostU
are routed to eth2"
5) And so on...


I mean _routing_, not natting. If I nat the pkts their destination will
change and I need to keep it intact.

In the FIB routing table I can only specify the target address, but I've=20
noticed that the kernel's cache matches the source field. But when I try
to modify it I get: "Modifying `inet' routing cache not supported".
So, Is it possible to modify the krnl's cache from the user space with
some magic ioctl?

Is there a solution for this problem? Can netfilter do something for
this?

And, what's the best method to modify the FIB from user space? The ioctl
or the rtnetlink?

Thank you (^_^)
I live waiting your wise reply
--=20
:wq!
"I don't know nothing" The One Who reached the Thinking Matter   '.'

[ Alpt --- Freaknet Medialab ]
[ GPG Key ID 441CF0EE ]
[ Key fingerprint =3D 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C F0EE ]

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA6+buv/gDfkQc8O4RAvP/AJ4uWLEou0Ii/JBgrqtKBfmGh4TwZQCgl5cE
gKHh3aVmHTxVDwCSaAzNpD4=
=N2zA
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

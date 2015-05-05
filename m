From: Petr Pisar <petr.pisar@atlas.cz>
Subject: conntrack -L fails with Linux 4.0: Operation not supported
Date: Tue, 5 May 2015 22:48:00 +0200
Message-ID: <20150505204800.GA2660@album.bayer.uni.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

after upgrading Linux to 4.0.0, listing conntrack table with conntrack tool
does not work fork me:

# conntrack -L
conntrack v1.4.2 (conntrack-tools): Operation failed: Operation not supported

This happens with Linux 4.0.0 as well as 4.0.1. If I reboot back to 3.19.3, it
will work again. I have no changes in my Linux configuration regarding netfilter,
conntracking or netlink.

Otherwise kernel tracks connections properly and /proc/net/nf_conntrack lists
them.

Have anybody already seen this failure?

I have this user space:

conntrack-tools-1.4.2
libnetfilter_conntrack-1.0.4
libnetfilter_cthelper-1.0.0
libnetfilter_cttimeout-1.0.0
libnetfilter_queue-1.0.2

-- Petr

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlVJLIAACgkQEsnFx2fG+qJVnQEAoJPqqtqo4bwvOyZ+FG6AZ7Q8
vxP1VZNGen4lWRRpOMgBAIXh+U6UuZX+eQYwJaM7mDHZzaSjESKvobVEoRNVfJj5
=FOZ7
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

From: =?UTF-8?Q?Pawe=c5=82_Krawczyk?= <pawel.krawczyk@hush.com>
Subject: Snapped nftables
Date: Mon, 21 Oct 2019 21:17:48 +0100
Message-ID: <50cf435a7618252879079fbc9997e9c2@smtp.hushmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="BPekQ6cX4bjl0Ypa2lr4oEQGuwqKI6uWs"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=hush.com; h=to:from:subject:date; s=hush; bh=zWCGHNlqYhist/h/BzOBbfWTNgBcgy6DODl1VK7vGbg=; b=lgARmXiaZgbaynye1avae43L0/PxrdbunRS8QaSPQelDbbkDcWZfro+eDg0QAF00tY6TfqKF9hFGl74znRTm1YcUFwPY8P5Y+vyE4QQ9BEy8zVR+wViHD+ztP5Mb8ZuUtyvKn0by8YhDanTAilWS9VCMKl0nxxzit6q3XLSv4K1GV9cU22VfqCFsih8+slbxjW9r9osx/jn7AEMcuSaeG+BTA8C92DiPLQ3jp+iwQSRwUyUS8X1RMzBieXNNK7T2l0ZgDXYC9WaD2vmSVBaN5sz3f5lJRH77ngKHqUbGTKaGHG5NLvVLDxRXoFuWrGWpTaR1b+O5n3X/w6DtZs4OMg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BPekQ6cX4bjl0Ypa2lr4oEQGuwqKI6uWs
Content-Type: multipart/mixed; boundary="vV5buatpJbr2z0N9G0zgNwEc3nDX1PbBe";
 protected-headers="v1"
From: =?UTF-8?Q?Pawe=c5=82_Krawczyk?= <pawel.krawczyk@hush.com>
To: netfilter@vger.kernel.org
Message-ID: <d3e53513-e2ae-0eb4-7852-c242b4a60a9e@hush.com>
Subject: Snapped nftables

--vV5buatpJbr2z0N9G0zgNwEc3nDX1PbBe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi all,

I've been using nftables for a few years now and i suppose I'm not the
only person where who was ran into various bugs due to rather old
versions of the nftables CLI distributed with Linux distros.

Rather than compiling it from a binary, I've created a Snap package*
with the latest version of nftables that should work on any Linux
distribution. You can find the nftables-pk** package on Snap store
https://snapcraft.io/nftables-pk and install it using "snap install
nftables-pk". Note that it's not a drop-in replacement for a .deb or
=2Erpm - for examples config files need to be placed in a special jail
directory. Other than that I've been using it in prod environments for
the last few months and it works like a charm.

* for those who haven't seen Snaps yet, it's a self-contained binary
distribution format that comes with all dependencies (.so libraries etc)
bundled. It also comes with very strict binary confinement (using
seccomp and AppArmor), which is the reason for changed config location.

--=20
Pawe=C5=82 Krawczyk
+44 7879 180015



--vV5buatpJbr2z0N9G0zgNwEc3nDX1PbBe--

--BPekQ6cX4bjl0Ypa2lr4oEQGuwqKI6uWs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEL2n/LhkSGC2mB34xT/iLCcHmSxAFAl2uEm0ACgkQT/iLCcHm
SxCdww//Zs5XXPwJuHmO6L2HcIG0mxkXHazP7oM8XD5vdlukV4fHBdOLwM7JI1bT
+dEirFVWU2EC0qS5ozKxYCL6EN9sxoWT3wCxGtjDO/zgXBDvv9+P6T4+fPohq2Gj
kJzPwjNYO+oPnmcUCkk/uRe+u+WDywAk1bfPYios9T6rRfeAK5OttBDBNC2DUeAf
m0aW3vF+VDqMTRpcgq2fqCtjzKkYR1yAQdZ7om/xNotB2c+y9O4ahtAfhFqXCvSV
EnvqPWRbhG4jx/wHOQ9roybhJIBASnMlMd7qRzi43r6d1FeK7GF+4Dbf1GMc46kx
MMtFZx6lMrVReUabyj9G7M/HDd7/bog/XaZyA8Kkr0l66ZCYlIhc8Xh/+sRiQwv8
prBqJtmBwXCIkZc5nJvz+tDxqtdjJ/4MkvYdT80vE6uCPsUXB2ZdlEhhJC0hqQOc
x7YaHKl8ELcnlXdGRUvmEYZG9X73azzadkb/sPvI3dIHl/DpfAM77r4qdLH+hH8W
rBYFNtji1r0fTCPxEZrNsgCtab/dVph5a/8jMW7n4gfRU9MiA81jcVKnO9N6kD0m
SjGvwS/GhphDunUHnjaWbihFL3OjrJu5gUzRmtDib/msr3wzNCxRKNVWISQRkWW1
VPnL5DC3NzP5hXcovH00s2g7Mvq9mUdoc4mhAg/lgr3CkIHVI4Y=
=C6Le
-----END PGP SIGNATURE-----

--BPekQ6cX4bjl0Ypa2lr4oEQGuwqKI6uWs--


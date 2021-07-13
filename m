From: Eugene Crosser <crosser@average.org>
Subject: Handle a packet by netfilter after traversing a veth pair
Date: Tue, 13 Jul 2021 21:14:11 +0200
Message-ID: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ojelZnwm6riM0axIF2vHyA4YkrLEmWG2L"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1626203664; bh=bLIOTJR3Oya5zPS4T38ncv+PqaWIUnAcGJnDHzCW04Q=;
        h=To:From:Subject:Date:From;
        b=HIgsNIUUwgcXrWJcCwuZZNKPKJrTWQ8Zba/81Flf5FD2DUEX5irdocIpI7EWi5B77
         UCVBP+4ci3UxcJz7fOG3v2Js1q4qf8u8uiHJy+yKgA2r+7NKt2wross8u0cSAqgbyk
         Rj8BE65JxE0VPI8zCirnlvSS1o4Xwlql3hsSrpBY=
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ojelZnwm6riM0axIF2vHyA4YkrLEmWG2L
Content-Type: multipart/mixed; boundary="SyDGp8HTfOwfC4S9FiAW9rcU4htlHS1cN";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: netfilter@vger.kernel.org
Message-ID: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>
Subject: Handle a packet by netfilter after traversing a veth pair

--SyDGp8HTfOwfC4S9FiAW9rcU4htlHS1cN
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

I have a use case when I may want to DNAT different addresses to a potent=
ially
_same_ destination address that belongs to _different_ (virtual) hosts th=
at are
connected to different VRFs. To achieve that, I plan to route the origina=
l
packet to a veth interface leading to the "right" VRF based on the packet=
's
original destination address. As the packet exists the peer of the veth p=
air,
(that is enslaved in the VRF), I want to apply DNAT rule in the preroutin=
g hook.
"Dnated" destination address may be anything, and may happen to be the sa=
me in
different VRFs. This is how it looks:


+-------------+        +-------------+
|   GuestA    |        |   GuestB    |
| 192.168.1.2 |        | 192.168.1.2 |
+------|------+        +------|------+
       | tapA                 | tapB
+------|------+        +------|------+
| 192.168.1.1 |        | 192.168.1.1 |
|    VRF-A    |        |    VRF-B    |
| 100.64.10.2 |        | 100.64.20.2 |
+------|------+        +------|------+
       |                      |
     vethA                  vethB

    route:                 route:
100.64.10.2/32         100.64.20.2/32
  dev vethA              dev vethB
            \           /
             \         /

        default routing space


The problem that I see is that after the packet has traversed the veth, i=
t
apparently is not handled by any netfilter hooks at all! I am assuming th=
at a
veth pair ought to behave like two physical NICs connected by a crossover=

Ethernet cable. That is, as the packet sent to one NIC enters from the ot=
her,
the system has no knowledge that the packet has visited before, treat it =
as a
fresh new packet of unknown origin, and let it pass through the whole sta=
ck of
routing and filtering. But I observe different behaviour.

I cannot apply DNAT to the packet _before_ it enters the VRF, because the=
n
information needed to chose the right VRF will be lost.

My question is - how can I overcome this problem? Is there a way to ensur=
e that
after traversing the veth the packet is treated as a new packet? Are ther=
e other
tricks, maybe, that would allow configuration as described?

Thank you,

Eugene


--SyDGp8HTfOwfC4S9FiAW9rcU4htlHS1cN--

--ojelZnwm6riM0axIF2vHyA4YkrLEmWG2L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmDt5gMACgkQfKQHw5Gd
RYzNaQf9FFolrwUsHGHPtT3D48YJGZeZQ3FPGyjbgR4w86fXXh4UNRA2sXsxmfha
DU5obfQLvlOMDNREaP4Ye2xO+UQrBbhznjwXYdaZjbb4/6WehpRKJscAsQ93Wj73
9rTfz681Ik68po9Mp1c8Wu+oLzN7wVPYLW4iOEgoKYiknpzQrdZenCWLfDXkzcVP
F6q1D02o9wP3jrOxqTYT2hVa6RKm/fdAF0iFUh0VRaBAp54YmxR5eIHunUhuKqKs
qAKQSjSFCjbcDIC1sGHfIorVzxqdvAwzZX5gvLCUTeW2MppVIHFBDmjHt8AoKyRI
4CxydVOOoWwwAlavjVx/FRN83QRnUg==
=wRR0
-----END PGP SIGNATURE-----

--ojelZnwm6riM0axIF2vHyA4YkrLEmWG2L--

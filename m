From: Eugene Crosser <crosser@average.org>
Subject: conntrack: confirm existing but do not create new entries
Date: Wed, 18 Aug 2021 17:53:45 +0200
Message-ID: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eH6pMp1yOjG9BWAMknwMKWPw4Xvp4xuaG"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1629302041; bh=Kp8DGL1D0vJS2aeQf3DGDCDYDFr5SWcl8LmBDCQmPjY=;
        h=To:From:Subject:Date:From;
        b=i9Syu5997LBMjNFihN+8+josgcWGcgb9EiGEJUvrIXktQh3ZxojUrmXzWB66nmYEw
         WqJXl8/7AbLz+3EmQxt5cMc/f4hre1vJmFWB8U574YSyAPHP00fVGbmLoY8DrIxop5
         j0U+4iQnMX9MX9K89KYmhpweZnyi2BLfIOgimdeg=
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eH6pMp1yOjG9BWAMknwMKWPw4Xvp4xuaG
Content-Type: multipart/mixed; boundary="Jl2foxG4q3Xyp6AagGM7ZuXjnyJLYkx3W";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: netfilter@vger.kernel.org
Message-ID: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
Subject: conntrack: confirm existing but do not create new entries

--Jl2foxG4q3Xyp6AagGM7ZuXjnyJLYkx3W
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

My use case is to set up a stateful firewall allowing any outgoing connec=
tion
from a host, and restricting incoming, which obviously requires conntrack=
ing.
The twist is that there exists a rather high probability of DoS-like inco=
ming
traffic, that easily overflows conntrack table with unconfirmed entries, =
even
though their lifetime is very short.

I was hoping to keep conntracking enabled in the outgoing/raw hook, but i=
n the
prerouting/raw hook disable conntracking _unless_ an entry (previously cr=
eated
by an outgoing packet) already exists. In other words, *make incoming pac=
kets
update existing entries but never create new entries*.

Looking at the code in resolve_normal_ct(), apparently there is no any sp=
ecial
flag or anything for that. But maybe it is possible to have a rule in the=

prerouting/raw chain that would conditionally set `notrack` flag dependin=
g on a
lookup in the conntrack table?

Or maybe there are other suggestions how to achieve the goal (of not lett=
ing
"unexpected" incoming packets fill conntrack table)?

Thank you,

Eugene


--Jl2foxG4q3Xyp6AagGM7ZuXjnyJLYkx3W--

--eH6pMp1yOjG9BWAMknwMKWPw4Xvp4xuaG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmEdLQkACgkQfKQHw5Gd
RYxVcAf+OthfDWAae+uc1PCBl6QYwMj0cQHds6ARCy/gZm8iEW6lPF/LfkZ/EUDO
cXJoHeGo08eaGOrKsYnjqJzZg0fE2B+9GS0eC3/SFmEqrtKMJ37R6sc4lcHbVnKw
4NbiE8NH6JukkRKRcmy0ff0kgDDFs8uS9tvxZPFNz8OL/40SSz6lNoXdR+HLWO5M
rucVW442JvhYTIdiEikbVoaVbM0lWY3tXVnoWxE1L1/u5GO+tfv6e7idgh4xSNR8
BoA5j5R5D8ydm7/qbfhEDs7unwB7HNlxxnK9sf1aKk1QxVS1VxYkCO4F122EVnSq
CuPdTk6YHHw17GjEDZB1BMxKhy1Akw==
=P2qt
-----END PGP SIGNATURE-----

--eH6pMp1yOjG9BWAMknwMKWPw4Xvp4xuaG--

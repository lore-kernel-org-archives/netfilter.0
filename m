From: Eugene Crosser <crosser@average.org>
Subject: Re: Handle a packet by netfilter after traversing a veth pair
Date: Wed, 21 Jul 2021 10:32:03 +0200
Message-ID: <4575ffdd-50af-ef49-ce0c-98d9949dd571@average.org>
References: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UjBZKx1Ms1HgBR9W8BLXQLCGhvz4bgk14"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1626856339; bh=H32yAZ3YzNYUJ1O3+IHrnrmHsp4edxSg/j1hR02xglA=;
        h=From:To:References:Subject:Date:In-Reply-To:From;
        b=CSO9oR8re3rCYtn89b59oiADkY09VnEMpX6UUMHx04aV1+2Jng0Qp1OXJcHP8bPPv
         tPlRlAFqaKK1bKVri2eiqSldW8BGjuLHwXW1qkmoTQI+Osre9N5DmW522yycFRUvIs
         BtNgJgVGdYXpY/lRzbM795lc90A30GmZvJcTa7LM=
In-Reply-To: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UjBZKx1Ms1HgBR9W8BLXQLCGhvz4bgk14
Content-Type: multipart/mixed; boundary="IBOZBrVhP9T348vAvqB6eQio5zfT7YhWq";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: netfilter@vger.kernel.org
Message-ID: <4575ffdd-50af-ef49-ce0c-98d9949dd571@average.org>
Subject: Re: Handle a packet by netfilter after traversing a veth pair
References: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>
In-Reply-To: <42f01b6d-e2ae-deb6-f4ea-7c755fdd0210@average.org>

--IBOZBrVhP9T348vAvqB6eQio5zfT7YhWq
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Answering my own question.

This is not a peculiarity of the veth; physical "loop" presumably would b=
ehave
the same way. The problem that I faced was caused by the fact that some(?=
) of
the hooks are apparently not executed when conntrack match was found. In =
my
scenario, the packet has created a conntrack entry on its first pass thro=
ugh the
system, and matched it (presumably) after its reentry via the veth pair.
Requesting `notrack` early in the first path solved the problem, `dnat` r=
ule
started to work.

I only wish it were documented in some discoverable place...

On 13/07/2021 21:14, Eugene Crosser wrote:
> Hello,
>=20
> I have a use case when I may want to DNAT different addresses to a pote=
ntially
> _same_ destination address that belongs to _different_ (virtual) hosts =
that are
> connected to different VRFs. To achieve that, I plan to route the origi=
nal
> packet to a veth interface leading to the "right" VRF based on the pack=
et's
> original destination address. As the packet exists the peer of the veth=
 pair,
> (that is enslaved in the VRF), I want to apply DNAT rule in the prerout=
ing hook.
> "Dnated" destination address may be anything, and may happen to be the =
same in
> different VRFs. This is how it looks:
>=20
>=20
> +-------------+        +-------------+
> |   GuestA    |        |   GuestB    |
> | 192.168.1.2 |        | 192.168.1.2 |
> +------|------+        +------|------+
>        | tapA                 | tapB
> +------|------+        +------|------+
> | 192.168.1.1 |        | 192.168.1.1 |
> |    VRF-A    |        |    VRF-B    |
> | 100.64.10.2 |        | 100.64.20.2 |
> +------|------+        +------|------+
>        |                      |
>      vethA                  vethB
>=20
>     route:                 route:
> 100.64.10.2/32         100.64.20.2/32
>   dev vethA              dev vethB
>             \           /
>              \         /
>=20
>         default routing space
>=20
>=20
> The problem that I see is that after the packet has traversed the veth,=
 it
> apparently is not handled by any netfilter hooks at all! I am assuming =
that a
> veth pair ought to behave like two physical NICs connected by a crossov=
er
> Ethernet cable. That is, as the packet sent to one NIC enters from the =
other,
> the system has no knowledge that the packet has visited before, treat i=
t as a
> fresh new packet of unknown origin, and let it pass through the whole s=
tack of
> routing and filtering. But I observe different behaviour.
>=20
> I cannot apply DNAT to the packet _before_ it enters the VRF, because t=
hen
> information needed to chose the right VRF will be lost.
>=20
> My question is - how can I overcome this problem? Is there a way to ens=
ure that
> after traversing the veth the packet is treated as a new packet? Are th=
ere other
> tricks, maybe, that would allow configuration as described?
>=20
> Thank you,
>=20
> Eugene
>=20



--IBOZBrVhP9T348vAvqB6eQio5zfT7YhWq--

--UjBZKx1Ms1HgBR9W8BLXQLCGhvz4bgk14
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmD324MACgkQfKQHw5Gd
RYwAAwf/Y22+KPoVcmsu5Mw4XxPZ4Vr+96FqA/yYwHgI9uC1z2xkGAeCNJ47OOAt
Ff5AmjhcFIGikKv3V++oRNu4NjGeruoUI7JY19X50WPdH0aVQT/yngQX0GBhI13U
mvKr+8xU156MbdHT91loQXZXZ8LDC6NIZMHMApnB2O4qM+u8jUV3+eeoFF1+tmcq
i1hQkWLCHYsMeK4FUpH/WtLZVo1ajDkrXVLATq2Wwfl1QabxLIifEoDwsqm1jYcQ
5+LMNxwNBQD8Ray0GnW7ZwTWUauzdW2BlwoiYUl8OEwd3lCBRFqZClqRD4Ff/4Mo
KdmyIQpQc2Uz9FER9ITQu2MLzbvLXQ==
=kvy0
-----END PGP SIGNATURE-----

--UjBZKx1Ms1HgBR9W8BLXQLCGhvz4bgk14--

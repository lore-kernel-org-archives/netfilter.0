From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] cross compiling for arm-linux-gnueabihf?
Date: Sun, 15 Nov 2020 15:21:00 +0000
Message-ID: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wh1Hc9lMOwGNhDhc3M9BIPknFUNqI91R3"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605453689;
        bh=HSnljI13eIm7zFr2KEutZ16yLygo4/3rtgM4AJoQwDc=;
        h=X-UI-Sender-Class:To:Reply-To:From:Subject:Date;
        b=Fxznn5k3u2XfzDsCxxWSc1TyHWrxHuHWRKi19nsiHTetdu0GTCJ2/OualEJIKM2gT
         ZaRkOWzsM487bLlylZtFWYQL63T+onRk5Lq/TEi7V+AKBS9BMVh4r+2BTBbduuZjX2
         L96p4de00/5xnCiI9XNAJTi8UcnPsh0CmdU7PT1o=
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wh1Hc9lMOwGNhDhc3M9BIPknFUNqI91R3
Content-Type: multipart/mixed; boundary="ib0O4M5xCljFsFihRtDERdDpDmM3Szkvs";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>
Subject: [nftables] cross compiling for arm-linux-gnueabihf?

--ib0O4M5xCljFsFihRtDERdDpDmM3Szkvs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

build node: x86_64-pc-linux-gnu
gcc: 10.2.0 (Debian 10.2.0-16)
toolchains installed: binutils-arm-linux-gnueabihf /=20
gcc-arm-linux-gnueabihf / g++-arm-linux-gnueabihf
_____

Trying to cross-compile for arm-linux-gnueabihf - which commonly works,=20
e.g. kernel and others sources but with nftables:

sh configure --host=3Darm-linux-gnueabihf-

throwing:

host system type... Invalid configuration `arm-linux-gnueabihf-':=20
machine `arm-linux-gnueabihf' not recognized

I am at a loss; what would be correct/expected syntax then?

Unfortunately there is nothing pertinent in the wiki article=20
https://wiki.nftables.org/wiki-nftables/index.php/Building_and_installing=
_nftables_from_sources


--ib0O4M5xCljFsFihRtDERdDpDmM3Szkvs--

--wh1Hc9lMOwGNhDhc3M9BIPknFUNqI91R3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl+xR3gFAwAAAAAACgkQ9Pc1kx8Fxc4Q
QxAAjD5p/4KJ5wZZtxL6hWPg7vuuBtCPI/2CRZFn5BfXDo8bfFv41oKynF8cEyIVNh3tvTFH8hOM
YOpvCyO1kSBgqT0popZDWHg1Fa00Z1aGAWxtF362qmlRu/1wuqSyHENGDZfb7+VVfhujRQuBrd8R
THGWQLtD7tMRFx8pSrsvczw2Hpcrow503Fk6mZ4F6WRNTDfCJD2x9p86CRnquuceloLshWGmiTJA
Cqg3Qpz6zq8yHkWcVlHMmpE0qPwrdlESjd3TQWahV+IRiXFpOd5M/UnEHp+/O69PEXQ6TWEoPvB/
w3J75yG8AcZM9wmzQ/aOZ0fSXBcIYHsfnmJvgJXkYPn9zQAovooepr3uBPntolFpwi5RNkD4OnkT
Ma80uWgsYuZ1AOo0mRiNekgMq4lW09Ac7HZBQCEAR6QAhUi187E8Cdm9ptlner7R85PJK1AZurV4
FfjpG1Goudik0RPJOv4QZlLKZ2iDAdOHobu809r7yqdeUxO256VAzCs4bBlSyGqX1ZbJnb0niOxs
OgvYvpJS3AcgMFk5KY4cCV2IRGrAbjFzFHreeoLH/u3TSqcKCy6feyfXRCrVpVHvEhG/dn12SnSA
G7b+JGPSomb5QgHFNxuO1b9kIL2sRSEodjoNmCGMEWNNUTj7rcCcrN49cqXMLV+5OZZSZH1m67yG
X9U=
=I/kX
-----END PGP SIGNATURE-----

--wh1Hc9lMOwGNhDhc3M9BIPknFUNqI91R3--

From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: IPSET persistence on Ubuntu 16.04
Date: Mon, 15 Jan 2018 17:59:03 +0100
Message-ID: <20180115165901.m3m75awu5vomirh7@Redstar.dorchain.net>
References: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
 <d9567a92-e4ee-0b38-f7a7-5447b9cb5b25@pkfnet.co.za>
 <CAMOPTEzkV5v1DJEqqT-ohMTs8UAkWgphEEzdH5+T22b2YSap-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oncij6wul66bxvjy"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 Redstar.dorchain.net w0FGx4wp026880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1516035544;
        bh=e3b1jrCnv+Q9/s+LMlEmaX/c8n03eiyllx/fkEAKi/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ou6UohiNBjtyTMOcSgykOuD4qKQ1wA5apJxPdIDxtayCUxdH7JkgVyK6neLtsTv8T
         RLvWgTZ61rRpuwueT6QG7qmq0UsPIEUzwCGA5zvTF+Zc6p81KsQAFgDcI66EGbVPre
         4f59/R/NqmQouGyc9Iqengymd18qQTQ+qxMJGUW8=
Content-Disposition: inline
In-Reply-To: <CAMOPTEzkV5v1DJEqqT-ohMTs8UAkWgphEEzdH5+T22b2YSap-g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Oliver O'Boyle <oliver.oboyle@gmail.com>
Cc: Mark Coetser <mark@pkfnet.co.za>, netfilter@vger.kernel.org


--oncij6wul66bxvjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 11:13:47AM -0500, Oliver O'Boyle wrote:
>=20
> Someone needs to write an ipset-persistent package or integrate ipset
> into iptables-persistent :)

I'd appreciate that, too.

With "ipset save" output as preferred storage format.

Bye,

Joerg

--oncij6wul66bxvjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJkBAEBCgBOFiEEi1H+OmIH+hWvEDR8cSN/dDZuHKgFAlpc3dUwFIAAAAAAFQAS
cGthLWFkZHJlc3NAZ251cGcub3Jnam9lcmdAZG9yY2hhaW4ubmV0AAoJEHEjf3Q2
bhyoy7YQAIVFyze4SxSk1IgAQsd7EnGrSOqeTJnHDiYpYkw9/iLX0Sup7vO7Jncs
q63gEyP1PZDFP1MK0OGGyZ/cQSyDY9vrwnlD3iwEMoykVEZsdf51FE7tBTmgW4fO
Wxrbj8lFipwIfzUw1RZ7qJOmXGabHta5dguCyTMQsze8FYlzH7er93Td0Wjj7r0k
aln6Bzx8y3nxqgp9Vl4hzRpvV32+0PVK34DftD0ftNvfiIaNGEYhoilqRaE3NoAJ
4OPEWPe94wJHy0vyQJi2DnQ6Wzjnh1NfIv3u3qAHvzWbk6aUjbp1fGozTKstgD9D
KCjTpdKxI2QVONG+NBNuTrjNf0J8BqDhfaf5a6zpD5Wsag7R87kLFQhGUw/lCcyE
F1pcp8OESRLV2Kamqp+oQH2S6GBoHaE5ih1arGHbV8QysyeoBbsAB0EVO64k/Lbl
LsZO+vSOvTCU09shu3LybZTWmMbBF2pY7ihdjZnGDmD7oCPdhuKF/g9CmW3cb/oh
Gb/JuAxdxNpj35N3p1x26LUcgMLpa/5M5Tz77hD1HUB0wmDzDv1cSSDzZtaw1BZf
WYp23RgRqLtJceWPlN82tYz2qmUAiaGwevAfqUx3e/2EnbgfLgvOTLfGcPJvQjPG
GlRFzePtttHAGrm/aSLeE5viU34JgOgYdJIxzBcS7F0Phhut0u9H
=wq6u
-----END PGP SIGNATURE-----

--oncij6wul66bxvjy--

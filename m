From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip regression?
Date: Mon, 10 Oct 2016 09:44:14 +0200
Message-ID: <20161010074414.izl2ty2wix3jdtsd@Redstar.dorchain.net>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
 <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
 <20161009092713.ursiwck3hg6d6jie@Redstar.dorchain.net>
 <5751ffd3-1e38-5926-43a2-11ec680ec7bb@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dmuappl625y7g5ub"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 Redstar.dorchain.net u9A7iFHq008458
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1476085455;
        bh=o9dUDO8UURXgTYnfJvUgniNhThvCneoHNv69ZtQERzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cNf798w70ODNaFm5TJ1i9ZFKDCxIsODjMk9EjFq6bUtExqqlE3oyQGzp1Tx9McxUx
         X/cICnenQEzl9PoycpbThccrYBdSRIYw4l461qDsMvKAudE0WWOZou5wE/wZ/sDhef
         u39fQkucnm37/PTi4whb+j3mwV8ubT9sz4TTOywM=
Content-Disposition: inline
In-Reply-To: <5751ffd3-1e38-5926-43a2-11ec680ec7bb@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adel Belhouane <bugs.a.b@free.fr>
Cc: netfilter@vger.kernel.org


--dmuappl625y7g5ub
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2016 at 02:25:27AM +0200, Adel Belhouane wrote:
> Well sorry for the previous answer made without thinking (or reading), but
> indeed
> I can read iptables-save better than iptables -L.

No problem, I will adapt ;-)
>=20
> Else, if your ppp0's MTU is a bit low, SIP might switch from UDP to
> TCP (RFC3261 18.1.1), then adding a second CT rule with tcp port 5060
> would handle it.

MTU is 1492 and tcdump shows quite clearly UDP packets from/to port
5060.

Bye,

Joerg

--dmuappl625y7g5ub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAABCAA3BQJX+0bJMBSAAAAAABUAEnBrYS1hZGRyZXNzQGdudXBnLm9yZ2pv
ZXJnQGRvcmNoYWluLm5ldAAKCRBxI390Nm4cqAIFEACEzj5Lo3fufly8PUX3oe53
OWDgcVQbBh2X2Tou7RsAt/VJ9AJ7TaCJe36pikJqqSL5rpUoChWk95dz93Kk5Dhf
NUgomIsNPKyBO+KiQOkIVOQAy4Eqw+5XHxwSKX0IGQbjv3ijfIIk458pRroFR/o+
bwAdYufWluvcwJLt8n9bh2CdULuUOy0xLwB06rWdjSw1ddq8oyY4hRqKfKcI+Z3T
lTHbVz9tdgr9oquFv2ANWo3mVw9fWhyZMuT0G8jFswUUj0rY/AO+SEcTtNVUvp0R
mifXhOPSIINeZEHvt9iYy88uNnw7RbRt4orNxLghGNKbnHh1BcApNniADVHKXsAN
inSe2PrmjpEy+ZHXt3mNeMTY3eTx95ImY4qseJB6jJ/OAz4kMYRbdE3lcTCmtMuG
teH78LYY06hMwT3qj14GwdYkxIZ/EeB1g9FYufW8y0dBZ/Js5pDlLzb6sllp9sYv
GRsp9Nk9UTHR54ckoFiMHVIaQ9VLy8dABJNKofTdqVpn5oRgLRx5pBYdM+rQffBU
Z8rlOrWDDWsHLDIsRGRBF2XgZHBW9oG+iicPi84NF4YxouS/U/Q1Uow82upeFX8D
UE4VD2DdfeMmH4/FaRMY4eBsB6obEgWb/xXkehXq6Y5k5rXhTefyoTr/pFlAWid6
h3Wia2tcBft6q/6U0iAkcw==
=Clon
-----END PGP SIGNATURE-----

--dmuappl625y7g5ub--

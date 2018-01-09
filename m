From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 10:58:34 +0100
Message-ID: <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uyldctwa5ivokkga"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 Redstar.dorchain.net w099wYn3015645
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1515491914;
        bh=nrHlMCEPj+LV4yX3zD7OKw+nSFctmNqA2umBKscDS2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ANGv5jYUbuWati0zR4cvJIRhRsnuZRG8tferBqIB5mLcYBb+CHgVXZ94Dzsxibkw8
         XNyov9WX0jd1ep7qaQi3BGKDqG5gbhbKWqlB6O7jjDtMw9m1mDTMwAmqwP54CD9yas
         DSlF7FNCGukFKg9rHMvhpak8xdAVuExb/ykQi/jA=
Content-Disposition: inline
In-Reply-To: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Dave Osbourne <dave@osbourne.uk.eu.org>
Cc: netfilter@vger.kernel.org


--uyldctwa5ivokkga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2018 at 09:28:26AM +0000, Dave Osbourne wrote:
>=20
> 1. The list might be incorrect and legit requests will be blocked, the
>    list will have to regularly derived (there might be a source who knows)
> 2. "bad" IPs might be on that list and allowed
>=20
>=20
> My response is to implement a dynamic block list (say)
> http://iplists.firehol.org/?ipset=3Dblocklist_net_ua - using iptables on =
(say)
> Debian.=A0 I've looked at an hour of probe data and it seems that that
> /*specific */list would have blocked 97+% of known bad probe attempts (and
> the list is updated regularly).
>=20
> I hope someone might be able to provide argument for / against... or share
> an alternative...

I have been doing this for a while, but now have found that ipset
fit in very well here.
- Adding and removing ips from a set is easier than fiddling with
  iptables syntax.
- The timeout feature comes in very handy.
- Basically the iptables rules can be static.

Bye,

Joerg

--uyldctwa5ivokkga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJkBAEBCgBOFiEEi1H+OmIH+hWvEDR8cSN/dDZuHKgFAlpUkj4wFIAAAAAAFQAS
cGthLWFkZHJlc3NAZ251cGcub3Jnam9lcmdAZG9yY2hhaW4ubmV0AAoJEHEjf3Q2
bhyo3NgP/iDmA2u2hYM5uEkXpaun3KHngSBK0kdz5bsuZz7SwYElW/vuJsmShyFc
gnNtKPBwnM1elTl635MMOjpvdV0X+2CjzgzFT+kuJrfcNmXxRbf/c7nfbx2AoEJA
jukNwtnLM5Tcpx7gXx0AB7GvPCkgtZiOel46OYl0MYnYeGCjL27kPY8ukIZ+3Ukd
Ae6yt3GBvH/1zTH10JZ7F0M9qpkkJdkLz8gPntrXZnGYREvfa0e9WpmXLCaiJoOS
CIeQ6EZIA9tY04eHzD0g4EzadEzyqoJ7EJGsJwM+7WdYPkFWW/cubzy/CrURfkIZ
hTe5EuEhgyzapTAv17eBUxert3CSS8k9LaKgfJDm0qkQGX/lFuwSopqMagn6Vxiy
3XzUYRg75xyBsgo6T4Xjit3rZtFyerR+t91kCXaeyaRagPpAGsQu1UDKQ1FL8BHI
CVfNGMoV6A/+gEMX560KsvB4rF9Lk0zC004CSRvk+sK4NMAuP/PcW4LEketQnE1u
01OHH/JuAhBuohn1foMpK3Rk2f8kv6/aPpw4f6TliN7244KPfw6/uEoOkeXxdC/o
dcpfwjf1CqVi0KdtN+8kLhnRltocJ3iJhNLLv5qrCwp/dhY4UPu4HiU9zD2UZZQ6
b/gp1RuIOgPSA0bKS+IIAr3dMtnSGhsqou9OHyRoF1v48andO1BO
=Csjb
-----END PGP SIGNATURE-----

--uyldctwa5ivokkga--

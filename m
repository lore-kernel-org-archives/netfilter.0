From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 18:33:32 +0100
Message-ID: <20180109173332.dthdu4vvzoi2frdq@Redstar.dorchain.net>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
 <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
 <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6ckf4rhlllh6npky"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 Redstar.dorchain.net w09HXWOB008263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1515519212;
        bh=nmMPM3UxTsdjO/JC5+CpqleTVS4v4+b2pZd1SHXVLEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZyQa9E2f/VQoPJQQyt/i6fvpH4/FRv8xZ0QX8tPshgRvVQfd1Egfa4xc+8uu8R7c
         jPnqHgHoEuT1fY9f12sqcqHBdudDBs3Vi4RGzqzZRVEf8kjJjH6kEQJAKQ9Xh19Mub
         8wI47PYqxh0TqqGoAyBUNQTcvAEsed3ebDKIULmo=
Content-Disposition: inline
In-Reply-To: <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Dave Osbourne <dave@osbourne.uk.eu.org>
Cc: netfilter@vger.kernel.org


--6ckf4rhlllh6npky
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2018 at 04:24:50PM +0000, Dave Osbourne wrote:
>=20
> Ah - I looked at that (ipset) - didn't even know it existed...!!
>=20
> I'm getting a lot of resistance from our outsourced IT supplier on this..=
=2E=A0
> the excuses are variously:
>=20
> * block based on SRCIP being in <insert unfriendly state here> or

Can do that, if you are sure to never get customer from there.
More complementatry, not a replacement measure.

> * why don't you migrate to Office365 or

Or use icloud. Blonde is actually a state of mind, and makes the
world a much easier place. Next round you'll be talking religous
arguments ("I belief this will..." completely lacking undermining
facts)

> * don't worry if you patch regularly and have a good passwd policy then j=
ust
> let the traffic come

Again, a complementatry thing.

Don't rely on a single measure alone; If you notice an IP banging
at you with a dozend failed logins a second, why not block it
automatically for some time? Helps a bit the noise in the logs,
and the length of that queue is a bit a a script kiddie fever
curve.
>=20
> Does *anyone* have some kind of a reference or best practice for this, or
> their own motivation even?

Easy, cheap, helps. For more fundamental arguments, see relevant
literature (Schneier et al.)

> I feel the resistance I'm getting (not from the list) is through a lack of
> awareness by IT professionals...=A0 this seems like such an obvious thing=
 to
> do, yet 3 IT support companies I've spoken to don't seem keen....

Sometimes people just are not interested in things they can't
monetise within 3 month..

Bye,

Joerg

--6ckf4rhlllh6npky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJkBAEBCgBOFiEEi1H+OmIH+hWvEDR8cSN/dDZuHKgFAlpU/OcwFIAAAAAAFQAS
cGthLWFkZHJlc3NAZ251cGcub3Jnam9lcmdAZG9yY2hhaW4ubmV0AAoJEHEjf3Q2
bhyoaOQP/1ShcUAK+bDIGEhgdoIYCkQTiS06ZIpVsMiSsn4of/YOxKA709n6ckxG
7aRQEAbCrJcaElQNgUeDzsEq6EwSwRqe5VMHA1BPP6+GSsFh8iX1G2voR1eQ13EY
YLUO+Cc6eeWYgVkIF/bk4Pu0c6Or9DF2XPoMjR3dpNmi6z/l2l5nQk7FJ9URprex
AVWfuQyp0uL07974IKqftiIeqAes82jEnId2q+o7aUcFzKih7Hgn5XTMBN4i9Svv
VlGamN33WUwH28ARGU0TobBIVkSrw02W3VJOkrChz8ULe9sA54yZaWyvWLhq2jcH
+VM6QydeWDNFjxdu/aadOd+n3jBEqd7JBn9uW6NMzX/U1PtJw7rhOJdOOLvFIJBS
HslBokgDspvfwtH8U8X4ZnSXimGj4KHaMwkk60aHr0QV3vdwK4gPlb82vVhIpLbs
4X16jdI8tIRI9uhypRcmCz64Ph4Mn8gKOttnBAJ2mV++6Omzq0+4l+c8Uuv+ejUa
j8DcJdbTdXMtkQuM3tpiC46whNQCVT2sAbwq5okvJdChsyhVHmKa1yWumhxMCEgp
/142EmWryTstwlh1JYay9ur9xGuwKLluyeV0WAEhUUwiPaML0j+RXNRAuz/DRfpG
sDI0j3aP6MKw1ZK9mAj7uyLCkqfN0Yvv926QQteuHDeGueaSZjL5
=ow6z
-----END PGP SIGNATURE-----

--6ckf4rhlllh6npky--

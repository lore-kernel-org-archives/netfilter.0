From: Mario Vittorio Guenzi <jclark@tiscali.it>
Subject: Re: Grammar in a bash script
Date: Fri, 25 Sep 2020 14:01:46 +0200
Message-ID: <e8e76a57-402d-e5b7-8406-8c516e1424aa@tiscali.it>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="celk5OhpKBsRUVWaXz1wtRc3xSR9wd2t2"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tiscali.it; s=smtp;
        t=1601035312; bh=CUbCfyi8ZVga14HDI+A8FKvVqTXaIROlC9ScfDbHtW4=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=N2XPgbnHfeXc4vRo7vRWD2M9dKsMdmyy+BC5clXwmUP+iu1xuJkmgOI3JSJjISekO
         spvg40cJPcghZyMeP2OcoNe8k8EmQhZ5+WDf7kaMIli3wOE5kqYJO000qWDjKFKN01
         Z/p3J9JKoh1VNEIfBHRe1f+IlbN8J6qzfGdJOV4o=
List-ID: <netfilter.vger.kernel.org>
To: Netfilter list <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--celk5OhpKBsRUVWaXz1wtRc3xSR9wd2t2
Content-Type: multipart/mixed; boundary="zm90dF0dKJf6tzFajuVKHZitvZ57TDD7q"

--zm90dF0dKJf6tzFajuVKHZitvZ57TDD7q
Content-Type: text/plain; charset=iso-8859-15
Content-Language: it
Content-Transfer-Encoding: quoted-printable



Il 17/08/20 07:55, Mario V Guenzi ha scritto:
> Goodmorning everyone,
> Does it make sense to use this kind of grammar in a bash script?
>=20


Thanks everyone for your invaluable help.
I solved it by doing as you suggested, and the bash script only serves
to launch external nftables files.
Thanks again





--=20

Mario Vittorio Guenzi
E-mail jclark@tiscali.it
Si vis pacem, para bellum


--zm90dF0dKJf6tzFajuVKHZitvZ57TDD7q--

--celk5OhpKBsRUVWaXz1wtRc3xSR9wd2t2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTq04Bmf6EVqIWOKVubqqzVmQ2sigUCX23cKgAKCRCbqqzVmQ2s
ipsYAJ0e87DuW1B5H0gB9kYjesa4tU1NhACfUVuH6O0mKlyuXVtIQSJWI024J0Y=
=k7QL
-----END PGP SIGNATURE-----

--celk5OhpKBsRUVWaXz1wtRc3xSR9wd2t2--

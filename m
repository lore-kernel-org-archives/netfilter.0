From: Diego Lacerda <diegolacerda@gmail.com>
Subject: Re: host based redirect
Date: Sun, 04 May 2008 13:11:48 -0300
Message-ID: <1209917508.3265.4.camel@localhost.localdomain>
References: <481D93B8.8050306@gmail.com>  <481DBACE.5010806@treenet.co.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-emxZXXE9CsvOxT2VSCvw"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
        bh=65rowJpY4rrsC/VQQw24MaO9wSKL4qwj9/fsy2ga18I=;
        b=ok6FQUUKkN2OaPk7goiSkEBFdt7iaJTtG8kqbeZ9L66gAt9+5CoRKgwXbtXvgLxDosTUkE5Q+pUUWVPnuGmgwvAorEtZVBzsdfqTBBtAA7xLVjLBbdgQoAFsDXhZVo473z8ANw74DiVoT5imF0TkIEQfP42VBCFP16JukGw6RPE=
In-Reply-To: <481DBACE.5010806@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: "aergis@gmail.com" <aergis@gmail.com>, netfilter@vger.kernel.org


--=-emxZXXE9CsvOxT2VSCvw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-05-05 at 01:31 +1200, Amos Jeffries wrote:
> aergis@gmail.com wrote:
> >=20
> > it is not possible to make netfilter parse http headers, redirect=20
> > accordingly to Host header ?
> >=20
> > can someone please suggest me some software which could be used to=20
> > achieve this ?
> > squid can, but i think it is likely very bloated.
>=20
> Depends on how you build it. Anything can be turned off.
>=20
> (Yes I am biased, being a developer for squid.)
>=20
> AYJ
Hi,

Do you need a reverse proxy?
I think that you can use Apache and mod_proxy to do this, it's very
common and easy to do.

Regards,
--=20
Diego Evaristo de Lacerda (diegolacerda@gmail.com)
Project Analyst
LPIC Level III & Redhat Certified Engineer & Cisco Certified Network
Associates

URL: conectado.motime.com

--=-emxZXXE9CsvOxT2VSCvw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD4DBQBIHeA5rWR2/j9WrhMRAh0tAJ9gCWuSMpWkFsifqbN+EKb0iI5x3QCSA2Nz
+fJGmUoxWSEhRaIPHrZoaw==
=N8Si
-----END PGP SIGNATURE-----

--=-emxZXXE9CsvOxT2VSCvw--


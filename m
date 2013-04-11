From: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Subject: Re: [ipset] Match both on source AND destination
Date: Thu, 11 Apr 2013 18:58:08 +0200
Message-ID: <1365699488.5674.3.camel@draco>
References: <1365691926.25705.48.camel@BEWS005.euractiv.com>
	  <alpine.DEB.2.00.1304111701570.32023@blackhole.kfki.hu>
	 <1365693831.25705.50.camel@BEWS005.euractiv.com>
	 <alpine.DEB.2.00.1304111726560.32023@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-arhLu0yJKgfa0G6Z6HLy"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-type:x-mailer:mime-version;
        bh=0XBAA/0E4hj6aZwKxp4PAwlFuYydGly0GUBeqoziduc=;
        b=VFUMKuQcQUAOeQBpINFSNBGXFvSFmOKsdhXK0eXT56+xPdDWJbXXojDrRq/zbXsGCU
         T9+Ru1d6J1ZoI0ZuSCKICG/j/8oWfbW3TgGWJGFbjeS881p0QmM6zEqLBi4GN+Mg9RWj
         t78quJd6+uzSuaparKFjFrB57qU43wCUFNPUiTMVWPHuR6chxswFbno23VuP1zOviJww
         FQWG0U2o2O5dZ8Gib2oNr7PxGhgWGJBLHAsvaTZUN7AxdawXDFEo9ntHWC471JGtQeW1
         rrqnTstyMXEKye+XxFo8fwHiaK/EfUx/8PA0i99cv1iT6+qmY3WorKSllPGy1IdRIVCp
         F9QQ==
In-Reply-To: <alpine.DEB.2.00.1304111726560.32023@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


--=-arhLu0yJKgfa0G6Z6HLy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


> On Thu, 11 Apr 2013, Jimmy Thrasibule wrote:
>=20
> > > Apply two matches:
> > >=20
> > > -A FORWARD -m set --match-set mynets src -m set --match-set mynets ds=
t ...
> >=20
> > Ah,
> >=20
> > That's the first thing I tried but as I didn't load the module twice it
> > wouldn't work.
>=20
> Sorry, I don't understand. Why would you need to load the module twice?
> There's no need to load the module at all.

I just mean that I tried something like:

-m set --match-set mynets src --match-set mynets dst

And I got an error saying that --match-set can only be used once. And by
module I was more talking about the match option -m until now I was
thinking that calling it only once would be enough for the whole rule.

--
Jimmy


--=-arhLu0yJKgfa0G6Z6HLy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRZuugAAoJEFNYtCSAPHIVPg4QAKyN4/fScrK6hZNunhFHKs1L
p29x/7vI7ZKZ0S60w0rj/fsmNZbHA1K2h13j5dJuSP2v/6WCO0l37QT9YLyf1ndY
QZouNoDVVKh4x95g3hVYB1pH2XlU20IPBp3YwkUp3xLsNsek7O0E+H1aJjQ+0LZh
Vpvhq/9bf0FCzBqd9RNze0OCKGvBXQDzusKDUadRyIkKEBeRd0UgkvjilvDRnVG3
b1zN+gWk3SmWvDqSodgHdhFLqq3+VCGFoVD0YUQPynBsEXPknGlC4PfeWo1KBZDT
2EBHgppvT0OLiIv0XkomKhh/7zxX9CNf7PEi43OakurQGd22V7nqQJ3UYV5ctkaN
GP1QRlk0JeV1D9MuJtHXmMkObSzWuK1e5ngU96YCfZgAFqEnChFBZvdHQNBQuoPs
BeEXqPGwaGMs9LR/+GfIvjsXwCFuieHAunZIg1KNsl+XtDUZPC+2PGdPzWN3KSVX
w68jVuXXOlnWS6hi+5uoAyTlMKqyfPK4IdqoYLppVonzWS4xnNT9FiV1FYYWS+FE
SQcWwQ7uH8TkxepH9ODRWObSiWUWM/JDashVx9dE75FGqVb6ZCCmtmisEqdKOOQK
qu1J09yi48/SnqJP9LvcV48CKUykjDecnwRIjeALR8N4LlWU+5ecp3D7iwBlbO8s
ru3yaTN3fd5KrQdYYNY8
=01cC
-----END PGP SIGNATURE-----

--=-arhLu0yJKgfa0G6Z6HLy--


From: Eric Leblond <eric@inl.fr>
Subject: Re: nfq_unbind_pf and nfq_bind_pf return values different in 2.6.23
Date: Thu, 14 Feb 2008 20:28:21 +0100
Message-ID: <20080214192819.GB21538@bayen.regit.org>
References: <47B39D5B.9080804@t0mb.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47B39D5B.9080804@t0mb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: tom <tom@t0mb.net>
Cc: netfilter@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thursday, 2008 February 14 at  1:46:03 +0000, tom wrote:
> Hi,
>=20
> I haven't touched C for a while now, and have been using python.  I used
> supposed to make ipq obsolete anyhow, and the author of python ipqueue
> now recommends nfqueue.  Unfortunately, it seems that nfqueue has been
> broken as of kernel 2.6.23 due to changes in the return values of
> nfq_bind_pf and the unbind equivalent.

Return code of nfq_unbind_pf has to be ignored in recent kernel.

> The code expects 0 to be
> returned, and complains of failure otherwise.  I was just wondering if
> someone could tell me how to interpret the return values and then I can
> fix nfqueue.=20
>=20
> At the moment, this is the problem unless I just fudge it so it doesn't
> bail out at this point:
> If I fudge it so as to just print out the return codes, I get this:
>=20
> localhost Wall # python testq.py
> NFNETLINK answers: Invalid argument
> -22
> NFNETLINK answers: Device or resource busy
> -16

This is bad ! someone of my team has just encounter a similar problem on
2.6.24.2. Did you use compiled-in Netfilter (opposed to Netfilter in
loadable modules)

PS: Could you tell me where to find the python binding for NFQUEUE ?

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHtJZTnxA7CdMWjzIRAkC9AJ49V4C04P9XtdS5GKul55CmDgsHUQCfdzHJ
ndRWolHV/19S/AmZInN+hLY=
=RyLY
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--

From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip regression?
Date: Sun, 9 Oct 2016 21:53:15 +0200
Message-ID: <20161009195315.o5gkbcm2th6fnvx2@Redstar.dorchain.net>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
 <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
 <alpine.DEB.2.20.1610092001540.22883@aurora.sdinet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jjmbgu26m4qs46g7"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 Redstar.dorchain.net u99JrH0S025000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1476042797;
        bh=CueJqiXX40c8S2OY/84sK7pL9nFgFIUok6MHhRbdgzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZC6sLWQ1GWe986VxAzR0YJWxRKtFkCYhtv6sh7ULk45vPpu3lUUPAf2HfihGa/on9
         /R4JpqfbJmZWCljTckNBoGK/yJiktCmLOhyToJD6lnKyyoPL5ZL9oOwRLnvL0JheX6
         cXuaJBo4d2dXEzk8QBKRQ6xDsw1bBIkEe/5/Jk78=
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1610092001540.22883@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Adel Belhouane <bugs.a.b@free.fr>, netfilter@vger.kernel.org


--jjmbgu26m4qs46g7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2016 at 08:06:56PM +0200, Sven-Haegar Koch wrote:
> > I think that's the answer to the problem:
> > https://www.spinics.net/lists/netfilter/msg56874.html
>=20
> Is there a complete list somewhere of all rules needed to entirely=20
> replicate the previous way of "just modprobe all existing nf_nat_* and=20
> nf_conntrack_* modules"?
>=20
> (To make a user NAT gateway "just work for everything, no matter what=20
> they try to use")

NAT is not my problem, both call legs are reachable directly. I
just want to use connection tracking to keep the set of open
ports minimal on the outside interface ppp0.

I am puzzled that nf_conntrack_sip only notices sip connection on
the "internal" ethernet interface but not  on the "external"
ppp0.

Bye,

Joerg

--jjmbgu26m4qs46g7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAABCAA3BQJX+qAmMBSAAAAAABUAEnBrYS1hZGRyZXNzQGdudXBnLm9yZ2pv
ZXJnQGRvcmNoYWluLm5ldAAKCRBxI390Nm4cqN4aD/9dB/hl1UrM+Ys6gi6N77Db
fp9dmhUSOq/GSuojRB691VUGM2RTynfdL2WkSko9+XFW06/5Z9Lll/AIKTlqfZXN
s0gyfEzUl4H7ZshpRZjOpO1Wr/yNVLgCun1cttdjo1xjdctVR893OGSVVAyERrFX
MECAPaUMSNnw3mlgC6qlch28n1hcWTbiAd4L9VXdCJvQPiQoOZ1V6yEg+SffdGoc
ug/z7MAiHYHYh2Tw5ekbJjdcW11lGXaLkOGuTl4u7zYUrivfToEt3k/zmiDMFoH7
bulYJ/2+7xxN8Hb/pZUpJpmNX/XCX/gEuvedqPhru/3rgX8F5E9uKO/RNF2/SQa/
dNn01tCq7J9GuTq5K+7vvNRoBO2W0idzEboXX8fhjo8nYnCR6hDBhRSbjJnUSbg6
5vILY8OLf0T92n7RLlRMSsAHYwgxB1+hUzdS5Jp7j5VfsEH1q1kYso+dXbjf1k7A
UAdGdl8z7JAyxddVVxYOfI/pNpMXS25xSHuyDCQy6OXFin9444vtTxI9NDwkFVI2
A9J/yMwxetUK3an8oKZeaARFz0JNEYqaLrw7mJA9Vwqf/ZwVrPoZQZFObfFvyYx8
drFiwOWJZKnOskX5Wc37Rgeeq5NY2iTJrqUMo02+MSPI5UFB+qWqR6fqeEmPYwt+
SH0T5cndTIoeL7KpHBOm3g==
=9q8M
-----END PGP SIGNATURE-----

--jjmbgu26m4qs46g7--

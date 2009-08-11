From: "Christoph A." <casmls@gmail.com>
Subject: Re: Get source IP of packet through PREROUTING CHAIN
Date: Tue, 11 Aug 2009 15:44:51 +0200
Message-ID: <4A8175D3.3050705@gmail.com>
References: <21df6cb70908102139i1f0f21besc94740ed507615da@mail.gmail.com>	 <4A8165BB.7060702@freemail.hu> <21df6cb70908110637s60abb999y5358fd22eeb89486@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enig9C6BBE01BED4E39382C355BF"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:content-type;
        bh=4rcF4mdgphZVs+BsODMle5l0YAz5Kgm5g0ebERjkckg=;
        b=CFjtLcWJMB39h/RAmlZz23irjZegy4yin1PNeP1ist7uE+ovW38Pm4Yxp7cmjmaWic
         tehgiyYB19HzaAvNF66Z5eDpHznG4OJDFJyKxUut57yb0iPpAdiv1z26z0j6UW1RXg69
         wHWB+KVprOny+FbSjU4B/cP/t4etiT8KiHMtc=
In-Reply-To: <21df6cb70908110637s60abb999y5358fd22eeb89486@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Elison Niven <elison.niven@gmail.com>
Cc: netfilter@vger.kernel.org, elison.niven@matrixtelesol.com, "cas >> \"Christoph A.\"" <casmls@gmail.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9C6BBE01BED4E39382C355BF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11.08.2009 15:37, Elison Niven wrote:
> Hi,
>=20
> What I need is to be able to know the source IP and port of the
> packets received at a particular port (10000 here) in user space
> through a C language interface or may be can I read somewhere from the
> proc directory?

I guess
/proc/net/nf_conntrack
will be handy for you.

kind regards,
Christoph A.


--------------enig9C6BBE01BED4E39382C355BF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEAREKAAYFAkqBddcACgkQrq+riTAIEg0prQCfYgG5QYVpeKXYX1IJByD8mT1u
aYQAnjNq0N21m6NRVB3K6HdYZsgwByMq
=jod7
-----END PGP SIGNATURE-----

--------------enig9C6BBE01BED4E39382C355BF--

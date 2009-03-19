From: Christoph Paasch <christoph.paasch@student.uclouvain.be>
Subject: Re: Outgoing redirection with iptables - TCP skips NAT?
Date: Thu, 19 Mar 2009 16:19:01 +0100
Message-ID: <200903191619.06420.christoph.paasch@student.uclouvain.be>
References: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com> <20090319144343.312510@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5294704.shyRqvbHSU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=uclouvain.be; h=from:to:
	subject:date:references:in-reply-to:cc:mime-version:
	content-type:content-transfer-encoding:message-id; q=dns/txt; s=
	selucl; bh=n57OHm8cDwMqkPLITPZq5WOITUI=; b=JUDSAu02WMWCxTQ7zSUt2
	nsd9gyvbVxf+43jibZuyrmb+ymrJ0UKDpYZexTWM6wXfC20jfvUiC1whM9KgNuO9
	Opdtv9FnZL25OHMiUHj/KOH9FM2/7oYhHF6P2/txK1KwX35qbC1SnrO07XHf84wk
	9ru/F2YA8RBbUbKOKnY1FM=
In-Reply-To: <20090319144343.312510@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Kristian Evensen <kristian.evensen@gmail.com>, wlet@gmx.net

--nextPart5294704.shyRqvbHSU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

sorry, but the reasoning is wrong.

UDP has a state in the netfilter connection tracking statetable, but it rem=
ains=20
in the NEW state (as long as there isn't any reply traffic).

And your rule won't work, because DNAT checks, if the packet you try to cha=
nge=20
is associated to a connection in the NEW or RELATED state.
As the connection is established, DNAT won't work.

Christoph

On Thu March 19 2009 wrote wlet@gmx.net:
> Hi,
>
> I guess this won't work because if you connection is established it will =
be
> stored in a TCP State table which is used for filtering and forwarding. If
> you connection already exists it makes no sense to check it against all
> rules from the ruleset.
>
> UDP doesn't have a statetable (cuz it's stateless) and that is the reason
> why this works.
>
> wlet
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

=2D-
Christoph Paasch

=C9cole Polytechnique de Louvain
D=E9partement d'ing=E9nierie informatique

www.rollerbulls.be
=2D-

--nextPart5294704.shyRqvbHSU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknCYmcACgkQLHtZTroOLZuOEgCeN9ZNZuQaojlgNsE5Q+XxSBQK
1X0AnA9I1B7NvrzMz/jd5QK8IzHLDx6/
=m/Jr
-----END PGP SIGNATURE-----

--nextPart5294704.shyRqvbHSU--

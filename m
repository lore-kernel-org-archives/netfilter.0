From: Eric Leblond <eric@inl.fr>
Subject: Re: ULOG vs. NFQUEUE
Date: Sat, 01 Dec 2007 12:14:36 +0100
Message-ID: <1196507676.16574.26.camel@localhost>
References: <d95317090711301506h43e67d07x55d7a8535f284606@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eDzD2zH3VH17uoVuWzGB"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090711301506h43e67d07x55d7a8535f284606@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


--=-eDzD2zH3VH17uoVuWzGB
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 30 novembre 2007 =E0 15:06 -0800, Gilad Benjamini a =E9crit :
> I read about ULOG and NFQUEUE in the man page, and there is something
> I don't understand, and that is, why is NFQUEUE needed.
> If I understand this correctly, a ULOG target with no prefix, that
> sends the entire packet to userland, and is followed by an equivalent
> DROP rule, does the same thing as NFQUEUE.
> Doesn't it ?
> I admit that I am no big expert on nfnetlink_queue. Could I be missing
> something there ?

You're missing the whole thing.

NFQUEUE is a terminal target where the userspace take the decision on
accepting or dropping the packet. It is used by project like
snort-inline (http://snort-inline.sourceforge.net/) or nufw
(http://www.nufw.org) to improve Netfilter filtering capabilities.
Snort-inline adds IPS capabilities to Netfilter and NuFW add
identity-based rules.

ULOG (or NFLOG) is a non-terminal target which is used for logging
purpose. Packet is sent to user space but there is no user space to
kernel space interaction.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-eDzD2zH3VH17uoVuWzGB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHUUIcnxA7CdMWjzIRAsmFAJ9eGJ/f7hlevA8zidFpe0pokub4/ACgkTXF
Uy17BBrepVSanfODjSp1hYA=
=66qi
-----END PGP SIGNATURE-----

--=-eDzD2zH3VH17uoVuWzGB--


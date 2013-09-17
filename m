From: Eric Leblond <eric@regit.org>
Subject: Re: nftables setup
Date: Tue, 17 Sep 2013 19:23:24 +0200
Message-ID: <1379438604.5155.46.camel@ice-age.regit.org>
References: <CAEyr1FS_PgdDjk=TLLTi=ut0eUu-X7zPZgJuhy2PP4ovJ2fSwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-YWpBS9rkq60MmExiNnNQ"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEyr1FS_PgdDjk=TLLTi=ut0eUu-X7zPZgJuhy2PP4ovJ2fSwQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Anand Raj Manickam <anandrm@gmail.com>
Cc: netfilter@vger.kernel.org


--=-YWpBS9rkq60MmExiNnNQ
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mardi 17 septembre 2013 =E0 22:32 +0530, Anand Raj Manickam a =E9crit :
> Hi,
>=20
>   I have the setup running with help from
>   https://home.regit.org/netfilter-en/nftables-quick-howto/ .
>   I have done some basic rule add / delete /drop tests .
>   At this point i  dn't see a option to replace a rule , which used to
>   be with iptables.
>=20
>   After upgrading the git to latest , rebuilding the kernel and other too=
ls.
>   Now i face this problem :
>=20
>   #nft -f files/nftables/ipv4-filter
>=20
>   In file included from internal:0:0-0:
>   files/nftables/ipv4-filter:4:35-38: Error: syntax error, unexpected hoo=
k
>   chain input { hook NF_INET_LOCAL_IN 0; }
>                                     ^^^^
>   Can you help me with some pointer to proceed...

Update your nftables sources to latest git. The examples files have been
updated this morning.

BR,
--
Eric

--=-YWpBS9rkq60MmExiNnNQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iD8DBQBSOJAMnxA7CdMWjzIRAnh3AKCNwRaLcmyTyzDJfccP8GwWcvJP/wCfS2f3
4hO4jKhtLkcmP1V3VTnzCfg=
=ppVy
-----END PGP SIGNATURE-----

--=-YWpBS9rkq60MmExiNnNQ--


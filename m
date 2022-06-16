From: Eugene Crosser <crosser@average.org>
Subject: Bridge table: binding the rules to specific instances of the bridge
Date: Thu, 16 Jun 2022 12:00:17 +0200
Message-ID: <009db61d-47a6-ef30-7e9f-791e1b17b98b@average.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oJ7hJseD6a5KRpQ1Qq0utSee"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1655373650; bh=5hXd2f3scsSmGdJahtSIQ43PRbvwZH6/uI7bLQSB4SM=;
        h=Date:To:From:Subject:From;
        b=QYdRUid+5vHzAbI+8/mmXxVS+rpJYhP0uNw5/TDISNyZtSU0ekprKZXh/b/xjIYEQ
         x9vORfQlc/Cemq4DuIHbQfutJR2hovvPcRNox/gcVyl0v3JsER+b8OnoRQNrxkosZo
         2DvYLLA2EVk9F7YgcanTT01MoWTGyF/p3odxlAX0=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oJ7hJseD6a5KRpQ1Qq0utSee
Content-Type: multipart/mixed; boundary="------------IXMfuqRndCqgsAnXM7kicv8r";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: netfilter@vger.kernel.org
Message-ID: <009db61d-47a6-ef30-7e9f-791e1b17b98b@average.org>
Subject: Bridge table: binding the rules to specific instances of the bridge

--------------IXMfuqRndCqgsAnXM7kicv8r
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I need to block all traffic that may arrive from the "master interface"
of some, but not all, bridges. This is mainly to prevent ARP packets
from reaching the network stack, but I would prefer to drop everything
to be certain, rather than just ARPs.

This works:

table bridge brtable {
	chain inp {
		type filter hook input priority 300; policy accept;

		log prefix "INP-" drop
	}

}

but it works for _all_ bridges. I would like to decide if packet must be
dropped or not based on the instance of the bridge, like so:

table bridge brtable {

	set to_drop {

		typeof oif

		elements =3D { "br5", "br6" }

	}


	chain inp {

		type filter hook input priority 400; policy accept;

		oif @to_drop drop

	}

}


but that does not work. Indeed in the log, the output interface is
empty. Iif is not empty, and filtering by iif would probably work, but
it would be much more convenient to filter by the bridge instance than
to keep track of all interfaces that were enslaved into it.

Any suggestions?

Thank you,

Eugene

--------------IXMfuqRndCqgsAnXM7kicv8r--

--------------oJ7hJseD6a5KRpQ1Qq0utSee
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmKq/zEACgkQfKQHw5Gd
RYxzrQf/cXO0ltptN0kWPrwrM2MWU56bjayo/QxYRBNCatZJRiHmUgKXLuX6Lh7z
HTtyZQ+wKpl0AaBislLqfMAEPJtlPH2MuzMZpZO0RAAJpqGAwRKTg/45PiwwLdjH
nEu4K7YlKhADygfSSPdW0GqTHtxC8QSbkwhk7OKpVU8416sw4cCYGRa4nBfcyDdS
2rK6lIzsovAv+ETix0fLfpRrVuVzI3BKutyMjRwu/v4dxaecJxG28uA2amsJeXkT
U2um88M6W5uwnOMBhizNaI9ZWzVYylNrJdqlmVtTF1qKp5OmGB3bMoMmzR1VF3oA
Ich2TwKtPXnzqJFgUBPYqv+VsAwRzw==
=sibK
-----END PGP SIGNATURE-----

--------------oJ7hJseD6a5KRpQ1Qq0utSee--

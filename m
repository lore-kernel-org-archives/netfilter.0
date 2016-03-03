From: Karol Babioch <karol@babioch.de>
Subject: nftables: Specify multiple protocols in one rule
Date: Thu, 3 Mar 2016 11:47:06 +0100
Message-ID: <56D8162A.4030607@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GwIEr838l0OPiv7EplLfLN5hBPvj817Q6"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GwIEr838l0OPiv7EplLfLN5hBPvj817Q6
Content-Type: multipart/mixed; boundary="uehaNExP4qpcxRNOqtcnTh44fn2b36dn3"
From: Karol Babioch <karol@babioch.de>
To: netfilter@vger.kernel.org
Message-ID: <56D8162A.4030607@babioch.de>
Subject: nftables: Specify multiple protocols in one rule

--uehaNExP4qpcxRNOqtcnTh44fn2b36dn3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm stuck with something, that seems very trivial, but won't work for
me. In particular I want to specify a rule to allow DNS traffic (both
UDP and TCP). In its most basic form my rules for that look something
like this:

    oif eth0 udp dport domain accept
    oif eth0 tcp dport domain accept

According to these examples [1], it should also be possible to put udp
and tcp into a set, e.g. something like that:

    oif eth0 {udp,tcp} dport domain accept

However, this does not work and results in an syntax error, complaining
about the "dport" statement. What am I missing here?

Is it possible to simply the above two rules into one? I have rules like
this all over the place, so it would be a huge win for me.

Thanks!

Best regards,
Karol Babioch

[1]: https://home.regit.org/2014/01/why-you-will-love-nftables/


--uehaNExP4qpcxRNOqtcnTh44fn2b36dn3--

--GwIEr838l0OPiv7EplLfLN5hBPvj817Q6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW2BYrAAoJEHSaZc1HnzIVDCIQAIh8SCXx2B0lUM+ZsFDtLYk/
S42Sz2fiuVMBWgN4OFgacuqNjWRK6TbT/fl+fnFjZSC0Qi4QELhuvofg/AQJ3kYw
B+kwMjsCBalavmTw041qnrd86QCeONk8TqkX9q6RList2CWCAIJ63LVT6PAeADQz
8dtjutASp++pTZfoZrGsFOlt1AZ2i4s7jOW2TIC8vWqL7+OMoMI1eE5+MX/guT5c
SUyANcE9w5CEvN6UeulY1ZPDSySfWkBjSwQaH0wVJdiW8mE2KWruzMss8UlN+oiI
uyTIge2mhbY8SJ6bcvLmb4SSU+Ssvl0Gy4JOGPpThfLz58yiWmeAR5xKxyP8EZSg
o2bl3yb4FewE3+9dIwTFWOT3qG9KqE1Dv+p+dYYwCfBhf56WIdI/udLjQ5YmTOIb
W1ilKp4mXDXEsN/au7kmPU27LkkiJcGKn5JxT6npyiizCIhQGDU1hO086fb124J6
QgTkIGmWTXx0O89y5tuAqhEkfk2qZS5J9cCQj5IWPeWGr8Mu8RtjX16hr0k4/H7L
84QfcqTNv+thQYEMZ7C55hZVIj3Wnrvr7wM8rqKnF+AKJB0SMofXYpjkEdnVy3Q5
smsAsHpUwXTwelKYZN/IvJjiuv/opyUt8maUex1x7CHMBrUdeu5gewXMaT8caZxP
MlSBa4A4h1rHga+xfNnJ
=sdz4
-----END PGP SIGNATURE-----

--GwIEr838l0OPiv7EplLfLN5hBPvj817Q6--

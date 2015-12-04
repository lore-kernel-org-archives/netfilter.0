From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Fri, 4 Dec 2015 01:35:19 +0100
Message-ID: <5660DFC7.9040206@familie-kuntze.de>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
 <5660CCD1.60807@familie-kuntze.de>
 <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
 <5660D6D3.8040205@familie-kuntze.de>
 <CAKmUPx4jX4wyK10jR9Qr0DEPveRG5kOoLnuScpLgWE78DRXtyw@mail.gmail.com>
 <CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx6yaQdb1OE6CSf0TQ=eZYV=eX7Kmdzg-x6nVPtxtMpLEA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Traffic going over loopback seems to be handled in a special way
with the TRACE target. There's probably no (in attritubes of the
internal data structure speaking) lossy conversion
to an Ethernet frame (or IP packet) going on.
That won't happen for traffic coming from another box.

- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWYN/HAAoJEDg5KY9j7GZYO8sQAJLP6ragMp/0NGAwYyWs7QdG
pePBmNhRKFXFaJdBdR3pGZ8UMO0FfpCdBrEavZpD1HC2YUM2d0UGe3grENV+KkoN
v5h5SQnBBWDcUJVpJbOwrrO4Dj0zYY3XQm9pfqx/w22hxZtxT828ze7pt4y40hOr
UsNTKGpMjZ3GVph/PIlwlvFZ7enTykxn1ZQnef8uTlT1ItqUsMivna5TkjAvhRAw
EJJqoGgrW26Kol1y4cscGsLDk9yQNrNB9QrFi++i1uIQlwqYPfYjIO6z01oyOhn1
2d7/l4JLmw7uFql1VQ10lkem/pWdjx3JA2TIp6Hq3apmeXw5LK+6bRQ6/E0gze4n
O/CZ7DCcPL82Jqwvjwjz3/AJ94qCPekut4uXSoXQMtkXij3GbMFU4T+sfgUZA7YP
SFVtCRLufFId9uyD2i1k53mq13pz7zUkvBl+vtLNlNYwzNkCkAFiugibTKsP3HnV
xLJ+sH1FzOmhUmKUHtmPvIPI0zENgLCnZp9IRhviNMOOQrhgNg5twRDQ+GVeRJJj
QzFWIETamy3PbVVOWLnsOrbaFAITGLxf17vyV8p0CAk5ZGkhBJvbS7U8LS+eRFSU
YlR3Gi+c0nAn7OWVBm5U8yPJytBhYHb40+xPqaM0ku4KhVwYj/0ndkCn6qEl+3Vu
u8lpwUxLLeNKP4xZSWJ5
=3D5K7a
-----END PGP SIGNATURE-----


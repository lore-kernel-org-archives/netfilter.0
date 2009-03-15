From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Creating an equivalent to ESFQ using flow classifier
Date: Sun, 15 Mar 2009 11:53:15 -0700
Message-ID: <49BD4E9B.8070100@shorewall.net>
References: <328bad7c0259fd816ae31c8405313e1e@localhost> <1237140472.28333.10.camel@hakkenden>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig809BD79F07F7B01D5FCC62E8"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1237140472.28333.10.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig809BD79F07F7B01D5FCC62E8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nikolay S. Rybaloff wrote:

>>
>> It is the last part that I am unsure about. I do not get any errors wi=
th
>> the commands, but they do not seem to make any difference to the shapi=
ng.

You are fortunate. Every time that I've tried to use the 'flow'
classifier with SFQ, the SFQ qdisc eventually drops 100% of the packets
presented to it.

Example:

tc qdisc add dev wlan0 root handle 1: sfq quantum 1514 limit 127
tc filter add dev wlan0 protocol ip pref 1 parent 1: handle 1 flow \
   hash keys src,dst,proto-src divisor 1024

ursa:~ # tc -s  qdisc ls dev wlan0
qdisc sfq 1: root limit 127p quantum 1514b
 Sent 161724244 bytes 107284 pkt (dropped 200, overlimits 0 requeues 2131=
3)
 rate 0bit 0pps backlog 0b 0p requeues 21313
ursa:~ # tc -s  qdisc ls dev wlan0
qdisc sfq 1: root limit 127p quantum 1514b
 Sent 161724320 bytes 107285 pkt (dropped 205, overlimits 0 requeues 2131=
3)
 rate 0bit 0pps backlog 0b 0p requeues 21313
ursa:~ #

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--------------enig809BD79F07F7B01D5FCC62E8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkm9TqAACgkQO/MAbZfjDLKIhwCfRhCCTcZ2GLwX0CDAJdaoonfT
Nm0AnjL0/YojoN4cqsXBGijAJy6r2dyK
=ciDc
-----END PGP SIGNATURE-----

--------------enig809BD79F07F7B01D5FCC62E8--

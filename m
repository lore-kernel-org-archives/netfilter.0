From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: DNAT multiple --to-destination gone: why?
Date: Thu, 10 Jul 2008 00:13:22 -0500
Message-ID: <48759A72.9030503@usa.net>
References: <487558AC.8080704@ca.sophos.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig16A163BB73B153BD655DAF8C"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487558AC.8080704@ca.sophos.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: David Sparks <dave@ca.sophos.com>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig16A163BB73B153BD655DAF8C
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

David Sparks wrote:
> According to man iptables:
>
> DNAT...
>               In Kernels up to 2.6.10 you  can  add  several =20
> --to-destination
>               options.  For those kernels, if you specify more than=20
> one desti-
>               nation address, either via an address range  or =20
> multiple  --to-
>               destination  options, a simple round-robin (one after=20
> another in
>               cycle) load  balancing  takes  place  between  these =20
> addresses.
>               Later  Kernels  (>=3D 2.6.11-rc1) don't have the ability =

> to NAT to
>               multiple ranges anymore.
>
> I'm wondering why this feature was removed?

I don't have an answer for this, although perhaps others do.

> What are the workarounds/alternatives?
>
> The reason I ask is that I'm using the range feature to DNAT packets=20
> round-robin to 5 machines (.101-.105).  .103 just had a hard drive=20
> failure and when I went to remove it from the iptables config I find I =

> can't do that anymore as the feature was removed!  I've worked around=20
> the problem by re-IPing a machine but I'm wondering if there is a=20
> iptables solution to this so I'll be better prepared in future?

Here's a workaround that might do what you seek.  Optionally, you might=20
consider a DNS-RR instead if it makes sense for your needs.

With the statistic match you can create a round-robin that targets each=20
rule in turn.  To do what you seek above you could use this series of=20
rules, with your own additional matches added as required:
iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT=20
10.0.0.101-102
iptables -A PREROUTING -t nat -j DNAT 10.0.0.104-105

This is conceptually the same (but simpler than) the following series of =

rules:
iptables -A PREROUTING -t nat -m statistic --mode nth --every 4 -j DNAT=20
10.0.0.101
iptables -A PREROUTING -t nat -m statistic --mode nth --every 3 -j DNAT=20
10.0.0.102
iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j DNAT=20
10.0.0.104
iptables -A PREROUTING -t nat -j DNAT 10.0.0.105

Of course, you can continue to add more rules as required.

--=20
Josh



--------------enig16A163BB73B153BD655DAF8C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkh1mn8ACgkQHSSgJy5aUSc4BQCfd32NJopHL0T1ma+97IxvuaoY
ZMsAnAnhROfojIE9o6MgR3OKxVFFIdrd
=4Zfs
-----END PGP SIGNATURE-----

--------------enig16A163BB73B153BD655DAF8C--


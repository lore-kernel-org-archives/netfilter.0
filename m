From: Eugene Crosser <crosser@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Thu, 19 Aug 2021 09:44:49 +0200
Message-ID: <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kwIEeiwe6RZ0khPnXScnEdjIGwDFQzpzn"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1629359098; bh=6WCSJdw4SZQrBiyhKpyvAmJL4FWM5ICPaiRwBWX2HQY=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=gp6GSyxXhR0wNeMNpyDKTLZDQdS5O75D1ReCg/DBLY+oUE/DxRRjV6aAOxX8vvsAV
         er5RFFnxlyw9JNybLP1V6iu0QKprczaKC/6pt4t1WZ5BDwbKs8LLtH80JNol70u4fG
         3I6OTpTo/rIiT3CZ5KOOTt5NK+SsDE4WjGoZqxMQ=
In-Reply-To: <20210818161340.GR607@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kwIEeiwe6RZ0khPnXScnEdjIGwDFQzpzn
Content-Type: multipart/mixed; boundary="uQ8SDpPRO3YqwG5OwS4VqxNqc9xRjP5cj";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
Message-ID: <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
Subject: Re: conntrack: confirm existing but do not create new entries
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
In-Reply-To: <20210818161340.GR607@breakpoint.cc>

--uQ8SDpPRO3YqwG5OwS4VqxNqc9xRjP5cj
Content-Type: text/plain; charset=koi8-r
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18/08/2021 18:13, Florian Westphal wrote:
> Eugene Crosser <crosser@average.org> wrote:
>> My use case is to set up a stateful firewall allowing any outgoing con=
nection
>> from a host, and restricting incoming, which obviously requires conntr=
acking.
>> The twist is that there exists a rather high probability of DoS-like i=
ncoming
>> traffic, that easily overflows conntrack table with unconfirmed entrie=
s, even
>> though their lifetime is very short.
>=20
> Create a rule that drops NEW packets in prerouting hook. For iptables,
> mangle will work (raw is too early).  For nftables, youl need to choose=

> a hook prioriy of -199 or higher (-198, ... to anything below 2**31).
>=20
> Such packets will create a new connection entry, but because packet get=
s
> dropped before confirmation the entry will not be committed to the tabl=
e.

Unfortunately this approach does not work for my case.
I cannot drop packets before I know that they are going to the INPUT path=
=2E
The point of the exercise is to route transit traffic without conntrackin=
g it
(because tracking will overflow the table), but conntrack traffic to/from=
 the
host itself.

Maybe I'd be able to determine which traffic is transit on prerouting sta=
ge (by
IP addresses or interfaces) and set "notrack" selectively...

Yet I am surprised that a flag meaning "conntrack, but only to confirm ex=
iting
entries" does not exist. Would not it be useful to have?..

Thanks again in any case!

Eugene


--uQ8SDpPRO3YqwG5OwS4VqxNqc9xRjP5cj--

--kwIEeiwe6RZ0khPnXScnEdjIGwDFQzpzn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmEeC/EACgkQfKQHw5Gd
RYzBLQf6AgVZDWzZ/kaBZLypg/Ig8Ca0jjrNEiudhfg1r66h0XDpFIlqRHT4fw5d
xvo3lovoC5gIY7xTXzM4y58z6YmGA1hzOHYYQFcl7T5yuIOCtJeTUJJr8DRoQrKx
7URx+fdzWDp4GGG04ZEyOw0L8fEoj8Dn7msAvg8oNYqUt5EIF49yFyI6/yPu5DFj
wzRlBICDeCYugxw3EWQzJyk5HeSFLNeAA13pDgvoLH0RGi0dC0VN0ITQqftz2OY7
br2drudRbkO+bUwsXdtiZPNzM6cRxtZf3QAdnT1348vPTWr5+bAg6OISoCJ37yeb
0dquRDzo2JTrvVqcc+mW7ts9MAiU2w==
=pSKa
-----END PGP SIGNATURE-----

--kwIEeiwe6RZ0khPnXScnEdjIGwDFQzpzn--

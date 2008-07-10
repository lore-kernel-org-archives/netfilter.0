From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: DNAT multiple --to-destination gone: why?
Date: Thu, 10 Jul 2008 00:52:56 -0500
Message-ID: <4875A3B8.9030602@usa.net>
References: <487558AC.8080704@ca.sophos.com> <48759A72.9030503@usa.net> <4875A076.5090907@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4B8471A6F468A64A2E31D6B8"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4875A076.5090907@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4B8471A6F468A64A2E31D6B8
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Grant Taylor wrote:
> On 07/10/08 00:13, Josh Cepek wrote:
>
>> This is conceptually the same (but simpler than) the following series =

>> of rules:
>> iptables -A PREROUTING -t nat -m statistic --mode nth --every 4 -j=20
>> DNAT 10.0.0.101
>> iptables -A PREROUTING -t nat -m statistic --mode nth --every 3 -j=20
>> DNAT 10.0.0.102
>> iptables -A PREROUTING -t nat -m statistic --mode nth --every 2 -j=20
>> DNAT 10.0.0.104
>> iptables -A PREROUTING -t nat -j DNAT 10.0.0.105
>>
>> Of course, you can continue to add more rules as required.
>
> Ugh.  That does not scale very well at all.  If you want to remove 102 =

> from above, you would have to re-write all the rules above it.

Quite right, and I don't suggest anyone use the above ruleset as it was=20
included to illustrate the process more clearly by using consecutive=20
statistic matches.  The hint was that the concept could be expanded upon =

as needed, such as the following example where $N is the number of=20
ranges needed:
-m statistic --mode nth --every $N -j DNAT $RANGE1
-m statistic --mode nth --every $(($N-1) -j DNAT $RANGE2
=2E..
-m statistic --mode nth --every 2 -j DNAT $RANGE_N-1
-j DNAT $RANGE_N

Rather than introduce a new idea I just kept the IP data provided by the =

OP.  (And yes, for the terribly picky I know that doing this with uneven =

ranges complicates things further, but I'm pretty sure someone wanting=20
this can read all about the --mode random functionality.)

--=20
Josh



--------------enig4B8471A6F468A64A2E31D6B8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkh1o7wACgkQHSSgJy5aUSesOwCfWjmjpVLwTrPw30RzN3u5P6j5
IR0AniNZKkVKBf2NbQFQwg0Oa13jwWFi
=KIgo
-----END PGP SIGNATURE-----

--------------enig4B8471A6F468A64A2E31D6B8--


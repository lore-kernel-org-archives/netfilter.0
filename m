From: Tom Eastep <teastep@shorewall.net>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 19:25:56 -0700
Message-ID: <4C996934.3090205@shorewall.net>
References: <4C9696E5.4030803@googlemail.com>	<alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>	<4C973A6A.9010809@googlemail.com>	<alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>	<4C9756AB.5040304@googlemail.com>	<4C97D6D6.9040805@shorewall.net>	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>	<4C988214.6050600@googlemail.com>	<4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig694380B53B81A38E7CEBE593"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Eric Paris <eparis@parisplace.org>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig694380B53B81A38E7CEBE593
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 9/21/10 1:26 PM, Eric Paris wrote:
> On Tue, Sep 21, 2010 at 4:13 PM, Mr Dash Four
> <mr.dash.four@googlemail.com> wrote:
>>
>>>> http://www.spinics.net/lists/netfilter/msg49106.html
>>>>
>>>> I don't think that approach is right.  Exporting a number at ALL is
>>>> broken.  It should only ever say the name.
>>>>
>>>
>>> I am aware of that and the proposed patch works as I did test it afte=
r Tom
>>> released it yesterday.
>>>
>>> As for your comment above - it is better than NOTHING.
>>>
>>> If you think that the current scenario, when I see meaningless number=
 in
>>> the secmark field, helps me track the actual security context of the =
listed
>>> connection, then think again, because there is NO way I could know wh=
at
>>> number maps to which context.
>>>
>>> Tom's patch at least gives me that mapping when I list the mangle tab=
le,
>>> so it is a start and it works. Again, - the patch, if applied, is bet=
ter
>>> than what currently exists in iptables. Also, 'exporting a number at =
all' is
>>> NOT broken - look at Tom's patch again - it does not break anything.
>=20
> No disagreement that Tom's patch is better than what we have today, I
> just claim that what we have today is completely wrong, so this is
> only slightly better   :)

My patch took two minutes to concoct and I make no claim of excellence :)=


-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--------------enig694380B53B81A38E7CEBE593
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyZaTQACgkQO/MAbZfjDLKoKACgvIlbCC0MGT+QRIsAkAGPQFsL
IR0An3dE88rClviMpOvQO38Za7iYrxrd
=FdWT
-----END PGP SIGNATURE-----

--------------enig694380B53B81A38E7CEBE593--

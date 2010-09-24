From: Tom Eastep <teastep@shorewall.net>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 17:24:35 -0700
Message-ID: <4C9BEFC3.6030701@shorewall.net>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com> <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com> <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr> <4C9BA88E.7080507@googlemail.com> <alpine.LNX.2.01.1009232148010.18921@obet.zrqbmnf.qr> <4C9BB600.6020300@googlemail.com> <AANLkTinaGWtK2j9Ob2NKtv58E-OnNAGF7uYG8fCotQX6@mail.gmail.com> <alpine.LNX.2.01.1009232249450.21529@obet.zrqbmnf.qr> <4C9BBF0D.1010002@googlemail.com> <alpine.LNX.2.01.1009232309590.23838@obet.zrqbmnf.qr> <4C9BC8C9.2090504@goog
 lemail.com> <alpine.LNX.2.01.1009240002180.25685@obet.zrqbmnf.qr> <4C9BD4F9.3020107@googlemail.com> <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigBD9406B2281C782A6BB93053"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009240126360.28190@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, Eric Paris <eparis@parisplace.org>, netfilter@vger.kernel.org, sds@tycho.nsa.gov

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBD9406B2281C782A6BB93053
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 9/23/10 4:59 PM, Jan Engelhardt wrote:

>=20
> It is not "my" conntrack-utils by any means. If users would not
> constantly insist on using outdated interfaces (and I _do_ grant
> things their transition time), and if maintainers would not always
> give in to these users, we would have less code to worry about, or
> even have these discussions.

So if the 'conntrack' utility invokes the sid->secctx translation in
formatting it's -L output then everyone should be happy. Non-programmers
get the text output that they want and there is no need to extend the
deprecated /proc interface.

-Tom
--=20
Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________


--------------enigBD9406B2281C782A6BB93053
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (Darwin)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkyb78oACgkQO/MAbZfjDLK5XQCguNSc4NISWBomME+146YBLcs2
068AoJjyUsf8UBZybnrsMX59LvpjINe0
=ybG/
-----END PGP SIGNATURE-----

--------------enigBD9406B2281C782A6BB93053--

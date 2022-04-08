From: Jeremy Sowden <jeremy@azazel.net>
Subject: Re: Error when using 'time' statement in nftables 1.0.2 rule
Date: Fri, 8 Apr 2022 09:08:58 +0100
Message-ID: <Yk/tmuXkGYrfhDh+@azazel.net>
References: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qT2dPs1kqD41PvQz"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=azazel.net;
        s=20190108; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=WD8BEXUlxbD1ZOdosecW7ZwProHFD7uql6E9gtty3dw=; b=bAVyyRyr1FnFb30KI2NnAmuvx4
        0wjhJ9epgkZJViLJLf3l25UcSURKDD6bi1MB17yX2jF6CKPedeW1pdqfflzxzLOh2zKmY+4KJCZAD
        rIYJ4jPVmPefXroS4RH6bnahzsedQewCDRnHV9NJb30Ulz+fRt3Iuz+hucc8h3EGzy9G0Kd0QDho8
        dq/akCApb5b0/Vf1IWH3x8JEUjGWZO65+lb8RXPk9fHa/vq+57Fo917O+UWfqGKWHcyXvxz4y+0PW
        HbVbl9oyfLjTe7h7nnd7SQ0Llr2DvqeZhfuiQL5/DOW52jZhIcabvI9HV4GM/hnGLa6lJyi0pGkEQ
        2//aw4G 
Content-Disposition: inline
In-Reply-To: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org


--qT2dPs1kqD41PvQz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2022-04-07, at 22:19:30 -0400, Martin Gignac wrote:
> On nftables 1.0.1, I can run this command just fine:
>=20
>     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" acce=
pt
>     nft>
>=20
> On 1.0.2, however, it gives me this error:
>=20
>     nft> add rule inet filter input iif lo time < "2022-07-01 11:00" acce=
pt
>     Error: No symbol type information
>     add rule inet filter input iif lo time < "2022-07-01 11:00" accept
>                                     ^^^^
> Have I encountered a bug, or has the usage of the 'time' statement
> simply changed?

It appears to be a bug.  I shall send a fix.

J.


--qT2dPs1kqD41PvQz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEbB20U2PvQDe9VtUXKYasCr3xBA0FAmJP7ZIACgkQKYasCr3x
BA2djBAAk4Mu7yiCD9oHh8AP0QWTWZwjwfg0ZJmBWrcx4HbzmKW1VApnn8qjMQ2u
AQRJwYwNs2UmEUlKJKfGyrUWdG9s8Qhz7cdCrp5r96+UamT4Lk2Ui2ijJ8B8IPNz
xLDUUXQ1RIfPoJiyXP3FNHcNykhxldIpqvASyUQ50IK52nY+pXutJlO5D9G9tenH
nT359VReLkr13O2QbNO30YOMGPKv8CuiWzb1/RhE7umihEEe5kR7kXUyiOVhK/DD
KjWLztWfpylkNZAP9ooK2mr/1N88O7oRHmPVsthRa00uvUb+R67c4OOQcIeaPLt2
StJLbbXZk2Je22r42sbn1PA80y28wCFpsnXMIqXfzOb8CZYPFA2bIh32azD7yU1a
MuLdnDSRcLocsLCdTyYTxB4c5Lj8hXQjlg2f8MHHdoArlCGTiK5u5Mjf8vjGZRGo
vYzbnTwFEoAdPy2HEP8PmSr33tnPjobiHZipVAGmkcPC75+09BRxchNUTYCLf7Fg
GTa5yAp4Iwit+lCieXdf44k31OeYwRGq3OEmKa7JkVcUXOCCjkRCEeig/ofcxR6K
e/fSaQlhnLscFUXpF1GjRBrJwgilKyygg5POOOYLB15VEdKsG8YSIKVcSoJP6QX8
JwhBA+5688w9Ep+OnjByyCar4V3gHiaH/KtRgvINSHsdVY0DdpY=
=DxiG
-----END PGP SIGNATURE-----

--qT2dPs1kqD41PvQz--

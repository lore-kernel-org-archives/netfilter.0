From: Eugene Crosser <crosser@average.org>
Subject: Re: nft named set address types
Date: Mon, 15 Nov 2021 18:59:14 +0100
Message-ID: <80e0abae-6035-7fe8-f7d7-5eb1983c8f8b@average.org>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
 <YYGeTgBAZfM76k4h@salvia>
 <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4h7GmNDoZfr8v7jRw6POHwmE"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=average.org; s=mail;
        t=1636999172; bh=JefuOFDLevmsH3gpxvs3Wqj9Zvk9YT8Fapk9loqNlns=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=cnfh/ZlCnL9JXBf3JOylCtsOc+ZOoWg2MZZZvaB7hpUaYzuxDCJOdyUxomeWgQO5v
         nlMzsjkuoHfJsUoTx6DhLiSciDYoJWwc7Tnac7M+1wqGCnpBibdhDmy30YDvO0jlrI
         oDQm47cDCAhRp8BN+Q8f7BeAHIKCoQKdbDl1Okn4=
Content-Language: en-GB
In-Reply-To: <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4h7GmNDoZfr8v7jRw6POHwmE
Content-Type: multipart/mixed; boundary="------------HvWqkRcw0dFNmXSb9S2UAW1K";
 protected-headers="v1"
From: Eugene Crosser <crosser@average.org>
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>
Message-ID: <80e0abae-6035-7fe8-f7d7-5eb1983c8f8b@average.org>
Subject: Re: nft named set address types
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
 <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
 <YYGeTgBAZfM76k4h@salvia>
 <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
In-Reply-To: <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>

--------------HvWqkRcw0dFNmXSb9S2UAW1K
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15/11/2021 18:40, Matt Zagrabelny wrote:

> I've tried:
>=20
> table inet filter {
>     chain icmp_ipv4 {
>         ip  saddr $icmp_networks_ipv4 accept
>     }
>=20
>     chain icmp_ipv6 {
>         ip6 saddr $icmp_networks_ipv6 accept
>     }
>=20
>     chain input {
>         meta protocol {icmp, icmpv6} vmap {
>             icmp: jump icmp_ipv4,
>             icmpv6: jump icmp_ipv6,
>         }
>     }
> }

This is simply incorrect syntax. You need it like this, I believe:

    <value> `vmap` {map with verdicts}

e.g.

table inet testfilter {

    chain icmp_ipv4 {

        accept

    }



    chain icmp_ipv6 {

        accept

    }

    chain input {

        meta protocol vmap {

            icmp: jump icmp_ipv4,

            icmpv6: jump icmp_ipv6,

        }

    }

}

Regards,

Eugene

--------------HvWqkRcw0dFNmXSb9S2UAW1K--

--------------4h7GmNDoZfr8v7jRw6POHwmE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEnAziRJw3ydIzIkaHfKQHw5GdRYwFAmGSn/IACgkQfKQHw5Gd
RYwljAf+IC6YUo+qJxQWFVMM4mj4wZ7h4go68y6RmS5qYDRyXegFbWlrrDXVHby0
DG1f0fQXyunyLDRMh60sW/yHv6ASekxVSxZauR2dZCxkYbpg5Wh5SkeG7Y9LzpNq
kf9ulvPL23XFCSv4okFUtF3ITTFka9y1b8MjVP0mv2OHxPfZw3u/k+3ymBNIDtc8
CJEEumAU8Y7LzjmTDLP5jPAqLEQrVv0QRwTQVFccy4Bca002p5hmNFkgIKrgmqqf
Erzt2VHikAZsoLHBCLarvAQ/1FRhnFCVoQEMIAhQgKf1/MFKt0pruOWlCzd42VRq
LxrTun++Ec354NV1ep21m3pacpHGGg==
=6v8w
-----END PGP SIGNATURE-----

--------------4h7GmNDoZfr8v7jRw6POHwmE--

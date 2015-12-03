From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Why isn't DNAT happening for host-originated packets?
Date: Thu, 3 Dec 2015 15:55:36 -0800
Message-ID: <CAKmUPx44yvsz21jRE9BoxK0D4R+gGjJdk9De5QQHUBzj6o9r6Q@mail.gmail.com>
References: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
	<5660CCD1.60807@familie-kuntze.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=GixnOKVrUmNj5py/UVBJXWwKnpIHQiy5mmys4ZX07+c=;
        b=ASa8x/K2CO2Jd0ymgIrn53QYZQtea/IieEo5KXSZwiOHlfeJ9mY8BEAE8+sYolmfTa
         xbRnO2BaCk2AEufR001it2nxS/kacDdAVXpAkmGvjq1WZzwQh7/j+YzgSfp2gC/lOv0S
         sTw+Y6Bwm+RalRROwL0eoaqWpBPWZ3AE4KjaAiPhDdRqjgjH4JeHtJz/cnkJ++Zt/YJy
         iL9/6GhTX98x3Uv71Oa3lAyYEoxaOw4fK7OUMAHGQhaQn8ihD/RKjZa3xAN7gz42vYhr
         4i+m7qP+XeyIKLGI8AHZqAhmZZaZor/cyEPKFZqT2qPnBgUPfn65BfdwHlEPbMjv/O07
         bG+w==
In-Reply-To: <5660CCD1.60807@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: netfilter@vger.kernel.org

That's an awesome graph, but all (non-tap) paths pass through
nat:PREROUTING, don't they?

Now I'm even more confused why host-generated packets seem to skip it. =
 :)

On Thu, Dec 3, 2015 at 3:14 PM, Noel Kuntze <noel@familie-kuntze.de> wr=
ote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Look at the packet flow graph. That's fairly up to date (but is missi=
ng the new *nat INPUT chain).
> http://inai.de/images/nf-packet-flow.png
>
> - --
>
> Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
> Noel Kuntze
>
> GPG Key ID: 0x63EC6658
> Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQIcBAEBCAAGBQJWYMzPAAoJEDg5KY9j7GZYKPsP/189soz785huEAVPb2vpaSEA
> QOGGJ0N2+amRccHSiMmDE/fnI4MRCUUWbiDS0PBJBSC0aKjhDkA7JRej8oWJaJYx
> Mjw6VhGmpwRHG5x1bWPcrj+Zx3EXYNOkVhZwu/SPgnagnUMtcN7y2SYtNwlArlAA
> twZhoKaVwB75NLqMzcOPNe68kyCyoE7wQNZcczR1HDURs6lWqQh7IyaRKQbX98aa
> J1oC6I5e4fqET90PcK2OC1txTRmdyPCCrLqU0yrceV1nO0QEQx+GSIsg+sz5dl9f
> Beno5AxzNEaeb0Bifq/PbmwKdTY2jC7QM+4/efwt4jXq/kkiV+VHu91LBbwEFPuM
> 0JLu9FVpSkXO+e8yVO2KoURYWBN0vKPKvs1qxf5Q37fFiDXmpKlrDS24ZE32xyja
> suBREsiAfz7z97NED/0pDQhU1Cf3TJBXHp0kWJSPRZAg7GYI1lnEkMutkD61wVj+
> /pNCO7MlLZ2ls8qZZpn7BJW8KoNt5N50DmJ/37zCD3kRHiHlG5OCX4vj2EcssRdz
> aQ+HW76S0Bqg+svikkPmBXQvLemh99/izt0DZyJKfC8JpVJhDDj0BallpD4JuZTi
> 5J2+9dmdgY7js+ATAEvSjT0zj/l3M8sxuqi+NSIWan8eHzWxRm8SRCIl5uQdK8f3
> rL/oXXhfJCy8ZRzNSp2T
> =3Djtdy
> -----END PGP SIGNATURE-----
>
